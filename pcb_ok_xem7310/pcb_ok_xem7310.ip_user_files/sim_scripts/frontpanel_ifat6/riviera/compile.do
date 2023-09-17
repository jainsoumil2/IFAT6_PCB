vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/common" "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel" "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/templates" \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/common" "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel" "+incdir+../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/templates" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/frontpanel_ifat6_wrapper_simulation.v" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel/okHost.v" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel/okWireOR.v" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel/okWireIn.v" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/FrontPanel/okWireOut.v" \
"../../../../pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/gateware/simulation/frontpanel_ifat6_simulation.v" \

vlog -work xil_defaultlib \
"glbl.v"

