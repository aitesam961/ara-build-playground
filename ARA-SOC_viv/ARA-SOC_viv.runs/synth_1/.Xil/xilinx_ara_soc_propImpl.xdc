set_property SRC_FILE_INFO {cfile:/home/asus/Documents/ara-build-playground/ARA-SOC_viv/ARA-SOC_viv.srcs/constrs_1/imports/asus/Downloads/Genesys-2-Master.xdc rfile:../../../ARA-SOC_viv.srcs/constrs_1/imports/asus/Downloads/Genesys-2-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD12  IOSTANDARD LVDS     } [get_ports { clk_i }]; #IO_L12P_T1_MRCC_33 Sch=sysclk_p
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { rst_ni }]; #IO_0_14 Sch=cpu_resetn
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y23   IOSTANDARD LVCMOS33 } [get_ports { rx_i }]; #IO_L1P_T0_12 Sch=uart_rx_out
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y20   IOSTANDARD LVCMOS33 } [get_ports { tx_o }]; #IO_0_12 Sch=uart_tx_in
