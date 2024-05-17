`timescale 1ns / 1ps
    
module ADS7067 #(parameter FRAME_SIZE = 24, parameter NUM_SAMPLES = 1, parameter CONV_Period = 95)(	   // Conversion Period (max specification) = 95 * 10ns = 950ns. 
	
	input wire TRIGGER,
    input wire CLK_MASTER,
    input wire RST,
    input wire SDO,
    input wire [FRAME_SIZE-1:0] SPI_DATA,
	input wire [31:0] LOW_TIME,
	input wire [31:0] HIGH_TIME,
	   
	output reg SYNCb_reg,
	output reg SCLK_reg,  
	output reg SDI_reg,
	output reg [FRAME_SIZE-1:0]ADC_OUT_reg
	
);
	
	 // FSM-related declarations
	 localparam IDLE	    = 4'b0000,
	            CONV        = 4'b0001,
	            WAIT1       = 4'b0010,
				LOW         = 4'b0011,
				CAPTURE_SDO = 4'b0100,
				HIGH        = 4'b0101,
				incPulCnt   = 4'b0110,
				rstPulCnt   = 4'b0111,
				WAIT2       = 4'b1000;
     reg [3:0] pr_state, nx_state;
	 reg SYNCb, SCLK, SDI;
	 
	 // Auxiliary-register-related declarations
	 reg [5:0] pulse_cnt_reg, pulse_cnt;
	 reg [FRAME_SIZE-1:0]ADC_OUT;
	 reg [31:0] sample_cnt, sample_cnt_reg;
	 
	 // Timer-related declarations
	 reg [31:0] t, tmax;			//range >= max(LOW_TIME, HIGH_TIME, CONV_Period)

	 // Timer (using strategy #2)
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) t <= 1;
		else if (t < tmax) t <= t+1;
		else t <= 1;
	 end
   
	 // Auxiliary register
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) begin 
		  pulse_cnt_reg <= 1;
		  ADC_OUT_reg <= 0;
		  sample_cnt_reg <= 1;
		  end
		else begin 
		  pulse_cnt_reg <= pulse_cnt;
		  ADC_OUT_reg <= ADC_OUT;
		  sample_cnt_reg <= sample_cnt;
		  end
	 end
	 
	 // FSM state register
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) pr_state <= IDLE;
		else pr_state <= nx_state;
	 end

	// Optional output registers to remove possible glitches in the outputs
	always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) begin
		  SYNCb_reg <= 1;
		  SCLK_reg <= 0;
		  SDI_reg <= 1;
		  end
		else begin
		  SYNCb_reg <= SYNCb;
		  SCLK_reg <= SCLK;
		  SDI_reg <= SDI;
		  end
	 end
	
	 // State machine
	 always @* begin
		case (pr_state)
			IDLE: begin					// 0000.
				pulse_cnt   <= 1;
				SYNCb	    <= 1;
				SCLK 	    <= 0;
				SDI 	    <= 0;
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= 1;
				tmax        <= 1;
				if (TRIGGER) nx_state <= CONV;
				else         nx_state <= IDLE;
			end
			CONV: begin                 // 0001. ADC Conversion. SYNCb = 1.  
			    pulse_cnt   <= 1;
				SYNCb	    <= 1;
				SCLK 	    <= 0;
				SDI 	    <= 0;
				ADC_OUT     <= 0;
				sample_cnt  <= sample_cnt_reg;
				tmax        <= CONV_Period;
				if (t == tmax) nx_state <= WAIT1;
				else           nx_state <= CONV;
			end    
			WAIT1: begin			    // 0010. Wait for a maximum delay time of 22ns, from the falling edge of CSb to the data enable on SDO.
				pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];        // Setup input data on SDI at the serial clock falling edge as per the SPI-00 protocol. 
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= sample_cnt_reg;
				if (LOW_TIME == 1) tmax <= 2;                               // If low time is 10ns, wait for an additional 20ns before entering the LOW state.
				else               tmax	<= 1;                               // Otherwise, for low times 20ns, 30ns, etc, just wait for an additional 10ns.
				if (t == tmax)     nx_state <= LOW;                         // 0011.
				else               nx_state <= WAIT1;                       // 0010.
			end
			LOW: begin					// 0011.
				pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];        // Setup input data on SDI at the serial clock falling edge as per the SPI-00 protocol. 
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= sample_cnt_reg;
				tmax	    <= LOW_TIME;
				if      (t == tmax && HIGH_TIME > 1)                             nx_state <= CAPTURE_SDO;      // 0100.
				else if (t == tmax && HIGH_TIME == 1 && pulse_cnt < FRAME_SIZE)  nx_state <= incPulCnt;		   // 0110.
				else if (t == tmax && HIGH_TIME == 1 && pulse_cnt >= FRAME_SIZE) nx_state <= rstPulCnt;	       // 0111.
				else                                                             nx_state <= LOW;              // 0011.
			end
			CAPTURE_SDO: begin           // 0100. Transition SCLK to logic high and capture SDO. 
				pulse_cnt	<= pulse_cnt_reg;
			    SYNCb       <= 0;
			    SCLK        <= 1;
			    SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];
			    if (pulse_cnt < FRAME_SIZE)  ADC_OUT <= (ADC_OUT_reg + SDO)<<1;                    // Capture datain on the rising edge of serial clock, as per SPI-00 protocol.
			    else                         ADC_OUT <= ADC_OUT_reg + SDO;                         // DO NOT shift left for the last serial clock cycle.
			    sample_cnt  <= sample_cnt_reg;
			    tmax        <= 1;
				if      (HIGH_TIME == 2 && pulse_cnt < FRAME_SIZE)  nx_state <= incPulCnt;		   // 0110.
				else if (HIGH_TIME == 2 && pulse_cnt >= FRAME_SIZE) nx_state <= rstPulCnt;		   // 0111.
				else                                                nx_state <= HIGH;              // 0101.
            end
			HIGH: begin					// 0101.
				pulse_cnt	<= pulse_cnt_reg;
			 	SYNCb       <= 0;
				SCLK        <= 1;
			 	SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];
				ADC_OUT     <= ADC_OUT_reg;	
				sample_cnt  <= sample_cnt_reg;		 	
				tmax	    <= HIGH_TIME - 2;
				if      (t == tmax && pulse_cnt < FRAME_SIZE)  nx_state  <= incPulCnt;	           // 0110.
				else if (t == tmax && pulse_cnt >= FRAME_SIZE) nx_state  <= rstPulCnt;	           // 0111.
				else                                           nx_state  <= HIGH;                  // 0101.
			end
			incPulCnt: begin			// 0110. Increment pulse count until it reaches the maximum FRAME SIZE.
				pulse_cnt	<= pulse_cnt_reg + 1;
				SYNCb       <= 0;
				SCLK        <= 1;
				SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];
				if (HIGH_TIME == 1) ADC_OUT <= (ADC_OUT_reg + SDO)<<1;   // Capture datain on the rising edge of serial clock, as per SPI-00 protocol. 
                else                ADC_OUT <= ADC_OUT_reg;
				sample_cnt  <= sample_cnt_reg;
				tmax        <= 1;
				nx_state    <= LOW;                                      // 0011.
			end
			rstPulCnt: begin			// 0111. Reset pulse count if number of pulses is greater than FRAME_SIZE.
				pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 1;
				SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];
				if (HIGH_TIME == 1) ADC_OUT <= ADC_OUT_reg + SDO;   // Capture datain on the rising edge of serial clock, as per SPI-00 protocol. 
                else                ADC_OUT <= ADC_OUT_reg;
                sample_cnt  <= sample_cnt_reg;
				tmax        <= 1;
				nx_state    <= WAIT2;                               // 1000.
			end
			WAIT2: begin                // 1000. Catering to the quiet timing specification (tD_CKCS), which specifies a minimum delay of 0.8ns from the last SCLK falling edge to CSb rising edge.
			    pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= 0;                                   // No need to hold SDI data, even for the fastest case of 20ns SCLK. The SDI hold timing (4ns minimum from SCLK capture, i.e., rising edge) is met when in the rstPulCnt state.
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= sample_cnt_reg + 1;
				tmax        <= 1;
                if (sample_cnt_reg < NUM_SAMPLES) nx_state <= CONV;
				else                              nx_state <= IDLE; // 0000.
				end
			default: begin
				pulse_cnt <= 1;
				SYNCb	  <= 1;
				SCLK 	  <= 0;
				SDI 	  <= 0;
				ADC_OUT   <= ADC_OUT_reg;
				sample_cnt<= 1;
				tmax      <= 1;
				nx_state  <= IDLE;                                  // 0000.
			end
		endcase
	end

endmodule