onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xlnx_axi_gpio_opt

do {wave.do}

view wave
view structure
view signals

do {xlnx_axi_gpio.udo}

run -all

quit -force
