# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-30182-b670/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/asus/Documents/ara-build-playground/CVA6_VPF/CVA6_VPF.cache/wt [current_project]
set_property parent.project_path /home/asus/Documents/ara-build-playground/CVA6_VPF/CVA6_VPF.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:genesys2:part0:1.1 [current_project]
set_property ip_output_repo /home/asus/Documents/ara-build-playground/CVA6_VPF/CVA6_VPF.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs {
  /home/asus/Documents/cva6/core/include
  /home/asus/Documents/cva6/vendor/pulp-platform/axi/include
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/include
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/include
} [current_fileset]
read_verilog {
  /home/asus/Documents/cva6/core/include/cvxif_types.svh
  /home/asus/Documents/cva6/core/include/rvfi_types.svh
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/include/hpdcache_typedef.svh
}
set_property file_type "Verilog Header" [get_files /home/asus/Documents/cva6/core/include/cvxif_types.svh]
set_property file_type "Verilog Header" [get_files /home/asus/Documents/cva6/core/include/rvfi_types.svh]
set_property file_type "Verilog Header" [get_files /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/include/hpdcache_typedef.svh]
read_verilog -library xil_defaultlib -sv {
  /home/asus/Documents/cva6/vendor/pulp-platform/fpga-support/rtl/AsyncDpRam.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/fpga-support/rtl/AsyncThreePortRam.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/fpga-support/rtl/SyncDpRam.sv
  /home/asus/Documents/cva6/core/include/config_pkg.sv
  /home/asus/Documents/cva6/core/include/cv64a6_imafdcv_sv39_config_pkg.sv
  /home/asus/Documents/cva6/core/include/riscv_pkg.sv
  /home/asus/Documents/cva6/core/include/ariane_pkg.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_pkg.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/cf_math_pkg.sv
  /home/asus/Documents/cva6/core/acc_dispatcher.sv
  /home/asus/Documents/cva6/core/alu.sv
  /home/asus/Documents/cva6/core/amo_buffer.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/axi/src/axi_pkg.sv
  /home/asus/Documents/cva6/corev_apu/tb/ariane_axi_pkg.sv
  /home/asus/Documents/cva6/core/ariane_regfile_ff.sv
  /home/asus/Documents/cva6/core/ariane_regfile_fpga.sv
  /home/asus/Documents/cva6/core/cache_subsystem/axi_adapter.sv
  /home/asus/Documents/cva6/core/axi_shim.sv
  /home/asus/Documents/cva6/core/frontend/bht.sv
  /home/asus/Documents/cva6/core/branch_unit.sv
  /home/asus/Documents/cva6/core/frontend/btb.sv
  /home/asus/Documents/cva6/core/include/build_config_pkg.sv
  /home/asus/Documents/cva6/core/include/std_cache_pkg.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cache_ctrl.sv
  /home/asus/Documents/cva6/core/commit_stage.sv
  /home/asus/Documents/cva6/core/compressed_decoder.sv
  /home/asus/Documents/cva6/core/cvxif_example/compressed_instr_decoder.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv
  /home/asus/Documents/cva6/core/controller.sv
  /home/asus/Documents/cva6/core/cvxif_example/include/cvxif_instr_pkg.sv
  /home/asus/Documents/cva6/core/cvxif_example/copro_alu.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/counter.sv
  /home/asus/Documents/cva6/core/csr_buffer.sv
  /home/asus/Documents/cva6/core/csr_regfile.sv
  /home/asus/Documents/cva6/core/include/wt_cache_pkg.sv
  /home/asus/Documents/cva6/core/cva6.sv
  /home/asus/Documents/cva6/core/cva6_accel_first_pass_decoder_stub.sv
  /home/asus/Documents/cva6/core/cva6_fifo_v3.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_pkg.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_hpdcache_if_adapter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_hpdcache_subsystem.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_hpdcache_subsystem_axi_arbiter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hwpf_stride/hwpf_stride_pkg.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_hpdcache_wrapper.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_icache.sv
  /home/asus/Documents/cva6/core/cache_subsystem/cva6_icache_axi_wrapper.sv
  /home/asus/Documents/cva6/core/cva6_mmu/cva6_mmu.sv
  /home/asus/Documents/cva6/core/cva6_mmu/cva6_ptw.sv
  /home/asus/Documents/cva6/core/cva6_rvfi_probes.sv
  /home/asus/Documents/cva6/core/cva6_mmu/cva6_shared_tlb.sv
  /home/asus/Documents/cva6/core/cva6_mmu/cva6_tlb.sv
  /home/asus/Documents/cva6/core/cvxif_compressed_if_driver.sv
  /home/asus/Documents/cva6/core/cvxif_example/cvxif_example_coprocessor.sv
  /home/asus/Documents/cva6/core/cvxif_fu.sv
  /home/asus/Documents/cva6/core/cvxif_issue_register_commit_if_driver.sv
  /home/asus/Documents/cva6/core/decoder.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/delta_counter.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv
  /home/asus/Documents/cva6/core/ex_stage.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/exp_backoff.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/fall_through_register.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/deprecated/fifo_v2.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/fifo_v3.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_cast_multi.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_classifier.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_divsqrt_multi.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_fma.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_fma_multi.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_noncomp.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_opgroup_block.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_opgroup_fmt_slice.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_opgroup_multifmt_slice.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_rounding.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpnew_top.sv
  /home/asus/Documents/cva6/core/fpu_wrap.sv
  /home/asus/Documents/cva6/core/frontend/frontend.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_1hot_to_binary.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_amo.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_cmo.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_core_arbiter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_ctrl.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_ctrl_pe.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_data_downsize.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_data_upsize.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_demux.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_fifo_reg.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_fxarb.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_lfsr.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/utils/hpdcache_mem_req_read_arbiter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/utils/hpdcache_mem_req_write_arbiter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/utils/hpdcache_mem_resp_demux.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/utils/hpdcache_mem_to_axi_read.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/utils/hpdcache_mem_to_axi_write.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_memctrl.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_miss_handler.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_mshr.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_mux.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_plru.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_prio_1hot_encoder.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_regbank_wbyteenable_1rw.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_regbank_wmask_1rw.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_rrarb.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_rtab.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_sram.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/macros/behav/hpdcache_sram_1rw.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_sram_wbyteenable.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/macros/behav/hpdcache_sram_wbyteenable_1rw.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_sram_wmask.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/macros/behav/hpdcache_sram_wmask_1rw.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/common/hpdcache_sync_buffer.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_uncached.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_victim_sel.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hpdcache_wbuf.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hwpf_stride/hwpf_stride.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hwpf_stride/hwpf_stride_arb.sv
  /home/asus/Documents/cva6/core/cache_subsystem/hpdcache/rtl/src/hwpf_stride/hwpf_stride_wrapper.sv
  /home/asus/Documents/cva6/core/id_stage.sv
  /home/asus/Documents/cva6/core/cvxif_example/instr_decoder.sv
  /home/asus/Documents/cva6/core/frontend/instr_queue.sv
  /home/asus/Documents/cva6/core/instr_realign.sv
  /home/asus/Documents/cva6/core/frontend/instr_scan.sv
  /home/asus/Documents/cva6/core/issue_read_operands.sv
  /home/asus/Documents/cva6/core/issue_stage.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/lfsr.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/lfsr_8bit.sv
  /home/asus/Documents/cva6/core/load_store_unit.sv
  /home/asus/Documents/cva6/core/load_unit.sv
  /home/asus/Documents/cva6/core/lsu_bypass.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/lzc.sv
  /home/asus/Documents/cva6/core/macro_decoder.sv
  /home/asus/Documents/cva6/core/cache_subsystem/miss_handler.sv
  /home/asus/Documents/cva6/core/mult.sv
  /home/asus/Documents/cva6/core/multiplier.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv
  /home/asus/Documents/cva6/core/perf_counters.sv
  /home/asus/Documents/cva6/core/pmp/src/pmp.sv
  /home/asus/Documents/cva6/core/pmp/src/pmp_entry.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/popcount.sv
  /home/asus/Documents/cva6/core/cvfpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv
  /home/asus/Documents/cva6/core/frontend/ras.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/rr_arb_tree.sv
  /home/asus/Documents/cva6/core/scoreboard.sv
  /home/asus/Documents/cva6/core/serdiv.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/shift_reg.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/deprecated/sram.sv
  /home/asus/Documents/cva6/core/cache_subsystem/std_cache_subsystem.sv
  /home/asus/Documents/cva6/core/cache_subsystem/std_nbdcache.sv
  /home/asus/Documents/cva6/core/store_buffer.sv
  /home/asus/Documents/cva6/core/store_unit.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/stream_arbiter.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/stream_arbiter_flushable.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/stream_demux.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/stream_mux.sv
  /home/asus/Documents/cva6/core/cache_subsystem/tag_cmp.sv
  /home/asus/Documents/cva6/vendor/pulp-platform/common_cells/src/unread.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_axi_adapter.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_cache_subsystem.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_dcache.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_dcache_ctrl.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_dcache_mem.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_dcache_missunit.sv
  /home/asus/Documents/cva6/core/cache_subsystem/wt_dcache_wbuffer.sv
  /home/asus/Documents/cva6/corev_apu/src/ariane.sv
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/asus/Documents/cva6/corev_apu/fpga/constraints/genesys-2.xdc
set_property used_in_implementation false [get_files /home/asus/Documents/cva6/corev_apu/fpga/constraints/genesys-2.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top ariane -part xc7k325tffg900-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ariane.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file ariane_utilization_synth.rpt -pb ariane_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]