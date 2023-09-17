onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib frontpanel_ifat6_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {frontpanel_ifat6.udo}

run -all

quit -force
