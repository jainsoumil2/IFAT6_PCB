// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Oct  3 21:32:12 2022
// Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/leds_ifat6/leds_ifat6_sim_netlist.v
// Design      : leds_ifat6
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module leds_ifat6
   (led_in,
    led_out_tristate);
  input [7:0]led_in;
  (* X_INTERFACE_INFO = "opalkelly.com:interface:led_tristate:1.0 led_out_tristate LED_OUT_TRISTATE" *) inout [7:0]led_out_tristate;

  wire [7:0]led_in;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [7:0]led_out_tristate;

  leds_ifat6_led inst
       (.led_in(led_in),
        .led_out_tristate(led_out_tristate));
endmodule

(* ORIG_REF_NAME = "led" *) 
module leds_ifat6_led
   (led_in,
    led_out_tristate);
  input [7:0]led_in;
  inout [7:0]led_out_tristate;

  wire T0;
  wire \genblk1[0].IOBUF_i_i_1_n_0 ;
  wire \genblk1[1].IOBUF_i_i_1_n_0 ;
  wire \genblk1[2].IOBUF_i_i_1_n_0 ;
  wire \genblk1[3].IOBUF_i_i_1_n_0 ;
  wire \genblk1[4].IOBUF_i_i_1_n_0 ;
  wire \genblk1[5].IOBUF_i_i_1_n_0 ;
  wire \genblk1[6].IOBUF_i_i_1_n_0 ;
  wire [7:0]led_in;
  wire [7:0]led_out_tristate;
  wire \NLW_genblk1[0].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[1].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[2].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[3].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[4].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[5].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[6].IOBUF_i_O_UNCONNECTED ;
  wire \NLW_genblk1[7].IOBUF_i_O_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[0].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[0]),
        .O(\NLW_genblk1[0].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[0].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[0].IOBUF_i_i_1 
       (.I0(led_in[0]),
        .O(\genblk1[0].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[1].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[1]),
        .O(\NLW_genblk1[1].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[1].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[1].IOBUF_i_i_1 
       (.I0(led_in[1]),
        .O(\genblk1[1].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[2].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[2]),
        .O(\NLW_genblk1[2].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[2].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[2].IOBUF_i_i_1 
       (.I0(led_in[2]),
        .O(\genblk1[2].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[3].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[3]),
        .O(\NLW_genblk1[3].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[3].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[3].IOBUF_i_i_1 
       (.I0(led_in[3]),
        .O(\genblk1[3].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[4].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[4]),
        .O(\NLW_genblk1[4].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[4].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[4].IOBUF_i_i_1 
       (.I0(led_in[4]),
        .O(\genblk1[4].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[5].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[5]),
        .O(\NLW_genblk1[5].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[5].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[5].IOBUF_i_i_1 
       (.I0(led_in[5]),
        .O(\genblk1[5].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[6].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[6]),
        .O(\NLW_genblk1[6].IOBUF_i_O_UNCONNECTED ),
        .T(\genblk1[6].IOBUF_i_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[6].IOBUF_i_i_1 
       (.I0(led_in[6]),
        .O(\genblk1[6].IOBUF_i_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[7].IOBUF_i 
       (.I(1'b0),
        .IO(led_out_tristate[7]),
        .O(\NLW_genblk1[7].IOBUF_i_O_UNCONNECTED ),
        .T(T0));
  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[7].IOBUF_i_i_1 
       (.I0(led_in[7]),
        .O(T0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
