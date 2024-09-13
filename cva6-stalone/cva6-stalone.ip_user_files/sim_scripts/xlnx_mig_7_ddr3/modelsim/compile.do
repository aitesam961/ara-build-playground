vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/xlnx_mig_7_ddr3_mig_sim.v" \
"../../../../../../../../Downloads/ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/xlnx_mig_7_ddr3.v" \

vlog -work xil_defaultlib \
"glbl.v"

