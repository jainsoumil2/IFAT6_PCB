`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 03:39:08 PM
// Design Name: 
// Module Name: dac_tb
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


module dac_tb;
    
reg rd, wr, spi_clk, rst;   // rd -- read trigger, wr -- write trigger
reg [31:0] data_spi_in;
reg [5:0] cnt_MISO;

wire SCK, SYNCB, SDI, WPn, HOLDn;
reg MISO;

dac_fsm_moore uut_dac (
    .rd(rd),
    .wr(wr),
    .spi_clk(spi_clk),
    .rst(rst),
    .data_spi_in(data_spi_in),
    
    .SCK(SCK),
    .SYNCB(SYNCB),
    .SDI(SDI),
    .WPn(WPn),
    .HOLDn(HOLDn),
    .MISO(MISO)
);
  
initial begin
    rd          = 1'b0;
    wr          = 1'b0;
    spi_clk     = 1'b0;
    rst         = 1'b1;
    data_spi_in = 32'b0;
    cnt_MISO    = 6'b0;
    MISO        = 1'b0;
     
    #50;
    rst         = 1'b0;    
    
    #50;
    wr          = 1'b1;
    
    #1000;
    wr          = 1'b0;
    
    #100;
    rd          = 1'b1;
    
    #240;
    for (cnt_MISO = 0; cnt_MISO < 63; cnt_MISO = cnt_MISO + 1) begin
        MISO    = #10 ~MISO;
        end   
        
    #100;
    rd          = 1'b0;
    
    
end    
    
always begin
    spi_clk     = #5 ~spi_clk;
end
    
endmodule
