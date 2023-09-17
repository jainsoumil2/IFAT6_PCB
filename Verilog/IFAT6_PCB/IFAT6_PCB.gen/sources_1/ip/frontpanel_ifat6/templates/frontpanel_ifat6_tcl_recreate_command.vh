//----------------------------------------------------------------------------------------------------------
// Generated TCL Command to Recreate IP 
//----------------------------------------------------------------------------------------------------------
// Relevant Documentation Resources:
//   - "Configuration Parameters" Technical Reference for more information about the CONFIG parameters.
//   - "Regenerate Configuration through TCL" How-To Guide for an example of utilizing this command.
//

create_ip -name frontpanel -vendor opalkelly.com -library ip -version 1.0 -module_name frontpanel_ifat6
set_property -dict [list \
CONFIG.BOARD {XEM7310-A200} \
CONFIG.WI.COUNT {10} \
CONFIG.WI.ADDR_0 {0x00} \
CONFIG.WI.ADDR_1 {0x01} \
CONFIG.WI.ADDR_2 {0x02} \
CONFIG.WI.ADDR_3 {0x03} \
CONFIG.WI.ADDR_4 {0x04} \
CONFIG.WI.ADDR_5 {0x05} \
CONFIG.WI.ADDR_6 {0x06} \
CONFIG.WI.ADDR_7 {0x07} \
CONFIG.WI.ADDR_8 {0x08} \
CONFIG.WI.ADDR_9 {0x09} \
CONFIG.WO.COUNT {10} \
CONFIG.WO.ADDR_0 {0x20} \
CONFIG.WO.ADDR_1 {0x21} \
CONFIG.WO.ADDR_2 {0x22} \
CONFIG.WO.ADDR_3 {0x23} \
CONFIG.WO.ADDR_4 {0x24} \
CONFIG.WO.ADDR_5 {0x25} \
CONFIG.WO.ADDR_6 {0x26} \
CONFIG.WO.ADDR_7 {0x27} \
CONFIG.WO.ADDR_8 {0x28} \
CONFIG.WO.ADDR_9 {0x29} \
] [get_ips frontpanel_ifat6]
