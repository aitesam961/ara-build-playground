vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ARA-SOC_viv.srcs/sources_1/ip/ila_axi/hdl/verilog" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ARA-SOC_viv.srcs/sources_1/ip/ila_axi/hdl/verilog" \
"../../../../ARA-SOC_viv.srcs/sources_1/ip/ila_axi/sim/ila_axi.v" \

vlog -work xil_defaultlib \
"glbl.v"

