onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xlnx_axi_quad_spi_opt

do {wave.do}

view wave
view structure
view signals

do {xlnx_axi_quad_spi.udo}

run -all

quit -force
