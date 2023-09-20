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
    output wire DAC1_LDACB, DAC2_LDACB, DAC3_LDACB, DAC4_LDACB, DAC5_LDACB,
    output wire DAC1_CLRB, DAC2_CLRB, DAC3_CLRB, DAC4_CLRB, DAC5_CLRB,
    output wire DAC_SCLK,
    output wire DAC1_SDI, DAC2_SDI, DAC3_SDI, DAC4_SDI, DAC5_SDI,
    output wire DAC1_SYNCB, DAC2_SYNCB, DAC3_SYNCB, DAC4_SYNCB, DAC5_SYNCB,
    
    output wire ADC_CSb, ADC_SCLK, ADC_SDI, ADC_SDO,
    output wire PROBE_CLK_ADC, PROBE_CLK_DAC, PROBE_CLK_300M,
    
    output wire INPUT_DATA0, INPUT_DATA1, INPUT_DATA2, INPUT_DATA3,
                INPUT_DATA4, INPUT_DATA5, INPUT_DATA6, INPUT_DATA7,
                INPUT_DATA8, INPUT_DATA9, INPUT_DATA10, INPUT_DATA11,
                INPUT_DATA12, INPUT_DATA13, INPUT_DATA14, INPUT_DATA15,
                INPUT_DATA16, INPUT_DATA17, INPUT_DATA18, INPUT_DATA19,
                INPUT_DATA20, INPUT_DATA21, INPUT_DATA22, INPUT_DATA23,
                INPUT_DATA_REQ, SHIFT_REG_D, COL_SHIFT_REG_CLK, ROW_SHIFT_REG_CLK,
                ASYNC_RST, SHIFT_REG_SET, ARRAY_SHIFT_REG_CLK, OUTPUT_DATA_ACK,
                PULSE_GEN_RST, _setLFSR, resetIFAT,
                
    input wire  INPUT_DATA_ACK, OUTPUT_DATA0, OUTPUT_DATA1, OUTPUT_DATA2,
                OUTPUT_DATA3, OUTPUT_DATA4, OUTPUT_DATA5, OUTPUT_DATA6,
                OUTPUT_DATA7, OUTPUT_DATA8, OUTPUT_DATA9, OUTPUT_DATA10,
                OUTPUT_DATA11, OUTPUT_DATA12, OUTPUT_DATA13, OUTPUT_DATA_REQ
    );     


wire [31:0] wi00_ep_dataout;
wire [31:0] wi01_ep_dataout;
wire [31:0] wi02_ep_dataout;
wire [31:0] wi03_ep_dataout;
wire [31:0] wi04_ep_dataout;
wire [31:0] wi05_ep_dataout;
wire [31:0] wi06_ep_dataout;
wire [31:0] wi07_ep_dataout;
wire [31:0] wi08_ep_dataout;
wire [31:0] wi09_ep_dataout;
 
 
wire [31:0] wi20_ep_dataout;
wire [31:0] wi21_ep_dataout;
wire [31:0] wi22_ep_dataout;
wire [31:0] wi23_ep_dataout;
wire [31:0] wi24_ep_dataout;
wire [31:0] wi25_ep_dataout;
wire [31:0] wi26_ep_dataout;
wire [31:0] wi27_ep_dataout;
wire [31:0] wi28_ep_dataout;
wire [31:0] wi29_ep_dataout; 

wire spi_clk;   // output 50MHz clock from the 'clocking wizard' IP
wire clk_rst;   // Reset input for 

assign clk_rst  = wi00_ep_dataout[6]; 
    
clk_50M CLK_DAC(
// Clock out ports
.clk_out1(spi_clk),     // output clk_out1
// Status and control signals
.reset(clk_rst), // input reset
.locked(locked),       // output locked
// Clock in ports
.clk_in1(okClk)      // input clk_in1
);

wire dac_rst, DAC1_SCK, DAC2_SCK, DAC3_SCK, DAC4_SCK, DAC5_SCK; 
wire [4:0] dac_wr;
wire [31:0] dac_data;
 
assign dac_rst  = wi00_ep_dataout[5]; 
assign DAC_SCK  = DAC1_SCK | DAC2_SCK | DAC3_SCK | DAC4_SCK | DAC5_SCK;
assign dac_wr   = wi00_ep_dataout[4:0];
assign dac_data = wi01_ep_dataout;

dac DAC1(
    .wr(dac_wr[0]),
    .spi_clk(spi_clk),
    .rst(dac_rst),
    .data(dac_data),
    .SCK(DAC1_SCK),
    .SYNCB(DAC1_SYNCB),
    .SDI(DAC1_SDI) 
);

dac DAC2(
    .wr(dac_wr[1]),
    .spi_clk(spi_clk),
    .rst(dac_rst),
    .data(dac_data),
    .SCK(DAC2_SCK),
    .SYNCB(DAC2_SYNCB),
    .SDI(DAC2_SDI) 
);

dac DAC3(
    .wr(dac_wr[2]),
    .spi_clk(spi_clk),
    .rst(dac_rst),
    .data(dac_data),
    .SCK(DAC3_SCK),
    .SYNCB(DAC3_SYNCB),
    .SDI(DAC3_SDI) 
);

dac DAC4(   
    .wr(dac_wr[3]),
    .spi_clk(spi_clk),
    .rst(dac_rst),
    .data(dac_data),
    .SCK(DAC4_SCK),
    .SYNCB(DAC4_SYNCB),
    .SDI(DAC4_SDI) 
);

dac DAC5(      
    .wr(dac_wr[4]),
    .spi_clk(spi_clk),
    .rst(dac_rst),
    .data(dac_data),
    .SCK(DAC5_SCK),
    .SYNCB(DAC5_SYNCB),
    .SDI(DAC5_SDI) 
);

//adc_fsm_moore ADC(
//    .reset_adc(reset_adc),
//    .reset_adc(reset_adc),
//    .clk_adc(clk_adc),
//    .trig(trig_adc),
//    .datain(datain_adc),
//    .sdo(sdo_adc),
//    .sdi(sdi_adc),
//    .csb(syncb_adc),
//    .sclk(sclk_adc),
//    .done(done_adc),
//    .dataout(dataout_adc)   
//);

//Assigning outputs to unused wireout pins 
assign wo20_ep_datain = 32'b0;
assign wo21_ep_datain = 32'b0;
assign wo22_ep_datain = 32'b0;
assign wo23_ep_datain = 32'b0;
assign wo24_ep_datain = 32'b0;
assign wo25_ep_datain = 32'b0;
assign wo26_ep_datain = 32'b0;
assign wo27_ep_datain = 32'b0;
assign wo28_ep_datain = 32'b0;
assign wo29_ep_datain = 32'b0;

frontpanel_IFAT6 OK_IFAT6 (
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
  .wo20_ep_datain(wo20_ep_datain),    // input wire [31 : 0] wo20_ep_datain
  .wo21_ep_datain(wo21_ep_datain),    // input wire [31 : 0] wo21_ep_datain
  .wo22_ep_datain(wo22_ep_datain),    // input wire [31 : 0] wo22_ep_datain
  .wo23_ep_datain(wo23_ep_datain),    // input wire [31 : 0] wo23_ep_datain
  .wo24_ep_datain(wo24_ep_datain),    // input wire [31 : 0] wo24_ep_datain
  .wo25_ep_datain(wo25_ep_datain),    // input wire [31 : 0] wo25_ep_datain
  .wo26_ep_datain(wo26_ep_datain),    // input wire [31 : 0] wo26_ep_datain
  .wo27_ep_datain(wo27_ep_datain),    // input wire [31 : 0] wo27_ep_datain
  .wo28_ep_datain(wo28_ep_datain),    // input wire [31 : 0] wo28_ep_datain
  .wo29_ep_datain(wo29_ep_datain)    // input wire [31 : 0] wo29_ep_datain
);
   
    
endmodule
