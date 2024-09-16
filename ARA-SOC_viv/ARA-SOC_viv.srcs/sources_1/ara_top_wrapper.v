
module ara_top_wrapper(
    input  wire         sys_clk_p,
    input  wire         sys_clk_n,
    input  wire         rst_ni,
//    output reg [63:0]   exit_o,
    input  wire         rx_i,
    output           tx_o
        
    );
    
    
    wire clk_i;
    clk_wiz_0 CW0
   (
    .clk_out1(clk_i),     // output clk_out1
    .reset(rst_ni), // input reset
    .locked(),       // output locked
    .clk_in1_p(sys_clk_p),  
    .clk_in1_n(sys_clk_n)
    );   
    
    
    xilinx_ara_soc XSOC(
        .clk_i  (clk_i ),
        .rst_ni (rst_ni),
        .exit_o (),

        .rx_i   (rx_i),
        .tx_o   (tx_o)
    );
    
    
endmodule
