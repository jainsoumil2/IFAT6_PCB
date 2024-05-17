`timescale 1ns / 1ps

module ADC_tb;

reg TRIGGER, CLK, RST, SDO; 
reg [31:0] SPI_DATA;
reg [31:0] LOW_TIME, HIGH_TIME;
reg [31:0] FRAME_SIZE   = 16; 
reg [31:0] NUM_SAMPLES  = 5;
reg [31:0] CONV_TIME    = 95;

wire SYNCb, SCLK, SDI;
wire [31:0] ADC_OUT;

ADS7067 dut (

    .TRIGGER(TRIGGER),
    .CLK_MASTER(CLK),
    .RST(RST),
    .SDO(SDO),
    .SPI_DATA(SPI_DATA),
    .LOW_TIME(LOW_TIME),
    .HIGH_TIME(HIGH_TIME),
    .FRAME_SIZE(FRAME_SIZE),
	.NUM_SAMPLES(NUM_SAMPLES),
	.CONV_TIME(CONV_TIME),
	
    .SYNCb_reg(SYNCb),
    .SCLK_reg(SCLK),
    .SDI_reg(SDI),
    .ADC_OUT_reg(ADC_OUT)
    
);
  
initial begin
    TRIGGER     = 0;
    CLK         = 0;
    RST         = 1;
    SDO         = 1;
    LOW_TIME    = 3;
    HIGH_TIME   = 3;
    
    SPI_DATA    = 32'h0000_ae11;        // FRAME_SIZE = 16.
    
    #50;
    RST         = 0;    
    #1545;
    TRIGGER     = 1;
    #10;
    TRIGGER     = 0;
    #20000;
    TRIGGER     = 1;
    #10;
    TRIGGER     = 0;
end
    
always begin
    CLK = #5 ~CLK;
end
    
always @(negedge SCLK) begin    // Emulate ADC output with a maximum 'measured' delay of 7ns from the serial clock launch edge, the falling edge as per the SPI-00 protocol, to the next data valid on SDO.
    SDO = #7 ~SDO;          
end

endmodule
