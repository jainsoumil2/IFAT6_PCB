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

reg [2:0] counter1;
reg spi_clk;

// Generate 5MHz clock for SPI circuit
always @(posedge okClk) begin
    if (counter1 == 2) begin
        spi_clk     <= ~spi_clk;
        counter1    <= 0;
        end 
    else begin
        counter1    <= counter1 + 1;
        end
    end    

dac_fsm_moore DAC1(
    .rd(),
    .wr(),
    .spi_clk(),
    .rst(),
    .data_spi_in(),
    
    .SCK(),
    .SYNCB(),
    .SDI(),
    .WPn(),
    .HOLDn(),
    .MISO()   
);

dac_fsm_moore DAC2(
    .rd(),
    .wr(),
    .spi_clk(),
    .rst(),
    .data_spi_in(),
    
    .SCK(),
    .SYNCB(),
    .SDI(),
    .WPn(),
    .HOLDn(),
    .MISO()   
    );

dac_fsm_moore DAC3(
    .rd(),
    .wr(),
    .spi_clk(),
    .rst(),
    .data_spi_in(),
    
    .SCK(),
    .SYNCB(),
    .SDI(),
    .WPn(),
    .HOLDn(),
    .MISO()   
);

dac_fsm_moore DAC4(
    .rd(),
    .wr(),
    .spi_clk(),
    .rst(),
    .data_spi_in(),
    
    .SCK(),
    .SYNCB(),
    .SDI(),
    .WPn(),
    .HOLDn(),
    .MISO()   
);

dac_fsm_moore DAC5(
    .rd(),
    .wr(),
    .spi_clk(),
    .rst(),
    .data_spi_in(),
    
    .SCK(),
    .SYNCB(),
    .SDI(),
    .WPn(),
    .HOLDn(),
    .MISO()      
);

adc_fsm_moore ADC(
    .reset_adc(reset_adc),
    .clk_adc(clk_adc),
    .trig(trig_adc),
    .datain(datain_adc),
    .sdo(sdo_adc),
    .sdi(sdi_adc),
    .csb(syncb_adc),
    .sclk(sclk_adc),
    .done(done_adc),
    .dataout(dataout_adc)   
);

frontpanel_ifat6 OK_IFAT6 (
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
