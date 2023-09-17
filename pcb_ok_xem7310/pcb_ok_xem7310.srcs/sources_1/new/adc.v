`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2022 06:07:58 PM
// Design Name: 
// Module Name: adc
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
module adc(
     input clk_adc,
	 input trig,
	 input reset_adc,
     input adc_sdo,
	 input [23:0] adc_din,
	 
	 output reg temp_adc_bit,	 
	 output reg temp_adc_csb,
	 output reg temp_adc_sclk,
	 output reg adc_done,
	 output reg [23:0] adc_dout
    );  


reg [23:0] adc_data;		                     																
reg [7:0] adc_data_len=24;									
reg adc_dl;				 


always @(posedge clk_adc)  begin                     // check for new SDI data every clk cycle
	adc_data <= adc_din;
end	


always @(posedge clk_adc)  begin 
    if (trig==1 && temp_adc_csb==1 && adc_done==0) begin
        temp_adc_csb    <= 0;
        temp_adc_sclk   <= 0;
        adc_data_len     = 24;
        adc_dl          <= 0;
        adc_dout         = 0;
    end   
    else if (trig==1 && temp_adc_csb==0 && adc_dl==0 && adc_data_len>0) begin
        temp_adc_bit    <= adc_data[adc_data_len-1];
        adc_dl          <= 1;
        temp_adc_sclk   <= 0;
        end
    else if (trig==1 && temp_adc_csb==0 && adc_dl==1 && adc_data_len>1) begin
        temp_adc_sclk   <= 1;							// load data on rising edge of clock -- ADS7067, SPI-00 protocol 
        adc_dout         = adc_dout + adc_sdo;          // read data on rising edge of clock -- ADS7067, SPI-00 protocol 
        adc_dout         = adc_dout<<1;
        adc_dl          <= 0;
        adc_data_len     = adc_data_len - 1;
        end
    else if (trig==1 && temp_adc_csb==0 && adc_dl==1 && adc_data_len==1) begin
        temp_adc_sclk   <= 1;							// load data on rising edge of clock -- ADS7067, SPI-00 protocol 
        adc_dout         = adc_dout + adc_sdo;          // read data on rising edge of clock -- ADS7067, SPI-00 protocol 
        adc_dl          <= 0;
        adc_data_len     = adc_data_len - 1;
        end 
    else if (trig==1 && adc_data_len==0 && temp_adc_sclk==1) begin
        temp_adc_sclk   <= 0;
        end
    else if (trig==1 && adc_data_len==0 && temp_adc_sclk==0) begin
        temp_adc_csb    <= 1;
        temp_adc_bit    <= 0;
        adc_done        <= 1;
        end
    else if (trig==0 && adc_data_len==0) begin
        adc_done        <= 0;
        adc_dout         = 0;
        end 
    else if (reset_adc) begin 
        temp_adc_csb    <= 1;
		temp_adc_sclk   <= 0;
		temp_adc_bit    <= 0;
		adc_done        <= 0;
		adc_dout        <= 0;
        end  
end

	
endmodule
