//------------------------------------------------------------------------
// File: frontpanel_ifat6_simulation.v
// Creation Date: Tue 08/01/2023 at 20:02:18 -0700
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 2)
// Tool Version: Vivado v2023.1 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022-2023 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module frontpanel_ifat6(
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

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout25 EP_DATAIN" *)
    input  wire [31:0] wo25_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout26 EP_DATAIN" *)
    input  wire [31:0] wo26_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout27 EP_DATAIN" *)
    input  wire [31:0] wo27_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout28 EP_DATAIN" *)
    input  wire [31:0] wo28_ep_datain,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout29 EP_DATAIN" *)
    input  wire [31:0] wo29_ep_datain,

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
);

frontpanel_ifat6_wrapper_simulation inst (
    .wi00_ep_dataout(wi00_ep_dataout),
    .wi01_ep_dataout(wi01_ep_dataout),
    .wi02_ep_dataout(wi02_ep_dataout),
    .wi03_ep_dataout(wi03_ep_dataout),
    .wi04_ep_dataout(wi04_ep_dataout),
    .wi05_ep_dataout(wi05_ep_dataout),
    .wi06_ep_dataout(wi06_ep_dataout),
    .wi07_ep_dataout(wi07_ep_dataout),
    .wi08_ep_dataout(wi08_ep_dataout),
    .wi09_ep_dataout(wi09_ep_dataout),
    .wo20_ep_datain(wo20_ep_datain),
    .wo21_ep_datain(wo21_ep_datain),
    .wo22_ep_datain(wo22_ep_datain),
    .wo23_ep_datain(wo23_ep_datain),
    .wo24_ep_datain(wo24_ep_datain),
    .wo25_ep_datain(wo25_ep_datain),
    .wo26_ep_datain(wo26_ep_datain),
    .wo27_ep_datain(wo27_ep_datain),
    .wo28_ep_datain(wo28_ep_datain),
    .wo29_ep_datain(wo29_ep_datain),
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA),
    .okClk(okClk)   
);

endmodule
`default_nettype wire
