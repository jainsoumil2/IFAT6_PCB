`timescale 1ns / 1ps

// Since data from the SDI line are clocked into the DAC's internal 32-bit shift
// register at the falling clock edge, the timer and the FSM state register
// should operate at the rising clock edge.

module DAC8568(
     
    input wire TRIGGER,
    input wire CLK_MASTER,
    input wire RST,
    input wire [31:0] SPI_DATA,
	output reg SYNCb,
	output reg SCLK,  
	output reg SDI
	
	);

    //FSM-related declarations: 
    parameter Idle          = 2'b00,
              Lower_SYNCb   = 2'b01, 
              Write_Data    = 2'b10, 
              Hold_SYNCb    = 2'b11;
    reg [1:0] pr_state, nx_state;	
    
    //Timer-related declarations:
    reg [4:0] i, imax;
    
    // Timer (using strategy #1):
    always @(posedge CLK_MASTER or posedge RST) begin
        if (RST) i <= 5'b0;
        else if (pr_state != nx_state) i <= 5'b0;
        else if (!(i == imax)) i <= i + 1;
    end

    // FSM state register
    always @(posedge CLK_MASTER or posedge RST) begin
        if (RST) pr_state <= Idle;
        else pr_state <= nx_state;
    end
    
    // FSM combinational logic
    always @(*) begin
        // Default values
        SYNCb   = 1'b0;
        SCLK    = CLK_MASTER;
        SDI     = 1'bx;
        imax    = 5'b0;
        
        case (pr_state)
            Idle: begin  // 2'b00
                SYNCb       = 1'b1;
                SCLK        = 1'b0;
                if (TRIGGER) nx_state = Lower_SYNCb;    // 2'b01
                else nx_state = Idle;                   // 2'b00
            end 
            // Data-write sequence
            Lower_SYNCb: begin                          // 2'b01
                SYNCb       = CLK_MASTER;
                SCLK        = 1'b0;
                nx_state    = Write_Data;               // 2'b10
            end
            Write_Data: begin                           // 2'b10
                SDI         = SPI_DATA[31 - i];
                imax        = 5'd31;
                if (i == imax) nx_state = Hold_SYNCb;
                else nx_state = Write_Data;
            end
            Hold_SYNCb: begin                          // 2'b11
                SYNCb       = 1'b0;
                SCLK        = 1'b0;
                nx_state    = Idle;
            end
            default: begin
                SYNCb    = 1'b1;
                SCLK     = 1'b0;
                SDI      = 1'bx;
                imax     = 5'b0;
				nx_state = Idle;
			end
        endcase
    end

endmodule