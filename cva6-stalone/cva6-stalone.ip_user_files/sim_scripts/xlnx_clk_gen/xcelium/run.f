-makelib xcelium_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_clk_gen/xlnx_clk_gen_clk_wiz.v" \
  "../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_clk_gen/xlnx_clk_gen.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

