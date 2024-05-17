`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 09:32:59 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top( 
    input  wire [4:0]   okUH,
	output wire [2:0]   okHU,
	inout  wire [31:0]  okUHU,
	inout  wire         okAA,
    
    input  wire         sys_clkp,
	input  wire         sys_clkn,
	//input wire          clk_in1_p,
	//input wire          clk_in1_n,
	
    inout  wire [7:0] led_out_tristate,
    
    output wire DAC1_LDACb, DAC2_LDACb, DAC3_LDACb, DAC4_LDACb, DAC5_LDACb,
    output wire DAC1_CLRb, DAC2_CLRb, DAC3_CLRb, DAC4_CLRb, DAC5_CLRb,
    output wire DAC_SCLK,
    output wire DAC1_SDI, DAC2_SDI, DAC3_SDI, DAC4_SDI, DAC5_SDI,
    output wire DAC1_SYNCb, DAC2_SYNCb, DAC3_SYNCb, DAC4_SYNCb, DAC5_SYNCb,
    
    output wire ADC_CSb, ADC_SCLK, ADC_SDI,
    output wire PROBE_CLK_ADC, PROBE_CLK_DAC, PROBE_CLK_300M,
    
    output wire INPUT_DATA0, INPUT_DATA1, INPUT_DATA2, INPUT_DATA3,                     // IFAT6.
                INPUT_DATA4, INPUT_DATA5, INPUT_DATA6, INPUT_DATA7,
                INPUT_DATA8, INPUT_DATA9, INPUT_DATA10, INPUT_DATA11,
                INPUT_DATA12, INPUT_DATA13, INPUT_DATA14, INPUT_DATA15,
                INPUT_DATA16, INPUT_DATA17, INPUT_DATA18, INPUT_DATA19,
                INPUT_DATA20, INPUT_DATA21, INPUT_DATA22, INPUT_DATA23,
                INPUT_DATA_REQ, SHIFT_REG_D, COL_SHIFT_REG_CLK, ROW_SHIFT_REG_CLK,
                ASYNC_RST, SHIFT_REG_SET, ARRAY_SHIFT_REG_CLK, OUTPUT_DATA_ACK,
                PULSE_GEN_RST, _setLFSR, resetIFAT,
    
    input wire  ADC_SDO,            
    input wire  INPUT_DATA_ACK, OUTPUT_DATA0, OUTPUT_DATA1, OUTPUT_DATA2,               // IFAT6.
                OUTPUT_DATA3, OUTPUT_DATA4, OUTPUT_DATA5, OUTPUT_DATA6,
                OUTPUT_DATA7, OUTPUT_DATA8, OUTPUT_DATA9, OUTPUT_DATA10,
                OUTPUT_DATA11, OUTPUT_DATA12, OUTPUT_DATA13, OUTPUT_DATA_REQ
    );

// Clock.
// wire sys_clk;
// IBUFGDS osc_clk(.O(sys_clk), .I(sys_clkp), .IB(sys_clkn));

// Target Interface Bus.
wire okClk;

// Endpoint Connections.
wire [31:0] wi00_ep_dataout, wi01_ep_dataout, wi02_ep_dataout, wi03_ep_dataout, 
            wi04_ep_dataout, wi05_ep_dataout, wi06_ep_dataout, wi07_ep_dataout,
            wi08_ep_dataout, wi09_ep_dataout, wi0a_ep_dataout, wi0b_ep_dataout,
            wi0c_ep_dataout;
wire [31:0] wo20_ep_datain, wo21_ep_datain;       
wire [31:0] ti40_ep_trigger;
wire ti40_ep_clk;
wire spi_clk;                           // 50MHz clock output from 'clocking wizard' IP.
assign ti40_ep_clk = spi_clk;

// DACs
wire DAC1_SCLK, DAC2_SCLK, DAC3_SCLK, DAC4_SCLK, DAC5_SCLK; 
assign DAC_SCLK     = DAC1_SCLK | DAC2_SCLK | DAC3_SCLK | DAC4_SCLK | DAC5_SCLK;
assign DAC1_LDACb   = wi02_ep_dataout[0];
assign DAC2_LDACb   = wi02_ep_dataout[1];
assign DAC3_LDACb   = wi02_ep_dataout[2];
assign DAC4_LDACb   = wi02_ep_dataout[3];
assign DAC5_LDACb   = wi02_ep_dataout[4];
assign DAC1_CLRb 	= wi03_ep_dataout[0];
assign DAC2_CLRb 	= wi03_ep_dataout[1];
assign DAC3_CLRb 	= wi03_ep_dataout[2];
assign DAC4_CLRb 	= wi03_ep_dataout[3];
assign DAC5_CLRb 	= wi03_ep_dataout[4]; 

/*
DAC8568 DAC1(
    .TRIGGER(ti40_ep_trigger[0]),
    .CLK_MASTER(spi_clk),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC1_SYNCb),
    .SCLK(DAC1_SCLK),
    .SDI(DAC1_SDI) 
);

DAC8568 DAC2(
    .TRIGGER(ti40_ep_trigger[1]),
    .CLK_MASTER(spi_clk),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC2_SYNCb),
    .SCLK(DAC2_SCLK),
    .SDI(DAC2_SDI) 
);

DAC8568 DAC3(
    .TRIGGER(ti40_ep_trigger[2]),
    .CLK_MASTER(spi_clk),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC3_SYNCb),
    .SCLK(DAC3_SCLK),
    .SDI(DAC3_SDI) 
);

DAC8568 DAC4(   
    .TRIGGER(ti40_ep_trigger[3]),
    .CLK_MASTER(spi_clk),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC4_SYNCb),
    .SCLK(DAC4_SCLK),
    .SDI(DAC4_SDI) 
);

DAC8568 DAC5(      
    .TRIGGER(ti40_ep_trigger[4]),
    .CLK_MASTER(spi_clk),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC5_SYNCb),
    .SCLK(DAC5_SCLK),
    .SDI(DAC5_SDI) 
);


// ADC
reg [31:0] ADS7067_SPI_Input;
reg [31:0] ADS7067_SCLK_Low_Time;
reg [31:0] ADS7067_SCLK_High_Time;
reg [31:0] ADS7067_Frame_Size;
reg [31:0] ADS7067_Num_Samples;
reg [31:0] ADS7067_Conv_Time;

wire [3:0] State_Machine_Addr;
assign State_Machine_Addr = wi06_ep_dataout[3:0];

always @ (posedge okClk) begin	
	case (State_Machine_Addr)

	1:  begin      // ADS7067 ADC Controller State Machine.
			ADS7067_SCLK_Low_Time 	<= wi07_ep_dataout;
			ADS7067_SCLK_High_Time 	<= wi08_ep_dataout;
			ADS7067_SPI_Input       <= wi09_ep_dataout;
			ADS7067_Frame_Size 		<= wi0a_ep_dataout;
			ADS7067_Num_Samples     <= wi0b_ep_dataout;
			ADS7067_Conv_Time       <= wi0c_ep_dataout;
		end
    
    endcase
end

ADS7067 ADC(
    .TRIGGER(ti40_ep_trigger[5]),
    .CLK_MASTER(okClk),
    .RST(wi00_ep_dataout[2]),
    .SDO(ADC_SDO),
    .SPI_DATA(ADS7067_SPI_Input),
    .LOW_TIME(ADS7067_SCLK_Low_Time),
    .HIGH_TIME(ADS7067_SCLK_High_Time),
    .FRAME_SIZE(ADS7067_Frame_Size),
	.NUM_SAMPLES(ADS7067_Num_Samples),
	.CONV_TIME(ADS7067_Conv_Time),
	
    .SYNCb_reg(ADC_CSb),
    .SCLK_reg(ADC_SCLK),
    .SDI_reg(ADC_SDI),
    .ADC_OUT_reg(wo20_ep_datain)
);
*/

// Pin Assignments.
assign DAC1_SYNCb           = 1'b1;
assign DAC1_SCLK            = 1'b0;
assign DAC1_SDI             = 1'b0;
assign DAC2_SYNCb           = 1'b1;
assign DAC2_SCLK            = 1'b0;
assign DAC2_SDI             = 1'b0;
assign DAC3_SYNCb           = 1'b1;
assign DAC3_SCLK            = 1'b0;
assign DAC3_SDI             = 1'b0;
assign DAC4_SYNCb           = 1'b1;
assign DAC4_SCLK            = 1'b0;
assign DAC4_SDI             = 1'b0;
assign DAC5_SYNCb           = 1'b1;
assign DAC5_SCLK            = 1'b0;
assign DAC5_SDI             = 1'b0;
assign wo20_ep_datain       = 32'haaaa_aaaa;
assign wo21_ep_datain       = 32'h5555_5555;
assign ADC_CSb              = 1'b1;
assign ADC_SCLK             = 1'b0;
assign ADC_SDI              = 1'b0;
assign PROBE_CLK_DAC        = wi00_ep_dataout[3] ? spi_clk:1'b0;
// assign PROBE_CLK_ADC     = sys_clk;
assign PROBE_CLK_ADC        = 1'b0;
assign PROBE_CLK_300M       = 1'b0; 
assign ROW_SHIFT_REG_CLK    = wi05_ep_dataout[0];
assign COL_SHIFT_REG_CLK    = wi05_ep_dataout[1];
assign {INPUT_DATA3, INPUT_DATA2, INPUT_DATA1, INPUT_DATA0} = wi04_ep_dataout[3:0];
assign INPUT_DATA4          = 1'b0;
assign INPUT_DATA5          = 1'b0;
assign INPUT_DATA6          = 1'b0; 
assign INPUT_DATA7          = 1'b0;
assign INPUT_DATA8          = 1'b0;
assign INPUT_DATA9          = 1'b0;
assign INPUT_DATA10         = 1'b0;
assign INPUT_DATA11         = 1'b0;
assign INPUT_DATA12         = 1'b0;
assign INPUT_DATA13         = 1'b0;
assign INPUT_DATA14         = 1'b0;
assign INPUT_DATA15         = 1'b0;
assign INPUT_DATA16         = 1'b0;
assign INPUT_DATA17         = 1'b0;
assign INPUT_DATA18         = 1'b0;
assign INPUT_DATA19         = 1'b0;
assign INPUT_DATA20         = 1'b0;
assign INPUT_DATA21         = 1'b0;
assign INPUT_DATA22         = 1'b0;
assign INPUT_DATA23         = 1'b0;
assign INPUT_DATA_REQ       = 1'b0;
assign SHIFT_REG_D          = 1'b0;
assign ASYNC_RST            = 1'b0;
assign SHIFT_REG_SET        = 1'b0;
assign ARRAY_SHIFT_REG_CLK  = 1'b0;
assign OUTPUT_DATA_ACK      = 1'b0;
assign PULSE_GEN_RST        = 1'b0;
assign _setLFSR             = 1'b0;
assign resetIFAT            = 1'b0;

FrontPanel_IFAT6 OK_IFAT6 (
  .okUH(okUH),                        // input wire [4 : 0] okUH
  .okHU(okHU),                        // output wire [2 : 0] okHU
  .okUHU(okUHU),                      // inout wire [31 : 0] okUHU
  .okAA(okAA),                        // inout wire okAA
  .okClk(okClk),                      // output wire okClk
  .wi00_ep_dataout(wi00_ep_dataout),  // output wire [31 : 0] wi00_ep_dataout
  .wi01_ep_dataout(wi01_ep_dataout),  // output wire [31 : 0] wi01_ep_dataout
  .wi02_ep_dataout(wi02_ep_dataout),  // output wire [31 : 0] wi02_ep_dataout
  .wi03_ep_dataout(wi03_ep_dataout),  // output wire [31 : 0] wi03_ep_dataout
  .wi04_ep_dataout(wi04_ep_dataout),  // output wire [31 : 0] wi04_ep_dataout
  .wi05_ep_dataout(wi05_ep_dataout),  // output wire [31 : 0] wi05_ep_dataout
  .wi06_ep_dataout(wi06_ep_dataout),  // output wire [31 : 0] wi06_ep_dataout
  .wi07_ep_dataout(wi07_ep_dataout),  // output wire [31 : 0] wi07_ep_dataout
  .wi08_ep_dataout(wi08_ep_dataout),  // output wire [31 : 0] wi08_ep_dataout
  .wi09_ep_dataout(wi09_ep_dataout),  // output wire [31 : 0] wi09_ep_dataout
  .wi0a_ep_dataout(wi0a_ep_dataout),  // output wire [31 : 0] wi0a_ep_dataout
  .wi0b_ep_dataout(wi0b_ep_dataout),  // output wire [31 : 0] wi0b_ep_dataout
  .wi0c_ep_dataout(wi0c_ep_dataout),  // output wire [31 : 0] wi0c_ep_dataout
  .wo20_ep_datain(wo20_ep_datain),    // input wire [31 : 0] wo20_ep_datain
  .wo21_ep_datain(wo21_ep_datain),    // input wire [31 : 0] wo21_ep_datain
  .ti40_ep_trigger(ti40_ep_trigger),  // output wire [31 : 0] ti40_ep_trigger
  .ti40_ep_clk(ti40_ep_clk)           // input wire ti40_ep_clk
    );

leds_0 LEDS_IFAT6 (
  .led_in(8'h0f),                     // input wire [7 : 0] led_in
  .led_out_tristate(led_out_tristate) // inout wire [7 : 0] led_out_tristate
    );

// Clock Wizard.
wire clk_rst;                           // Reset input for clock
wire locked;
assign clk_rst = wi00_ep_dataout[0]; 

clk_wiz_0 CLK_DAC_100M  (
    .clk_out1(spi_clk),         // output clk_out1
    .reset(clk_rst),            // input reset
    .locked(locked),            // output locked
    .clk_in1_p(sys_clkp),      // input clk_in1_p
    .clk_in1_n(sys_clkn)       // input clk_in1_n
    );

endmodule