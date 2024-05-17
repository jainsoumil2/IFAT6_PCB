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
	 input reset_adc,
     input clk_adc,
	 input trig,
	 input [23:0] datain,
	 input sdo,
	      
	 output reg sdi,	 
	 output reg csb,
	 output reg sclk,
	 output reg done,
	 output reg [23:0] dataout
    );

reg [23:0] adc_data;		                     																
reg [7:0] adc_data_len=24;									
reg adc_dl;				 

always @(posedge clk_adc)  begin                     // check for new SDI data every clk cycle
	adc_data            <= datain;
end	

always @(posedge clk_adc)  begin 
    if (trig==1 && csb==1 && done==0) begin
        csb             <= 0;
        sclk            <= 0;
        adc_data_len     = 24;
        adc_dl          <= 0;
        dataout          = 0;
    end   
    else if (trig==1 && csb==0 && adc_dl==0 && adc_data_len>0) begin
        sdi             <= adc_data[adc_data_len-1];
        adc_dl          <= 1;
        sclk            <= 0;
        end
    else if (trig==1 && csb==0 && adc_dl==1 && adc_data_len>1) begin
        sclk            <= 1;						// Load datain on the rising edge of clock -- ADS7067, SPI-00 protocol.
        dataout          = dataout + sdo;           // Read or capture datain on the rising edge of clock -- ADS7067, SPI-00 protocol. 
        dataout          = dataout<<1;
        adc_dl          <= 0;
        adc_data_len     = adc_data_len - 1;
        end
    else if (trig==1 && csb==0 && adc_dl==1 && adc_data_len==1) begin
        sclk            <= 1;						// Load datain on the rising edge of clock -- ADS7067, SPI-00 protocol. 
        dataout          = dataout + sdo;           // Capture datain on the rising edge of clock -- ADS7067, SPI-00 protocol.
        adc_dl          <= 0;
        adc_data_len     = adc_data_len - 1;
        end 
    else if (trig==1 && adc_data_len==0 && sclk==1) begin
        sclk            <= 0;
        end
    else if (trig==1 && adc_data_len==0 && sclk==0) begin
        csb             <= 1;
        sdi             <= 0;
        done            <= 1;
        end
    else if (trig==0 && adc_data_len==0) begin
        done            <= 0;
        dataout          = 0;
        end 
    else if (reset_adc) begin 
        csb             <= 1;
		sclk            <= 0;
		sdi             <= 0;
		done            <= 0;
		dataout         <= 0;
        end
    end

endmodule
