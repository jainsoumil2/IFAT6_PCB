`timescale 1ns / 1ps
    
module ADS7067 (	  

	input wire TRIGGER,
    input wire CLK_MASTER,
    input wire RST,
    input wire SDO,
    input wire [31:0] SPI_DATA,
	input wire [31:0] LOW_TIME,
	input wire [31:0] HIGH_TIME,
	input wire [31:0] FRAME_SIZE,
	input wire [31:0] NUM_SAMPLES,
	input wire [31:0] CONV_TIME,
	
	output reg SYNCb_reg,
	output reg SCLK_reg,  
	output reg SDI_reg,
	output reg [31:0] ADC_OUT_reg
	
);
	
	 // FSM-related declarations
	 localparam IDLE	    = 3'b000,
	            CONV        = 3'b001,
	            WAIT1       = 3'b010,
				LOW         = 3'b011,
				HIGH1       = 3'b100,
				CAPTURE_SDO = 3'b101,
				HIGH2       = 3'b110,
				WAIT2       = 3'b111;
     reg [2:0] pr_state, nx_state;
	 reg SYNCb, SCLK, SDI;
	 
	 // Auxiliary-register-related declarations
	 reg [5:0]  pulse_cnt_reg, pulse_cnt;
	 reg [31:0] ADC_OUT;
	 reg [31:0] sample_cnt, sample_cnt_reg;
	 
	 // Timer-related declarations
	 reg [31:0] t, tmax;			//range >= max(LOW_TIME, HIGH_TIME, CONV_TIME)

	 // Timer (using strategy #2)
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) t <= 1;
		else if (t < tmax) t <= t+1;
		else t <= 1;
	 end
   
	 // Auxiliary register
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) begin 
		  pulse_cnt_reg     <= 0;
		  ADC_OUT_reg       <= 0;
		  sample_cnt_reg    <= 1;
		  end
		else begin 
		  pulse_cnt_reg     <= pulse_cnt;
		  ADC_OUT_reg       <= ADC_OUT;
		  sample_cnt_reg    <= sample_cnt;
		  end
	 end
	 
	 // FSM state register
	 always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) pr_state   <= IDLE;
		else pr_state       <= nx_state;
	 end

	// Optional output registers to remove possible glitches in the outputs
	always @(posedge CLK_MASTER, posedge RST) begin
		if (RST) begin
		  SYNCb_reg         <= 1;
		  SCLK_reg          <= 0;
		  SDI_reg           <= 1;
		  end
		else begin
		  SYNCb_reg         <= SYNCb;
		  SCLK_reg          <= SCLK;
		  SDI_reg           <= SDI;
		  end
	 end
	
	 // Note that the SCLK output from the state machine is registered. So, the actual clock as seen by the ADC will always be 
	 // delayed by 10ns (master clock period). The ADC output capture from the SDO has to be adjusted accordingly. 
	 
	 // In other words, the ADC output capture edge should be delayed by one master clock cycle, i.e., the SCLK rising edge 
	 // based on the SPI-00 protocol.
	 
	 // State machine
	 always @* begin
		case (pr_state)
			IDLE: begin					// 000.
				pulse_cnt   <= 0;
				SYNCb	    <= 1;
				SCLK 	    <= 0;
				SDI 	    <= 0;
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= 1;
				tmax        <= 1;
				if (TRIGGER) nx_state <= CONV;
				else         nx_state <= IDLE;
			end
			CONV: begin                 // 001. ADC Conversion. SYNCb = 1.  
			    pulse_cnt   <= 0;
				SYNCb	    <= 1;
				SCLK 	    <= 0;
				SDI 	    <= 0;
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= sample_cnt_reg;
				tmax        <= CONV_TIME;
				if (t == tmax) nx_state <= WAIT1;
				else           nx_state <= CONV;
			end    
			WAIT1: begin			    // 010. Wait for a maximum delay of 22ns from the falling edge of CSb to the data enable on SDO, for the "tDEN_CSDO" timing constraint.
				pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= SPI_DATA[FRAME_SIZE - 1 - pulse_cnt_reg];        // Setup the first input data bit on SDI at the CSb falling edge. 
				ADC_OUT     <= 0;
				sample_cnt  <= sample_cnt_reg;
				if (LOW_TIME == 1) tmax <= 2;         // If low time is 8.33 ns, wait for an additional 25 ns before entering the LOW state.
				else               tmax	<= 1;         // Otherwise for low times 20 ns, 30 ns, etc, just wait for an additional 10ns.
				if (t == tmax)     nx_state <= LOW;
				else               nx_state <= WAIT1;
			end
			LOW: begin					// 011.
				pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= SPI_DATA[FRAME_SIZE - 1 - pulse_cnt_reg];        // Setup input data on SDI at the falling edge of serial clock as per the SPI-00 protocol. 
				if (HIGH_TIME == 1 && pulse_cnt_reg >= 1) ADC_OUT <= (ADC_OUT_reg + SDO)<<1;   // Capture datain on the rising edge of the "registered" serial clock, 'SCLK_reg', which is shifted by one master clock cycle, if 'HIGH TIME' = 1 (SPI-00 Protocol).
				else                                      ADC_OUT <= ADC_OUT_reg; 
				sample_cnt  <= sample_cnt_reg;
				tmax	    <= LOW_TIME;
				if   (t == tmax) nx_state <= HIGH1;  
				else             nx_state <= LOW;
			end
			HIGH1: begin                // 100.
				SYNCb       <= 0;
				SCLK        <= 1;
				SDI         <= SPI_DATA[FRAME_SIZE - 1 - pulse_cnt_reg];
				ADC_OUT     <= ADC_OUT_reg;                                 // Capture SDO in the following cycle (master clock) because the SCLK output is registered, which is what the ADC sees and uses to launch its output data.    
				sample_cnt  <= sample_cnt_reg;
				tmax	    <= 1;
				if (HIGH_TIME == 1) begin
				    pulse_cnt	<= pulse_cnt_reg + 1;
					if (pulse_cnt_reg < FRAME_SIZE - 1) nx_state    <= LOW;
					else                                nx_state    <= WAIT2;
				end				
				else begin
				    pulse_cnt	<= pulse_cnt_reg;
				    nx_state    <= CAPTURE_SDO;
				end
			end
			CAPTURE_SDO: begin          // 101. Capture SDO when the registered SCLK output transitions to a logic high. 
			    SYNCb       <= 0;
			    SCLK        <= 1;
			    SDI         <= SPI_DATA[FRAME_SIZE - 1 - pulse_cnt_reg];
			    if (pulse_cnt_reg < FRAME_SIZE - 1) ADC_OUT <= (ADC_OUT_reg + SDO) << 1;
			    else                                ADC_OUT <= ADC_OUT_reg + SDO;  		// Do not shift the ADC output register contents left in the last serial clock cycle.
			    sample_cnt  <= sample_cnt_reg;
			    tmax        <= 1;
				if (HIGH_TIME <= 2) begin 
				    pulse_cnt	<= pulse_cnt_reg + 1;
					if (pulse_cnt_reg < FRAME_SIZE - 1) nx_state    <= LOW;		                               // Strictly speaking, this and the next conditions are intended to be used only when 'HIGH TIME' equals 2. However, in case there is a glitch in 'HIGH TIME' causing it to be equal to 1, the next state should be 'LOW' or 'WAIT2'.  
					else                                nx_state    <= WAIT2;
				end
				else begin
				    pulse_cnt	<= pulse_cnt_reg;
				    nx_state    <= HIGH2;
				end
            end
			HIGH2: begin				// 110.
			 	SYNCb       <= 0;
				SCLK        <= 1;
			 	SDI         <= SPI_DATA[FRAME_SIZE - 1 - pulse_cnt_reg];
				ADC_OUT     <= ADC_OUT_reg;	
				sample_cnt  <= sample_cnt_reg;		 	
				tmax	    <= HIGH_TIME - 2;
				if (t == tmax) begin
					pulse_cnt <= pulse_cnt_reg + 1;
					if (pulse_cnt_reg < FRAME_SIZE - 1) nx_state  <= LOW;
					else                                nx_state  <= WAIT2;
				end
				else begin 
				    pulse_cnt <= pulse_cnt_reg;
			        nx_state  <= HIGH2;  
				end
			end
			WAIT2: begin                // 111. For the "tquiet" timing constraint (tD_CKCS), which specifies a minimum delay of 0.8ns from the last SCLK falling edge to CSb rising edge.
			    pulse_cnt	<= pulse_cnt_reg;
				SYNCb       <= 0;
				SCLK        <= 0;
				SDI         <= SPI_DATA[FRAME_SIZE - pulse_cnt_reg];
				if (HIGH_TIME == 1) ADC_OUT <= ADC_OUT_reg + SDO;   // Capture datain on the rising edge of the "registered" serial clock, 'SCLK_reg', which is shifted by one master clock cycle, if 'HIGH TIME' = 1 (SPI-00 Protocol).
				else 				ADC_OUT <= ADC_OUT_reg;	
				sample_cnt  <= sample_cnt_reg + 1;
				tmax        <= 1;
                if (sample_cnt_reg < NUM_SAMPLES) nx_state <= CONV;
				else                              nx_state <= IDLE;
				end
			default: begin
				pulse_cnt   <= 0;
				SYNCb	    <= 1;
				SCLK 	    <= 0;
				SDI 	    <= 0;
				ADC_OUT     <= ADC_OUT_reg;
				sample_cnt  <= 1;
				tmax        <= 1;
				nx_state    <= IDLE;
			end
		endcase
	end

endmodule