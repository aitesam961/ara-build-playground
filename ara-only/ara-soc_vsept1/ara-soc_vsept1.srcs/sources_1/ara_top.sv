
`include "axi/assign.svh"
`include "axi/typedef.svh"
`include "common_cells/registers.svh"
  
localparam type                   axi_data_t   = logic [64-1:0];
localparam type                   axi_strb_t   = logic [64/8-1:0];
localparam type                   axi_addr_t   = logic [64-1:0];
localparam type                   axi_user_t   = logic [1-1:0];
localparam type                   axi_id_t     = logic [5-1:0];
    
    
// Ariane's AXI port data width
localparam AxiNarrowDataWidth = 64;
localparam AxiNarrowStrbWidth = AxiNarrowDataWidth / 8;
// Ara's AXI port data width
localparam AxiWideDataWidth   = 64;
localparam AXiWideStrbWidth   = AxiWideDataWidth / 8;

localparam AxiSocIdWidth  = 5 - $clog2(1);
localparam AxiCoreIdWidth = AxiSocIdWidth - 1;

// Internal types
typedef logic [AxiNarrowDataWidth-1:0] axi_narrow_data_t;
typedef logic [AxiNarrowStrbWidth-1:0] axi_narrow_strb_t;
typedef logic [AxiSocIdWidth-1:0] axi_soc_id_t;
typedef logic [AxiCoreIdWidth-1:0] axi_core_id_t;


`AXI_TYPEDEF_ALL(ara_axi, axi_addr_t, axi_core_id_t, axi_data_t, axi_strb_t, axi_user_t)  

module ara_top import axi_pkg::*; import ara_pkg::*; #(
    // RVV Parameters
    parameter  int           unsigned NrLanes      = 2,                          // Number of parallel vector lanes.
    parameter  int           unsigned VLEN         = 128,                          // VLEN [bit]
    // Support for floating-point data types
    parameter  fpu_support_e          FPUSupport   = FPUSupportHalfSingleDouble,
    // External support for vfrec7, vfrsqrt7
    parameter  fpext_support_e        FPExtSupport = FPExtSupportEnable,
    // Support for fixed-point data types
    parameter  fixpt_support_e        FixPtSupport = FixedPointEnable,
    // AXI Interface
    parameter  int           unsigned AxiDataWidth = 32*NrLanes,
    parameter  int           unsigned AxiAddrWidth = 64,
    parameter  int           unsigned AxiUserWidth = 1,
    parameter  int           unsigned AxiIdWidth   = 5,
    // AXI Resp Delay [ps] for gate-level simulation
    parameter  int           unsigned AxiRespDelay = 200,
    // Main memory
    parameter  int           unsigned L2NumWords   = (2**22) / NrLanes,
    // Dependant parameters. DO NOT CHANGE!
    localparam type                   axi_data_t   = logic [AxiDataWidth-1:0],
    localparam type                   axi_strb_t   = logic [AxiDataWidth/8-1:0],
    localparam type                   axi_addr_t   = logic [AxiAddrWidth-1:0],
    localparam type                   axi_user_t   = logic [AxiUserWidth-1:0],
    localparam type                   axi_id_t     = logic [AxiIdWidth-1:0]
  ) (
    input  logic        clk_i,
    input  logic        rst_ni,
    // Scan chain
    input  logic        scan_enable_i,
    input  logic        scan_data_i,
    output logic        scan_data_o,

    input   cva6_to_acc_t   acc_req,
    output  acc_to_cva6_t   acc_resp,
    
`ifdef INVAL_ENABLE
    output  ara_axi_req_t   ara_axi_req_inval,
    input   ara_axi_resp_t  ara_axi_resp_inval
`else
    output  ara_axi_req_t   ara_axi_req_o,
    input   ara_axi_resp_t  ara_axi_resp_i
`endif

  );


  // Accelerator ports
  logic                                 acc_resp_valid;
  logic                                 acc_resp_ready;
  logic                                 acc_cons_en;
  logic              [AxiAddrWidth-1:0] inval_addr;
  logic                                 inval_valid;
  logic                                 inval_ready;

//  // Support max 8 cores, for now
//  logic [63:0] hart_id;
//  assign hart_id = {'0, hart_id_i};

  // Pack invalidation interface into acc interface
  acc_to_cva6_t acc_resp_pack;
  always_comb begin : pack_inval
    acc_resp_pack                      = acc_resp;
    acc_resp_pack.acc_resp.inval_valid = inval_valid;
    acc_resp_pack.acc_resp.inval_addr  = inval_addr;
    inval_ready                        = acc_req.acc_req.inval_ready;
    acc_cons_en                        = acc_req.acc_req.acc_cons_en;
  end
  
ara_axi_req_t   ara_axi_req_local ;
ara_axi_resp_t  ara_axi_resp_local;

ara #(
    .NrLanes     (NrLanes           ),
    .VLEN        (VLEN              ),
    .FPUSupport  (FPUSupport        ),
    .FPExtSupport(FPExtSupport      ),
    .FixPtSupport(FixPtSupport      ),
    .AxiDataWidth(AxiWideDataWidth  ),
    .AxiAddrWidth(AxiAddrWidth      ),
    .axi_ar_t    (ara_axi_ar_chan_t),
    .axi_r_t     (ara_axi_r_chan_t ),
    .axi_aw_t    (ara_axi_aw_chan_t),
    .axi_w_t     (ara_axi_w_chan_t ),
    .axi_b_t     (ara_axi_b_chan_t ),
    .axi_req_t   (ara_axi_req_t     ),
    .axi_resp_t  (ara_axi_resp_t    )
  ) i_ara (
    .clk_i           (clk_i         ),
    .rst_ni          (rst_ni        ),
    .scan_enable_i   (scan_enable_i ),
    .scan_data_i     (1'b0          ),
    .scan_data_o     (/* Unused */  ),
    .acc_req_i       (acc_req       ),
    .acc_resp_o      (acc_resp      ),
`ifdef INVAL_ENABLE
    .axi_req_o       (ara_axi_req_local ),
    .axi_resp_i      (ara_axi_resp_local)
`else
    .axi_req_o       (ara_axi_req_o ),
    .axi_resp_i      (ara_axi_resp_i)

`endif
  );



`ifdef INVAL_ENABLE
  axi_inval_filter #(
    .MaxTxns    (4                              ),
    .AddrWidth  (AxiAddrWidth                   ),
    .L1LineWidth(ariane_pkg::DCACHE_LINE_WIDTH/8),
    .aw_chan_t  (ara_axi_aw_chan_t              ),
    .req_t      (ara_axi_req_t                  ),
    .resp_t     (ara_axi_resp_t                 )
  ) i_axi_inval_filter (
    .clk_i        (clk_i             ),
    .rst_ni       (rst_ni            ),
    .en_i         (acc_cons_en       ),
    .slv_req_i    (ara_axi_req_local ),
    .slv_resp_o   (ara_axi_resp_local),
    .mst_req_o    (ara_axi_req_inval ),
    .mst_resp_i   (ara_axi_resp_inval),
    .inval_addr_o (inval_addr        ),
    .inval_valid_o(inval_valid       ),
    .inval_ready_i(inval_ready       )

  );
`endif

endmodule : ara_top
