//------------------------------------------------------------------------
// File: leds_ifat6.v
// Creation Date: Mon 10/03/2022 at 21:31:32 PDT
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 0)
// Tool Version: Vivado v2022.1 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module leds_ifat6(
  led_in,
  led_out_tristate
);

input wire [7 : 0] led_in;
(* X_INTERFACE_INFO = "opalkelly.com:interface:led_tristate:1.0 led_out_tristate LED_OUT_TRISTATE" *)
inout wire [7 : 0] led_out_tristate;

  led inst (
    .led_in(led_in),
    .led_out_tristate(led_out_tristate)
  );
  
endmodule
`default_nettype wire
