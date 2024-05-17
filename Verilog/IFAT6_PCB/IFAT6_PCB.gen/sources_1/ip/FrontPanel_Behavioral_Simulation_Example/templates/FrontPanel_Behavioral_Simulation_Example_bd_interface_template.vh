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
    (* X_INTERFACE_INFO = "opalkelly.com:interface:wirein:1.0 wirein13_DESCRIPTION EP_DATAOUT" *)
    input  wire [31:0] wi13_ep_dataout_DESCRIPTION,

//----------------------------------------------------------------------------------------------------------------------------------
// TriggerIns
//----------------------------------------------------------------------------------------------------------------------------------
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin48_DESCRIPTION EP_TRIGGER" *)
    input  wire [31:0] ti48_ep_trigger_DESCRIPTION,
    (* X_INTERFACE_INFO = "opalkelly.com:interface:triggerin:1.0 triggerin48_DESCRIPTION EP_CLK" *)
    output wire        ti48_ep_clk_DESCRIPTION,

