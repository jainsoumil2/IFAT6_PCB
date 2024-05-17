//------------------------------------------------------------------------
// File: FrontPanel_Behavioral_Simulation_Example_synthesis.v
// Creation Date: Sun 04/07/2024 at 11:21:19 -0700
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 5)
// Tool Version: Vivado v2023.2.2 (64-bit)
// Opal Kelly Board: XEM7310MT-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022-2024 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module FrontPanel_Behavioral_Simulation_Example(
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
);

FrontPanel_Behavioral_Simulation_Example_wrapper_synthesis inst (
    .wi13_ep_dataout(wi13_ep_dataout),
    .ti48_ep_trigger(ti48_ep_trigger),
    .ti48_ep_clk(ti48_ep_clk),
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA),
    .okClk(okClk)   
);

endmodule
`default_nettype wire
