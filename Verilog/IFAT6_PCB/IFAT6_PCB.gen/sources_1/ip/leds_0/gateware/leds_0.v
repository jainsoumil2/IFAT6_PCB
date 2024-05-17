//------------------------------------------------------------------------
// File: leds_0.v
// Creation Date: Tue 05/07/2024 at 21:24:33 -0400
// IP Version: opalkelly.com:ip:leds:1.0 (Rev: 4)
// Tool Version: Vivado v2023.2.2 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022-2024 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module leds_0(
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
