############################################################################
## System Clock On XEM7310MT-A200
############################################################################
set_property PACKAGE_PIN W11 [get_ports {sys_clkp}]
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkp}]

set_property PACKAGE_PIN W12 [get_ports {sys_clkn}]
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkn}]

create_clock -name sys_clk -period 5 [get_ports sys_clkp]

############################################################################
## Asyncronous Clocks
############################################################################
# okUH[0] is used to produce okClk on the IP instantiation
set_clock_groups -name async-groups -asynchronous \
-group [get_clocks -include_generated_clocks -of_objects [get_ports okUH[0]]] \
-group [get_clocks -include_generated_clocks sys_clk]
