//----------------------------------------------------------------------------------------------------------------------------------
// Generated Port Definitions for Creating Endpoint Interfaces in RTL for use in the IPI Block Designer
//----------------------------------------------------------------------------------------------------------------------------------
// Relevant Documentation Resources:
//   - "IPI Block Designer" Getting Started tutorial for an example of utilizing these port definitions.
//   - "Port Naming Convention" Technical Reference and "Naming Convention Benefits" Discussion.
//   - "Share Ports in IPI" Technical Reference for an example on sharing ports with multiple RTL modules.
//
// Substitute the appended "DESCRIPTION" tag with the utility the endpoint is providing to your RTL module.

//----------------------------------------------------------------------------------------------------------------------------------
// WireIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein00_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi00_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein01_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi01_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein02_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi02_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein03_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi03_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein04_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi04_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein05_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi05_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein06_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi06_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein07_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi07_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein08_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi08_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein09_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi09_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0a_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi0a_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0b_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi0b_ep_dataout_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein0c_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi0c_ep_dataout_DESCRIPTION,

//----------------------------------------------------------------------------------------------------------------------------------
// WireOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout20_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] wo20_ep_datain_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout21_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] wo21_ep_datain_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout22_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] wo22_ep_datain_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout23_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] wo23_ep_datain_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:wireout:1.0 wireout24_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] wo24_ep_datain_DESCRIPTION,

//----------------------------------------------------------------------------------------------------------------------------------
// TriggerIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40_DESCRIPTION EP_TRIGGER" *)
    input  wire [31:0] ti40_ep_trigger_DESCRIPTION,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin40_DESCRIPTION EP_CLK" *)
    output wire        ti40_ep_clk_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin41_DESCRIPTION EP_TRIGGER" *)
    input  wire [31:0] ti41_ep_trigger_DESCRIPTION,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin41_DESCRIPTION EP_CLK" *)
    output wire        ti41_ep_clk_DESCRIPTION,

    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin42_DESCRIPTION EP_TRIGGER" *)
    input  wire [31:0] ti42_ep_trigger_DESCRIPTION,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin42_DESCRIPTION EP_CLK" *)
    output wire        ti42_ep_clk_DESCRIPTION,

//----------------------------------------------------------------------------------------------------------------------------------
// PipeOuts
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:pipeout:1.0 pipeouta0_DESCRIPTION EP_DATAIN" *)
    output wire [31:0] poa0_ep_datain_DESCRIPTION,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:pipeout:1.0 pipeouta0_DESCRIPTION EP_READ" *)
    input  wire        poa0_ep_read_DESCRIPTION,

