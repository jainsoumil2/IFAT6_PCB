//----------------------------------------------------------------------------------------------------------
// Generated TCL Command to Recreate IP 
//----------------------------------------------------------------------------------------------------------
// Relevant Documentation Resources:
//   - "Configuration Parameters" Technical Reference for more information about the CONFIG parameters.
//   - "Regenerate Configuration through TCL" How-To Guide for an example of utilizing this command.
//

create_ip -name frontpanel -vendor opalkelly.com -library ip -version 1.0 -module_name FrontPanel_IFAT6
set_property -dict [list \
CONFIG.BOARD {XEM7310-A200} \
CONFIG.WI.COUNT {13} \
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
CONFIG.WI.ADDR_10 {0x0a} \
CONFIG.WI.ADDR_11 {0x0b} \
CONFIG.WI.ADDR_12 {0x0c} \
CONFIG.WO.COUNT {5} \
CONFIG.WO.ADDR_0 {0x20} \
CONFIG.WO.ADDR_1 {0x21} \
CONFIG.WO.ADDR_2 {0x22} \
CONFIG.WO.ADDR_3 {0x23} \
CONFIG.WO.ADDR_4 {0x24} \
CONFIG.TI.COUNT {3} \
CONFIG.TI.ADDR_0 {0x40} \
CONFIG.TI.ADDR_1 {0x41} \
CONFIG.TI.ADDR_2 {0x42} \
CONFIG.PO.COUNT {1} \
CONFIG.PO.ADDR_0 {0xa0} \
] [get_ips FrontPanel_IFAT6]
