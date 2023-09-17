// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Oct  3 21:32:11 2022
// Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/leds_ifat6/leds_ifat6_stub.v
// Design      : leds_ifat6
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module leds_ifat6(led_in, led_out_tristate)
/* synthesis syn_black_box black_box_pad_pin="led_in[7:0],led_out_tristate[7:0]" */;
  input [7:0]led_in;
  inout [7:0]led_out_tristate;
endmodule
