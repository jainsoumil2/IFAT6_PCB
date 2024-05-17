//----------------------------------------------------------------------------------------------------------
// Generated TCL Command to Recreate IP 
//----------------------------------------------------------------------------------------------------------
// Relevant Documentation Resources:
//   - "Configuration Parameters" Technical Reference for more information about the CONFIG parameters.
//   - "Regenerate Configuration through TCL" How-To Guide for an example of utilizing this command.
//

create_ip -name frontpanel -vendor opalkelly.com -library ip -version 1.0 -module_name FrontPanel_Behavioral_Simulation_Example
set_property -dict [list \
CONFIG.BOARD {XEM7310MT-A200} \
CONFIG.WI.COUNT {1} \
CONFIG.WI.ADDR_0 {0x13} \
CONFIG.TI.COUNT {1} \
CONFIG.TI.ADDR_0 {0x48} \
] [get_ips FrontPanel_Behavioral_Simulation_Example]
