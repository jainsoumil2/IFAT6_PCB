`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 03:52:55 PM
// Design Name: 
// Module Name: dac
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

module dac(
     input reset_dac,
     input clk_dac,
	 input trig,
	 input [31:0] data,
	 
	 output reg sdi,	 
	 output reg syncb,
	 output reg sclk,	 
	 output reg done
    );																
	
	                    
integer data_len = 32;										
reg dl;                          					    // dac dataload										
reg [31:0] temp_data;


always @(posedge clk_dac)  begin 						//configure dacs
	temp_data = data;
    if (trig == 1 && syncb == 1 && done == 0) begin
            syncb <= 0;
            sclk <= 0;
            data_len = 32;
            dl <= 0;
        end
    else if (trig == 1 && syncb == 0 && dl == 0 && data_len > 0) begin
                sdi = temp_data[data_len-1];
                dl <= 1;
                sclk <= 1;
                data_len = data_len - 1;
            end
    else if (trig==1 && syncb==0 && dl==1 && data_len>=0) begin
                sclk <= 0;							// load data on falling edge of clock -- DAC8568
                dl <= 0;
            end
    else if (trig == 1 && data_len == 0) begin
                syncb <= 1;
                done <= 1;
            end
    else if (trig == 0 && data_len == 0) begin
                done <= 0;
            end
    else if (reset_dac) begin 
        syncb           <= 1;
		sclk            <= 0;
		sdi             <= 0;
		done            <= 0;
        end       
end
endmodule

