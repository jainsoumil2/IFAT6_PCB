//------------------------------------------------------------------------
// File: leds_0_driver.v
// Creation Date: Tue 05/07/2024 at 21:24:33 -0400
// IP Version: opalkelly.com:ip:leds:1.0 (Rev: 4)
// Tool Version: Vivado v2023.2.2 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022-2024 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none

module led (
    input  wire [7:0] led_in,
    inout  wire [7:0] led_out_tristate
);

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin
        IOBUF IOBUF_i (
          .O (),           // Buffer output
          .IO(led_out_tristate[i]), // Buffer inout port (connect directly to top-level port)
          .I (1'b0),       // Buffer input
          .T (~led_in[i])  // 3-state enable input, high=input, low=output
        );
    end
endgenerate

endmodule
`default_nettype wire
