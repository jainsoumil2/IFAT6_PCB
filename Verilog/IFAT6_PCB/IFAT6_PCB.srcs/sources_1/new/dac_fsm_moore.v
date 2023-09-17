`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 02:09:50 PM
// Design Name: 
// Module Name: dac_fsm_moore
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

module dac_fsm_moore(
    // System ports
    input wire rd, wr, spi_clk, rst,
    input [31:0] data_spi_in,                   // 32-bit data for SPI
            
    // SPI ports    
    output reg SCK, SYNCB, SDI, WPn, HOLDn,     // SYNCb=SSn, SDI=MOSI
    input wire MISO
);

//Device's SPI parameters:
parameter WREN_opcode=8'b0000_0110, WRITE_opcode=8'b0000_0010, READ_opcode=8'b0000_0011,
          initial_addr_for_wr=16'b0, initial_addr_for_rd=16'b0;

//FSM-related declarations: 
parameter idle=4'b0000, WREN=4'b0001, deselect=4'b0010, WRITEx=4'b0011, 
          initial_addr_wr=4'b0100, wr_data=4'b0101, wait_wr0=4'b0110, READx=4'b0111,
          initial_addr_rd=4'b1000, rd_data=4'b1001, wait_rd0=4'b1010;
reg [3:0] pr_state, nx_state;

//Timer-related declarations:
reg [3:0] i, imax;
reg [2:0] j, jmax;
    
//SPI data signals:
reg [7:0] data_in [0:7];

// Data for SPI transmission:
reg [7:0] data_out [0:7];

// Initialize signals:
initial begin
    WPn     = 1'b1;
    HOLDn   = 1'b1;
    data_out[0] = 8'b0000_0001;
    data_out[1] = 8'b0010_0011;
    data_out[2] = 8'b0100_0101;
    data_out[3] = 8'b0110_0111;
    data_out[4] = 8'b1000_1001;
    data_out[5] = 8'b1010_1011;
    data_out[6] = 8'b1100_1101;
    data_out[7] = 8'b1110_1111;  
end
        
// Timers (using strategy #1):
always @(negedge spi_clk or posedge rst) begin
    if (rst) begin
        i <= 4'b0;
        j <= 3'b0;
    end 
    else if (pr_state != nx_state) begin
        i <= 4'b0;
        j <= 3'b0;
    end 
    else if (!(i == imax && j == jmax)) begin
        if (i != imax) begin
            i <= i + 1;
        end 
        else if (j != jmax) begin
            i <= 4'b0;
            j <= j + 1;
        end
    end
end  
  
// FSM state register
always @(negedge spi_clk or posedge rst) begin
    if (rst) pr_state <= idle;
    else pr_state <= nx_state;
end

// FSM combinational logic
always @* begin
    // Default values
    SYNCB   = 1'b0;
    SCK     = spi_clk;
    SDI     = 1'bx;
    imax    = 4'b0;
    jmax    = 3'b0;

    // Other values
    case (pr_state)
        idle: begin  // 4'b0000
            SYNCB       = 1'b1;
            SCK         = 1'b0;
            if (wr) begin
                nx_state    = WREN;  // 4'b0001
            end 
            else if (rd) begin
                nx_state    = READx;  // 4'b0111
            end 
            else begin
                nx_state    = idle; // 4'b0000
            end
        end 
        // Data-write sequence
        WREN: begin // 4'b0001
            SDI         = WREN_opcode[7 - i];
            imax        = 4'b0111;  //7
            if (i == imax) begin
                nx_state    = deselect;
            end 
            else begin
                nx_state    = WREN;
            end
        end
        deselect: begin // 4'b0010
            SYNCB       = spi_clk;
            SCK         = 1'b0;
            nx_state    = WRITEx;
        end 
        WRITEx: begin // 4'b0011
            SDI         = WRITE_opcode[7 - i];
            imax        = 4'b0111;  //7
            if (i == imax) begin
                nx_state    = initial_addr_wr;
            end 
            else begin
                nx_state    = WRITEx;
            end
        end
        initial_addr_wr: begin // 4'b0100
            SDI         = initial_addr_for_wr[15 - i];
            imax        = 4'b1111;  //15 
            if (i == imax) begin
                nx_state    = wr_data;
            end 
            else begin
                nx_state    = initial_addr_wr;
            end
        end
        wr_data: begin // 4'b0101
            SDI         = data_out[j][7 - i];
            imax        = 4'b0111; // 7
            jmax        = 3'b0111; // 7
            if (i == imax && j == jmax) begin
                nx_state    = wait_wr0;
            end 
            else begin
                nx_state    = wr_data;
            end
        end       
        wait_wr0: begin // 4'b0110
            SYNCB       = 1'b0;
            SCK         = 1'b0;
            if (!wr) begin
                nx_state    = idle;
            end 
            else begin
                nx_state    = wait_wr0;
            end
        end
        // Data-read sequence:
        READx: begin // 4'b0111
            SDI         = READ_opcode[7 - i];
            imax        = 4'b0111; // 7
            if (i == imax) begin
                nx_state    = initial_addr_rd;
            end 
            else begin
                nx_state    = READx;
            end
        end
        initial_addr_rd: begin // 4'b1000
            SDI         = initial_addr_for_rd[15 - i];
            imax        = 4'b1111; // 15
            if (i == imax) begin
                nx_state    = rd_data;
            end else begin
                nx_state    = initial_addr_rd;
            end
        end
        rd_data: begin // 4'b1001
            imax        = 4'b0111; // 7
            jmax        = 3'b0111; // 7
            if (i == imax && j == jmax) begin
                nx_state    = wait_rd0;
            end else begin
                nx_state    = rd_data;
            end
        end
        wait_rd0: begin // 4'b1010
            SYNCB       = 1'b0;
            SCK         = 1'b0;
            if (!rd) begin
                nx_state    = idle;
            end else begin
                nx_state    = wait_rd0;
            end
        end
    endcase
end

// Test circuit
always @(posedge spi_clk) begin
    // Read FRAM and store data
    if (pr_state == rd_data) begin
      data_in[j][7 - i] <= MISO;
    end
end
  
endmodule
