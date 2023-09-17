//------------------------------------------------------------------------
// File: frontpanel_ifat6_wrapper_synthesis.v
// Creation Date: Fri 12/23/2022 at 18:01:03 PST
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 0)
// Tool Version: Vivado v2022.1 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module frontpanel_ifat6_wrapper_synthesis(
    // Precompiler directive to inline ports and define interfaces for all requested endpoints
    `include "generated_ports.vh"
	);


// Target interface bus:
wire [112:0] okHE;
wire [64:0]  okEH;

// Instantiate the okHost and connect endpoints.
wire [65*6-1:0]  okEHx;

okHost okHI(
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE), 
	.okEH(okEH)
);

okWireOR # (.N(6)) wireOR (okEH, okEHx);

okWireIn     wi00   (.okHE(okHE),                             .ep_addr(8'h00), .ep_dataout(wi00_ep_dataout));
okWireIn     wi01   (.okHE(okHE),                             .ep_addr(8'h01), .ep_dataout(wi01_ep_dataout));
okWireIn     wi02   (.okHE(okHE),                             .ep_addr(8'h02), .ep_dataout(wi02_ep_dataout));
okWireIn     wi03   (.okHE(okHE),                             .ep_addr(8'h03), .ep_dataout(wi03_ep_dataout));
okWireIn     wi04   (.okHE(okHE),                             .ep_addr(8'h04), .ep_dataout(wi04_ep_dataout));
okWireIn     wi05   (.okHE(okHE),                             .ep_addr(8'h05), .ep_dataout(wi05_ep_dataout));
okWireIn     wi06   (.okHE(okHE),                             .ep_addr(8'h06), .ep_dataout(wi06_ep_dataout));
okWireIn     wi07   (.okHE(okHE),                             .ep_addr(8'h07), .ep_dataout(wi07_ep_dataout));
okWireIn     wi08   (.okHE(okHE),                             .ep_addr(8'h08), .ep_dataout(wi08_ep_dataout));
okWireIn     wi09   (.okHE(okHE),                             .ep_addr(8'h09), .ep_dataout(wi09_ep_dataout));
okWireIn     wi0a   (.okHE(okHE),                             .ep_addr(8'h0a), .ep_dataout(wi0a_ep_dataout));
okWireIn     wi0b   (.okHE(okHE),                             .ep_addr(8'h0b), .ep_dataout(wi0b_ep_dataout));
okWireIn     wi0c   (.okHE(okHE),                             .ep_addr(8'h0c), .ep_dataout(wi0c_ep_dataout));
okWireIn     wi0d   (.okHE(okHE),                             .ep_addr(8'h0d), .ep_dataout(wi0d_ep_dataout));
okWireOut    wo20   (.okHE(okHE), .okEH(okEHx[ 0*65 +: 65 ]), .ep_addr(8'h20), .ep_datain(wo20_ep_datain));
okWireOut    wo21   (.okHE(okHE), .okEH(okEHx[ 1*65 +: 65 ]), .ep_addr(8'h21), .ep_datain(wo21_ep_datain));
okWireOut    wo22   (.okHE(okHE), .okEH(okEHx[ 2*65 +: 65 ]), .ep_addr(8'h22), .ep_datain(wo22_ep_datain));
okWireOut    wo23   (.okHE(okHE), .okEH(okEHx[ 3*65 +: 65 ]), .ep_addr(8'h23), .ep_datain(wo23_ep_datain));
okWireOut    wo24   (.okHE(okHE), .okEH(okEHx[ 4*65 +: 65 ]), .ep_addr(8'h24), .ep_datain(wo24_ep_datain));
okWireOut    wo25   (.okHE(okHE), .okEH(okEHx[ 5*65 +: 65 ]), .ep_addr(8'h25), .ep_datain(wo25_ep_datain));

endmodule
`default_nettype wire
