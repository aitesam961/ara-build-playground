onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+xlnx_mig_7_ddr3 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.xlnx_mig_7_ddr3 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {xlnx_mig_7_ddr3.udo}

run -all

endsim

quit -force
