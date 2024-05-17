//----------------------------------------------------------------------------------------------------------------------------------
// WireIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein00 EP_DATAOUT" *)
    output wire [31:0] wi00_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein01 EP_DATAOUT" *)
    output wire [31:0] wi01_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein02 EP_DATAOUT" *)
    output wire [31:0] wi02_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein03 EP_DATAOUT" *)
    output wire [31:0] wi03_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein04 EP_DATAOUT" *)
    output wire [31:0] wi04_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein05 EP_DATAOUT" *)
    output wire [31:0] wi05_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein06 EP_DATAOUT" *)
    output wire [31:0] wi06_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein07 EP_DATAOUT" *)
    output wire [31:0] wi07_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein08 EP_DATAOUT" *)
    output wire [31:0] wi08_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein09 EP_DATAOUT" *)
    output wire [31:0] wi09_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0a EP_DATAOUT" *)
    output wire [31:0] wi0a_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0b EP_DATAOUT" *)
    output wire [31:0] wi0b_ep_dataout,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0c EP_DATAOUT" *)
    output wire [31:0] wi0c_ep_dataout,

//----------------------------------------------------------------------------------------------------------------------------------
// WireOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout20 EP_DATAIN" *)
    input  wire [31:0] wo20_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout21 EP_DATAIN" *)
    input  wire [31:0] wo21_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout22 EP_DATAIN" *)
    input  wire [31:0] wo22_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout23 EP_DATAIN" *)
    input  wire [31:0] wo23_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout24 EP_DATAIN" *)
    input  wire [31:0] wo24_ep_datain,

//----------------------------------------------------------------------------------------------------------------------------------
// TriggerIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40 EP_TRIGGER" *)
    output wire [31:0] ti40_ep_trigger,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40 EP_CLK" *)
    input  wire        ti40_ep_clk,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin41 EP_TRIGGER" *)
    output wire [31:0] ti41_ep_trigger,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin41 EP_CLK" *)
    input  wire        ti41_ep_clk,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin42 EP_TRIGGER" *)
    output wire [31:0] ti42_ep_trigger,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin42 EP_CLK" *)
    input  wire        ti42_ep_clk,

//----------------------------------------------------------------------------------------------------------------------------------
// PipeOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:pipeout:1.0 pipeouta0 EP_DATAIN" *)
    input  wire [31:0] poa0_ep_datain,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:pipeout:1.0 pipeouta0 EP_READ" *)
    output wire        poa0_ep_read,

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
