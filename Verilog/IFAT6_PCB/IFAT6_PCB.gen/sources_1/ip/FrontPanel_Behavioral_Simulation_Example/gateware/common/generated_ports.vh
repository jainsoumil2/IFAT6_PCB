//----------------------------------------------------------------------------------------------------------------------------------
// WireIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein13 EP_DATAOUT" *)
    output wire [31:0] wi13_ep_dataout,

//----------------------------------------------------------------------------------------------------------------------------------
// TriggerIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin48 EP_TRIGGER" *)
    output wire [31:0] ti48_ep_trigger,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin48 EP_CLK" *)
    input  wire        ti48_ep_clk,

//----------------------------------------------------------------------------------------------------------------------------------
// Host Interface
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUH" *)
    input  wire [4 : 0] okUH,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okHU" *)
    output wire [2 : 0] okHU,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okUHU" *)
    inout  wire [31 : 0] okUHU,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:host_interface:1.0 host_interface okAA" *)
    inout  wire okAA,
    output wire okClk
