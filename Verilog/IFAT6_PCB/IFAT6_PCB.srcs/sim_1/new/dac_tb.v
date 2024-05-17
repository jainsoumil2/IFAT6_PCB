`timescale 1ns / 1ps

module dac_tb;

reg TRIGGER, CLK, RST, CLK_RST; 
reg [31:0] SPI_DATA;

wire SCLK, SYNCb, SDI;
wire SPI_CLK;
wire locked;

DAC8568 uut_DAC (  
    .TRIGGER(TRIGGER),
    .CLK_MASTER(SPI_CLK),
    .RST(RST),
    .SPI_DATA(SPI_DATA),
    .SYNCb(SYNCb),
    .SCLK(SCLK),
    .SDI(SDI)
);
  
initial begin
    TRIGGER     = 1'b0;
    CLK         = 1'b0;
    RST         = 1'b1;
    CLK_RST     = 1'b1;
    SPI_DATA    = 32'h0317_ae10;
    
    #50;
    RST         = 1'b0;    
    CLK_RST     = 1'b0;
    
    #1550;
    TRIGGER     = 1'b1;
    
    #20;
    TRIGGER     = 1'b0;

end    
    
always begin
    CLK = #5 ~CLK;
end
    
clk_50M CLK_DAC(
.clk_out1(SPI_CLK),     // output clk_out1
.reset(CLK_RST),        // input reset
.locked(locked),        // output locked
.clk_in1(CLK)           // input clk_in1
);

endmodule
