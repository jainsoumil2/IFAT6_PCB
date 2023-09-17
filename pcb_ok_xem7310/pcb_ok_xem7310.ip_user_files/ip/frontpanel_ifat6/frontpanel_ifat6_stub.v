// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Dec 23 18:02:32 2022
// Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/frontpanel_ifat6_stub.v
// Design      : frontpanel_ifat6
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module frontpanel_ifat6(wi00_ep_dataout, wi01_ep_dataout, 
  wi02_ep_dataout, wi03_ep_dataout, wi04_ep_dataout, wi05_ep_dataout, wi06_ep_dataout, 
  wi07_ep_dataout, wi08_ep_dataout, wi09_ep_dataout, wi0a_ep_dataout, wi0b_ep_dataout, 
  wi0c_ep_dataout, wi0d_ep_dataout, wo20_ep_datain, wo21_ep_datain, wo22_ep_datain, 
  wo23_ep_datain, wo24_ep_datain, wo25_ep_datain, okUH, okHU, okUHU, okAA, okClk)
/* synthesis syn_black_box black_box_pad_pin="wi00_ep_dataout[31:0],wi01_ep_dataout[31:0],wi02_ep_dataout[31:0],wi03_ep_dataout[31:0],wi04_ep_dataout[31:0],wi05_ep_dataout[31:0],wi06_ep_dataout[31:0],wi07_ep_dataout[31:0],wi08_ep_dataout[31:0],wi09_ep_dataout[31:0],wi0a_ep_dataout[31:0],wi0b_ep_dataout[31:0],wi0c_ep_dataout[31:0],wi0d_ep_dataout[31:0],wo20_ep_datain[31:0],wo21_ep_datain[31:0],wo22_ep_datain[31:0],wo23_ep_datain[31:0],wo24_ep_datain[31:0],wo25_ep_datain[31:0],okUH[4:0],okHU[2:0],okUHU[31:0],okAA,okClk" */;
  output [31:0]wi00_ep_dataout;
  output [31:0]wi01_ep_dataout;
  output [31:0]wi02_ep_dataout;
  output [31:0]wi03_ep_dataout;
  output [31:0]wi04_ep_dataout;
  output [31:0]wi05_ep_dataout;
  output [31:0]wi06_ep_dataout;
  output [31:0]wi07_ep_dataout;
  output [31:0]wi08_ep_dataout;
  output [31:0]wi09_ep_dataout;
  output [31:0]wi0a_ep_dataout;
  output [31:0]wi0b_ep_dataout;
  output [31:0]wi0c_ep_dataout;
  output [31:0]wi0d_ep_dataout;
  input [31:0]wo20_ep_datain;
  input [31:0]wo21_ep_datain;
  input [31:0]wo22_ep_datain;
  input [31:0]wo23_ep_datain;
  input [31:0]wo24_ep_datain;
  input [31:0]wo25_ep_datain;
  input [4:0]okUH;
  output [2:0]okHU;
  inout [31:0]okUHU;
  inout okAA;
  output okClk;
endmodule
