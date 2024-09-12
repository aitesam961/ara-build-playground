// Author: Muhammad Aitesam 
// Description:
// CLK Converter -  differential to single ended
//      
//      
//      Compatible with Xilinx's Design Guide
//      
//      Uses Input buffer for LVDS to standard cell single ended clock conversion
//      
//      

module clk_buffer(
    input           sys_clk_p,
    input           sys_clk_n,
    
    output          clk_o

    );
    
    
    IBUFDS #(
    .IOSTANDARD("LVDS"),
    .IBUF_LOW_PWR("FALSE")
  ) i_sysclk_iobuf (
    .I(sys_clk_p),
    .IB(sys_clk_n),
    .O(clk_o)
  );
    
endmodule
