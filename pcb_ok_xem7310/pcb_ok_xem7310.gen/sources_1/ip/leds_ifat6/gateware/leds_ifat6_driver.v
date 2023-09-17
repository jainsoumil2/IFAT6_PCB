//------------------------------------------------------------------------
// File: leds_ifat6_driver.v
// Creation Date: Mon 10/03/2022 at 21:31:32 PDT
// IP Version: opalkelly.com:ip:frontpanel:1.0 (Rev: 0)
// Tool Version: Vivado v2022.1 (64-bit)
// Opal Kelly Board: XEM7310-A200 (Part: xc7a200tfbg484-1)
// 
// Copyright (c) 2022 Opal Kelly Incorporated
//------------------------------------------------------------------------

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
