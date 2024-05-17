//------------------------------------------------------------------------
// File: FrontPanel_Behavioral_Simulation_Example_wrapper_simulation.v
// Creation Date: Sun 04/07/2024 at 11:21:19 -0700
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 5)
// Tool Version: Vivado v2023.2.2 (64-bit)
// Opal Kelly Board: XEM7310MT-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022-2024 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module FrontPanel_Behavioral_Simulation_Example_wrapper_simulation(
    // Precompiler directive to inline ports and define interfaces for all requested endpoints
    `include "generated_ports.vh"
	);


// Target interface bus:
wire [112:0] okHE;
wire [64:0]  okEH;

// Instantiate the okHost and connect endpoints.
wire [65*0-1:0]  okEHx;

okHost okHI(
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE), 
	.okEH(okEH)
);

okWireOR # (.N(0)) wireOR (okEH, okEHx);

okWireIn     wi13   (.okHE(okHE),                             .ep_addr(8'h13), .ep_dataout(wi13_ep_dataout));
okTriggerIn  ti48   (.okHE(okHE),                             .ep_addr(8'h48), .ep_clk(ti48_ep_clk), .ep_trigger(ti48_ep_trigger));

endmodule
`default_nettype wire
