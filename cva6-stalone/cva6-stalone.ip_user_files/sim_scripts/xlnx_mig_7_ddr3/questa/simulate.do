onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xlnx_mig_7_ddr3_opt

do {wave.do}

view wave
view structure
view signals

do {xlnx_mig_7_ddr3.udo}

run -all

quit -force
