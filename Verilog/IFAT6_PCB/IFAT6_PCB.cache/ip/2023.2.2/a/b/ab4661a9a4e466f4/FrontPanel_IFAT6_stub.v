// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Mon Apr 15 15:32:07 2024
// Host        : IFAT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FrontPanel_IFAT6_stub.v
// Design      : FrontPanel_IFAT6
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(wi00_ep_dataout, wi01_ep_dataout, 
  wi02_ep_dataout, wi03_ep_dataout, wi04_ep_dataout, wi05_ep_dataout, wi06_ep_dataout, 
  wi07_ep_dataout, wi08_ep_dataout, wi09_ep_dataout, wi0a_ep_dataout, wi0b_ep_dataout, 
  wi0c_ep_dataout, wo20_ep_datain, ti40_ep_trigger, ti40_ep_clk, okUH, okHU, okUHU, okAA, okClk)
/* synthesis syn_black_box black_box_pad_pin="wi00_ep_dataout[31:0],wi01_ep_dataout[31:0],wi02_ep_dataout[31:0],wi03_ep_dataout[31:0],wi04_ep_dataout[31:0],wi05_ep_dataout[31:0],wi06_ep_dataout[31:0],wi07_ep_dataout[31:0],wi08_ep_dataout[31:0],wi09_ep_dataout[31:0],wi0a_ep_dataout[31:0],wi0b_ep_dataout[31:0],wi0c_ep_dataout[31:0],wo20_ep_datain[31:0],ti40_ep_trigger[31:0],okUH[4:0],okHU[2:0],okUHU[31:0],okAA" */
/* synthesis syn_force_seq_prim="ti40_ep_clk" */
/* synthesis syn_force_seq_prim="okClk" */;
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
  input [31:0]wo20_ep_datain;
  output [31:0]ti40_ep_trigger;
  input ti40_ep_clk /* synthesis syn_isclock = 1 */;
  input [4:0]okUH;
  output [2:0]okHU;
  inout [31:0]okUHU;
  inout okAA;
  output okClk /* synthesis syn_isclock = 1 */;
endmodule
