// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Sat May 11 17:37:38 2024
// Host        : IFAT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top fifo_generator_0 -prefix
//               fifo_generator_0_ fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2.2" *)
module fifo_generator_0(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  wr_ack, overflow, empty, valid, underflow, rd_data_count, wr_data_count, wr_rst_busy, 
  rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="rst,din[31:0],wr_en,rd_en,dout[31:0],full,wr_ack,overflow,empty,valid,underflow,rd_data_count[16:0],wr_data_count[16:0],wr_rst_busy,rd_rst_busy" */
/* synthesis syn_force_seq_prim="wr_clk" */
/* synthesis syn_force_seq_prim="rd_clk" */;
  input rst;
  input wr_clk /* synthesis syn_isclock = 1 */;
  input rd_clk /* synthesis syn_isclock = 1 */;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output wr_ack;
  output overflow;
  output empty;
  output valid;
  output underflow;
  output [16:0]rd_data_count;
  output [16:0]wr_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
