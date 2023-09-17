vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu \
"/Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/leds_ifat6/leds_ifat6_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

