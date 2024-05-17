set_property IOSTANDARD LVCMOS15 [get_ports {led_out_tristate[*]}]
set_property DRIVE 8 [get_ports {led_out_tristate[*]}]
set_false_path -to [get_ports {led_out_tristate[*]}]
set_false_path -from [get_ports {led_out_tristate[*]}]
