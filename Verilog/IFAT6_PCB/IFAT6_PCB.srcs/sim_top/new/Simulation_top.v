//------------------------------------------------------------------------
// A simple test bench template for simulating a top level user design
// utilizing FrontPanel. This file is "Read-only" and cannot be modified
// by the user. Follow these instructions to get started:
// 1. Create a top level test bench file within the "Simulation" file group
// 2. Copy and paste the contents of this template file into the newly
//    created file
// 3. Substitute "USER_TOP_LEVEL_MODULE" with the instantiation of the top
//    level module you wish to simulate
// 4. Add in the desired FrontPanel API simulation function calls listed
//    at the bottom of this template
//
//------------------------------------------------------------------------
// Copyright (c) 2022 Opal Kelly Incorporated
//------------------------------------------------------------------------
`timescale 1ns/1ps
`default_nettype none

module Simulation_top;

reg  sys_clkp, sys_clkn;
	
wire DAC1_LDACb, DAC2_LDACb, DAC3_LDACb, DAC4_LDACb, DAC5_LDACb;
wire DAC1_CLRb, DAC2_CLRb, DAC3_CLRb, DAC4_CLRb, DAC5_CLRb;
wire DAC_SCLK;
wire DAC1_SDI, DAC2_SDI, DAC3_SDI, DAC4_SDI, DAC5_SDI;
wire DAC1_SYNCb, DAC2_SYNCb, DAC3_SYNCb, DAC4_SYNCb, DAC5_SYNCb;
    
wire ADC_CSb, ADC_SCLK, ADC_SDI;
wire PROBE_CLK_ADC, PROBE_CLK_DAC, PROBE_CLK_300M;
    
wire INPUT_DATA0, INPUT_DATA1, INPUT_DATA2, INPUT_DATA3,
     INPUT_DATA4, INPUT_DATA5, INPUT_DATA6, INPUT_DATA7,
     INPUT_DATA8, INPUT_DATA9, INPUT_DATA10, INPUT_DATA11,
     INPUT_DATA12, INPUT_DATA13, INPUT_DATA14, INPUT_DATA15,
     INPUT_DATA16, INPUT_DATA17, INPUT_DATA18, INPUT_DATA19,
     INPUT_DATA20, INPUT_DATA21, INPUT_DATA22, INPUT_DATA23,
     INPUT_DATA_REQ, SHIFT_REG_D, COL_SHIFT_REG_CLK, ROW_SHIFT_REG_CLK,
     ASYNC_RST, SHIFT_REG_SET, ARRAY_SHIFT_REG_CLK, OUTPUT_DATA_ACK,
     PULSE_GEN_RST, _setLFSR, resetIFAT;

reg  ADC_SDO;                
reg  INPUT_DATA_ACK, OUTPUT_DATA0, OUTPUT_DATA1, OUTPUT_DATA2,
     OUTPUT_DATA3, OUTPUT_DATA4, OUTPUT_DATA5, OUTPUT_DATA6,
     OUTPUT_DATA7, OUTPUT_DATA8, OUTPUT_DATA9, OUTPUT_DATA10,
     OUTPUT_DATA11, OUTPUT_DATA12, OUTPUT_DATA13, OUTPUT_DATA_REQ;

always #2.5 sys_clkp        = ~sys_clkp;
always #2.5 sys_clkn        = ~sys_clkn;

// Target Interface Bus.
wire  [4:0]   okUH;
wire  [2:0]   okHU;
wire  [31:0]  okUHU;
wire          okAA;
wire          okClk;

// Endpoint Connections.
wire [31:0] wi00_ep_dataout, wi01_ep_dataout, wi02_ep_dataout, wi03_ep_dataout, 
            wi04_ep_dataout, wi05_ep_dataout, wi06_ep_dataout, wi07_ep_dataout,
            wi08_ep_dataout, wi09_ep_dataout, wi0a_ep_dataout, wi0b_ep_dataout,
            wi0c_ep_dataout;
wire [31:0] wo20_ep_datain, wo21_ep_datain, wo22_ep_datain, wo23_ep_datain, wo24_ep_datain;       
wire [31:0] ti40_ep_trigger, ti41_ep_trigger, ti42_ep_trigger;
wire ti40_ep_clk, ti41_ep_clk, ti42_ep_clk;
wire [31 : 0] poa0_ep_datain;
wire poa0_ep_read;
wire clk_50M, clk_120M;
assign ti40_ep_clk          = clk_50M;
assign ti41_ep_clk          = clk_120M;
assign ti42_ep_clk          = okClk;

// DACs.
wire DAC1_SCLK, DAC2_SCLK, DAC3_SCLK, DAC4_SCLK, DAC5_SCLK; 
assign DAC_SCLK             = DAC1_SCLK | DAC2_SCLK | DAC3_SCLK | DAC4_SCLK | DAC5_SCLK;
assign DAC1_LDACb           = wi02_ep_dataout[0];
assign DAC2_LDACb           = wi02_ep_dataout[1];
assign DAC3_LDACb           = wi02_ep_dataout[2];
assign DAC4_LDACb           = wi02_ep_dataout[3];
assign DAC5_LDACb           = wi02_ep_dataout[4];
assign DAC1_CLRb 	        = wi03_ep_dataout[0];
assign DAC2_CLRb 	        = wi03_ep_dataout[1];
assign DAC3_CLRb 	        = wi03_ep_dataout[2];
assign DAC4_CLRb 	        = wi03_ep_dataout[3];
assign DAC5_CLRb 	        = wi03_ep_dataout[4]; 

DAC8568 DAC1(
    .TRIGGER(ti40_ep_trigger[0]),
    .CLK_MASTER(clk_50M),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC1_SYNCb),
    .SCLK(DAC1_SCLK),
    .SDI(DAC1_SDI) 
);

DAC8568 DAC2(
    .TRIGGER(ti40_ep_trigger[1]),
    .CLK_MASTER(clk_50M),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC2_SYNCb),
    .SCLK(DAC2_SCLK),
    .SDI(DAC2_SDI) 
);

DAC8568 DAC3(
    .TRIGGER(ti40_ep_trigger[2]),
    .CLK_MASTER(clk_50M),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC3_SYNCb),
    .SCLK(DAC3_SCLK),
    .SDI(DAC3_SDI) 
);

DAC8568 DAC4(   
    .TRIGGER(ti40_ep_trigger[3]),
    .CLK_MASTER(clk_50M),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC4_SYNCb),
    .SCLK(DAC4_SCLK),
    .SDI(DAC4_SDI) 
);

DAC8568 DAC5(      
    .TRIGGER(ti40_ep_trigger[4]),
    .CLK_MASTER(clk_50M),
    .RST(wi00_ep_dataout[1]),
    .SPI_DATA(wi01_ep_dataout),
    .SYNCb(DAC5_SYNCb),
    .SCLK(DAC5_SCLK),
    .SDI(DAC5_SDI) 
);

// ADC.
reg  [31:0] ADS7067_SPI_Input;
reg  [31:0] ADS7067_SCLK_Low_Time;
reg  [31:0] ADS7067_SCLK_High_Time;
reg  [31:0] ADS7067_Frame_Size;
reg  [31:0] ADS7067_Num_Samples;
reg  [31:0] ADS7067_Conv_Time;
wire [31:0] ADC_OUT;
wire [3:0]  State_Machine_Addr;
assign State_Machine_Addr = wi06_ep_dataout[3:0];

always @ (posedge clk_120M) begin	
	case (State_Machine_Addr)

	1:  begin      // ADS7067 ADC Controller State Machine.
			ADS7067_SCLK_Low_Time 	<= wi07_ep_dataout;
			ADS7067_SCLK_High_Time 	<= wi08_ep_dataout;
			ADS7067_SPI_Input       <= wi09_ep_dataout;
			ADS7067_Frame_Size 		<= wi0a_ep_dataout;
			ADS7067_Num_Samples     <= wi0b_ep_dataout;
			ADS7067_Conv_Time       <= wi0c_ep_dataout;
		end
    
    endcase
end

ADS7067 ADC(
    .TRIGGER(ti41_ep_trigger[0]),
    .CLK_MASTER(clk_120M),
    .RST(wi00_ep_dataout[2]),
    .SDO(ADC_SDO),
    .SPI_DATA(ADS7067_SPI_Input),
    .LOW_TIME(ADS7067_SCLK_Low_Time),
    .HIGH_TIME(ADS7067_SCLK_High_Time),
    .FRAME_SIZE(ADS7067_Frame_Size),
	.NUM_SAMPLES(ADS7067_Num_Samples),
	.CONV_TIME(ADS7067_Conv_Time),
	
    .SYNCb_reg(ADC_CSb),
    .SCLK_reg(ADC_SCLK),
    .SDI_reg(ADC_SDI),
    .ADC_OUT_reg(ADC_OUT)
);
assign wo20_ep_datain       = ADC_OUT;

// ADC FIFO.
wire rd_en, wr_en;
assign rd_en 				= ti42_ep_trigger[0] | poa0_ep_read;           // Using trigger 'ti42' whose clock is synchronised to okClk.

reg trigger_sync, trigger_sync_prev, write_pulse;                          // Generate a write_pulse on the rising edge of ADC_CSb.
always @(posedge clk_120M, posedge wi00_ep_dataout[3]) begin
    if (wi00_ep_dataout[3]) begin                                          // Reset the write pulse and synchronized trigger signal.
        write_pulse             <= 0;
        trigger_sync            <= 0;
        trigger_sync_prev       <= 0;
    end
    else begin 
        trigger_sync            <= ADC_CSb;
        trigger_sync_prev       <= trigger_sync;
        if (trigger_sync && !trigger_sync_prev && wi00_ep_dataout[4]) write_pulse <= 1;   // Generate write pulse for one clock cycle duration on rising edge of synchronized trigger signal.
        else        write_pulse <= 0;
    end
end
assign wr_en                = ti41_ep_trigger[1] | write_pulse; 

wire [31:0] FIFO_din, FIFO_dout;
assign FIFO_din             = ADC_OUT;
assign wo21_ep_datain       = FIFO_dout;
assign poa0_ep_datain       = FIFO_dout;

wire full, wr_ack, overflow, empty, valid, underflow, wr_rst_busy, rd_rst_busy;       // Status flags.
assign wo22_ep_datain       = {24'b0, wr_ack, full, overflow, valid, empty, underflow, wr_rst_busy, rd_rst_busy};

wire [16:0] rd_data_count, wr_data_count;
assign wo23_ep_datain       = {15'b0, rd_data_count};
assign wo24_ep_datain       = {15'b0, wr_data_count};

fifo_generator_0 ADC_DATA_FIFO (
  .rst(wi00_ep_dataout[3]),       // input wire rst
  .wr_clk(clk_120M),              // input wire wr_clk
  .rd_clk(okClk),                 // input wire rd_clk
  .din(FIFO_din),                 // input wire [31 : 0] din
  .wr_en(wr_en),                  // input wire wr_en
  .rd_en(rd_en),                  // input wire rd_en
  .dout(FIFO_dout),               // output wire [31 : 0] dout
  .full(full),                    // output wire full
  .wr_ack(wr_ack),                // output wire wr_ack
  .overflow(overflow),            // output wire overflow
  .empty(empty),                  // output wire empty
  .valid(valid),                  // output wire valid
  .underflow(underflow),          // output wire underflow
  .rd_data_count(rd_data_count),  // output wire [16 : 0] rd_data_count
  .wr_data_count(wr_data_count),  // output wire [16 : 0] wr_data_count
  .wr_rst_busy(wr_rst_busy),      // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)       // output wire rd_rst_busy
);

// Clock Wizard.
wire locked;
clk_wiz_0 Data_Converter_Clocks  (
    .clk_out1(clk_50M),               // output clk_out1
    .clk_out2(clk_120M),              // output clk_out2
    .reset(wi00_ep_dataout[0]),       // input reset
    .locked(locked),                  // output locked
    .clk_in1_p(sys_clkp),             // input clk_in1_p
    .clk_in1_n(sys_clkn)              // input clk_in1_n
    );

// Pin Assignments.
assign PROBE_CLK_DAC        = locked ? clk_50M:1'b0;
assign PROBE_CLK_ADC        = locked ? clk_120M:1'b0;
assign PROBE_CLK_300M       = 1'b0; 
assign ROW_SHIFT_REG_CLK    = wi05_ep_dataout[0];
assign COL_SHIFT_REG_CLK    = wi05_ep_dataout[1];
assign {INPUT_DATA3, INPUT_DATA2, INPUT_DATA1, INPUT_DATA0} = wi04_ep_dataout[3:0];
assign INPUT_DATA4          = 1'b0;
assign INPUT_DATA5          = 1'b0;
assign INPUT_DATA6          = 1'b0; 
assign INPUT_DATA7          = 1'b0;
assign INPUT_DATA8          = 1'b0;
assign INPUT_DATA9          = 1'b0;
assign INPUT_DATA10         = 1'b0;
assign INPUT_DATA11         = 1'b0;
assign INPUT_DATA12         = 1'b0;
assign INPUT_DATA13         = 1'b0;
assign INPUT_DATA14         = 1'b0;
assign INPUT_DATA15         = 1'b0;
assign INPUT_DATA16         = 1'b0;
assign INPUT_DATA17         = 1'b0;
assign INPUT_DATA18         = 1'b0;
assign INPUT_DATA19         = 1'b0;
assign INPUT_DATA20         = 1'b0;
assign INPUT_DATA21         = 1'b0;
assign INPUT_DATA22         = 1'b0;
assign INPUT_DATA23         = 1'b0;
assign INPUT_DATA_REQ       = 1'b0;
assign SHIFT_REG_D          = 1'b0;
assign ASYNC_RST            = 1'b0;
assign SHIFT_REG_SET        = 1'b0;
assign ARRAY_SHIFT_REG_CLK  = 1'b0;
assign OUTPUT_DATA_ACK      = 1'b0;
assign PULSE_GEN_RST        = 1'b0;
assign _setLFSR             = 1'b0;
assign resetIFAT            = 1'b0;

FrontPanel_IFAT6 OK_IFAT6 (
  .okUH(okUH),                        // input wire [4 : 0] okUH
  .okHU(okHU),                        // output wire [2 : 0] okHU
  .okUHU(okUHU),                      // inout wire [31 : 0] okUHU
  .okAA(okAA),                        // inout wire okAA
  .okClk(okClk),                      // output wire okClk
  .wi00_ep_dataout(wi00_ep_dataout),  // output wire [31 : 0] wi00_ep_dataout
  .wi01_ep_dataout(wi01_ep_dataout),  // output wire [31 : 0] wi01_ep_dataout
  .wi02_ep_dataout(wi02_ep_dataout),  // output wire [31 : 0] wi02_ep_dataout
  .wi03_ep_dataout(wi03_ep_dataout),  // output wire [31 : 0] wi03_ep_dataout
  .wi04_ep_dataout(wi04_ep_dataout),  // output wire [31 : 0] wi04_ep_dataout
  .wi05_ep_dataout(wi05_ep_dataout),  // output wire [31 : 0] wi05_ep_dataout
  .wi06_ep_dataout(wi06_ep_dataout),  // output wire [31 : 0] wi06_ep_dataout
  .wi07_ep_dataout(wi07_ep_dataout),  // output wire [31 : 0] wi07_ep_dataout
  .wi08_ep_dataout(wi08_ep_dataout),  // output wire [31 : 0] wi08_ep_dataout
  .wi09_ep_dataout(wi09_ep_dataout),  // output wire [31 : 0] wi09_ep_dataout
  .wi0a_ep_dataout(wi0a_ep_dataout),  // output wire [31 : 0] wi0a_ep_dataout
  .wi0b_ep_dataout(wi0b_ep_dataout),  // output wire [31 : 0] wi0b_ep_dataout
  .wi0c_ep_dataout(wi0c_ep_dataout),  // output wire [31 : 0] wi0c_ep_dataout
  .wo20_ep_datain(wo20_ep_datain),    // input wire [31 : 0] wo20_ep_datain
  .wo21_ep_datain(wo21_ep_datain),    // input wire [31 : 0] wo21_ep_datain
  .wo22_ep_datain(wo22_ep_datain),    // input wire [31 : 0] wo22_ep_datain
  .wo23_ep_datain(wo23_ep_datain),    // input wire [31 : 0] wo23_ep_datain
  .wo24_ep_datain(wo24_ep_datain),    // input wire [31 : 0] wo24_ep_datain
  .ti40_ep_trigger(ti40_ep_trigger),  // output wire [31 : 0] ti40_ep_trigger
  .ti40_ep_clk(ti40_ep_clk),          // input wire ti40_ep_clk
  .ti41_ep_trigger(ti41_ep_trigger),  // output wire [31 : 0] ti41_ep_trigger
  .ti41_ep_clk(ti41_ep_clk),          // input wire ti41_ep_clk
  .ti42_ep_trigger(ti42_ep_trigger),  // output wire [31 : 0] ti42_ep_trigger
  .ti42_ep_clk(ti42_ep_clk),          // input wire ti42_ep_clk
  .poa0_ep_datain(poa0_ep_datain),    // input wire [31 : 0] poa0_ep_datain
  .poa0_ep_read(poa0_ep_read)         // output wire poa0_ep_read
  );

//------------------------------------------------------------------------
// Begin okHostInterface simulation user configurable global data
//------------------------------------------------------------------------
parameter BlockDelayStates = 5;   // REQUIRED: # of clocks between blocks of pipe data
parameter ReadyCheckDelay = 5;    // REQUIRED: # of clocks before block transfer before
                                  //  host interface checks for ready (0-255)
parameter PostReadyDelay = 5;     // REQUIRED: # of clocks after ready is asserted and
                                  //  check that the block transfer begins (0-255)
parameter pipeInSize = 128;       // REQUIRED: byte (must be even) length of default
                                  //  PipeIn; Integer 0-2^32
parameter pipeOutSize = 128;      // REQUIRED: byte (must be even) length of default
                                  // PipeOut; Integer 0-2^32
parameter registerSetSize = 32;   // Size of array for register set commands.

parameter Tsys_clk = 5;           // 100Mhz
//-------------------------------------------------------------------------

// Pipes
integer k;
reg  [7:0]  pipeIn [0:(pipeInSize-1)];
initial for (k=0; k<pipeInSize; k=k+1) pipeIn[k] = 8'h00;

reg  [7:0]  pipeOut [0:(pipeOutSize-1)];
initial for (k=0; k<pipeOutSize; k=k+1) pipeOut[k] = 8'h00;

// Registers
reg [31:0] u32Address  [0:(registerSetSize-1)];
reg [31:0] u32Data     [0:(registerSetSize-1)];
reg [31:0] u32Count;


//------------------------------------------------------------------------
//  Available User Task and Function Calls:
//    FrontPanelReset;                 // Always start routine with FrontPanelReset;
//    SetWireInValue(ep, val, mask);
//    UpdateWireIns;
//    UpdateWireOuts;
//    GetWireOutValue(ep);
//    ActivateTriggerIn(ep, bit);      // bit is an integer 0-31
//    UpdateTriggerOuts;
//    IsTriggered(ep, mask);           // Returns a 1 or 0
//    WriteToPipeIn(ep, length);       // passes pipeIn array data
//    ReadFromPipeOut(ep, length);     // passes data to pipeOut array
//    WriteToBlockPipeIn(ep, blockSize, length);   // pass pipeIn array data; blockSize and length are integers
//    ReadFromBlockPipeOut(ep, blockSize, length); // pass data to pipeOut array; blockSize and length are integers
//    WriteRegister(address, data);
//    ReadRegister(address, data);
//    WriteRegisterSet;                // writes all values in u32Data to the addresses in u32Address
//    ReadRegisterSet;                 // reads all values in the addresses in u32Address to the array u32Data
//
//    *Pipes operate by passing arrays of data back and forth to the user's
//    design.  If you need multiple arrays, you can create a new procedure
//    above and connect it to a differnet array.  More information is
//    available in Opal Kelly documentation and online support tutorial.
//------------------------------------------------------------------------

wire [31:0] NO_MASK = 32'hffff_ffff;
integer i;
reg [31:0] ADC_OUTPUT;

initial begin
    sys_clkp = 1;
    sys_clkn = 0;
    ADC_SDO  = 0;
    
    FrontPanelReset;

    SetWireInValue(8'h00,32'h0000_0007,NO_MASK);            // Assert DAC reset and 50M clock reset.
    SetWireInValue(8'h01,32'h0317_ae10,NO_MASK);            // DAC SPI Data.
    SetWireInValue(8'h02,32'h0000_0000,NO_MASK);            // DAC LDACb.
    SetWireInValue(8'h03,32'h0000_001f,NO_MASK);            // DAC CLRb. 
    UpdateWireIns;
    
    SetWireInValue(8'h00,32'h0000_0000,NO_MASK);            // De-assert DAC reset and 50M clock reset.
    UpdateWireIns;
    
    ActivateTriggerIn(8'h40, 0);                            // trigger DAC1 state machine. 
    #2000;
    ActivateTriggerIn(8'h40, 1);                            // trigger DAC2 state machine. 
    #2000;
    ActivateTriggerIn(8'h40, 2);                            // trigger DAC3 state machine. 
    #2000;
    ActivateTriggerIn(8'h40, 3);                            // trigger DAC4 state machine. 
    #2000;
    ActivateTriggerIn(8'h40, 4);                            // trigger DAC5 state machine. 
    
    #2000;
    SetWireInValue(8'h06,32'h0000_0001,NO_MASK);            // Specify state machine address.
    SetWireInValue(8'h07,32'h0000_0001,NO_MASK);            // ADC SCLK Low Time.
    SetWireInValue(8'h08,32'h0000_0001,NO_MASK);            // ADC SCLK High Time.
    SetWireInValue(8'h0c,32'h0000_0072,NO_MASK);            // ADC Conversion Time (114*8.33ns = 950ns).
    SetWireInValue(8'h0a,32'h0000_0010,NO_MASK);            // ADC Data Frame Size (16).
    SetWireInValue(8'h0b,32'h0000_0005,NO_MASK);            // ADC Number of Samples.
    SetWireInValue(8'h09,32'h0000_a5a5,NO_MASK);            // ADC SPI Data.
    SetWireInValue(8'h00,32'h0000_0010,NO_MASK);            // FIFO write enable pulse generation at the rising edge of CSb.
    UpdateWireIns;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #1 ADC State Machine (SM). 

    #10000;
    ActivateTriggerIn(8'h42, 0);                            // Read FIFO.
    ActivateTriggerIn(8'h42, 0);                            // Read FIFO.
    ActivateTriggerIn(8'h42, 0);                            // Read FIFO.
    ActivateTriggerIn(8'h42, 0);                            // Read FIFO.
    ActivateTriggerIn(8'h42, 0);                            // Read FIFO.
    
    UpdateWireOuts;
    ADC_OUTPUT = GetWireOutValue(8'h20);
    
    #1000;
    ADC_SDO = 0;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #2 ADC SM. 
    
    #10000;
    SetWireInValue(8'h07,32'h0000_0002,NO_MASK);            // ADC SCLK Low Time.
    SetWireInValue(8'h08,32'h0000_0002,NO_MASK);            // ADC SCLK High Time.
    SetWireInValue(8'h00,32'h0000_0000,NO_MASK);            // FIFO write enable pulse generation at the rising edge of CSb disabled.
    UpdateWireIns;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #3 ADC SM. 
    
    #10000;
    SetWireInValue(8'h07,32'h0000_0003,NO_MASK);            // ADC SCLK Low Time.
    SetWireInValue(8'h08,32'h0000_0003,NO_MASK);            // ADC SCLK High Time.
    SetWireInValue(8'h00,32'h0000_0010,NO_MASK);            // FIFO write enable pulse generation at the rising edge of CSb disabled.
    UpdateWireIns;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #4 ADC SM. 
    
    #15000;
    SetWireInValue(8'h07,32'h0000_0004,NO_MASK);            // ADC SCLK Low Time.
    SetWireInValue(8'h08,32'h0000_0004,NO_MASK);            // ADC SCLK High Time.
    UpdateWireIns;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #5 ADC SM. 
    
    #20000;
    SetWireInValue(8'h0a,32'h0000_0018,NO_MASK);            // ADC Data Frame Size (24).
    SetWireInValue(8'h09,32'h00a5_a5a5,NO_MASK);            // ADC SPI Data.
    UpdateWireIns;
    ActivateTriggerIn(8'h41, 0);                            // Trigger #6 ADC SM. 
    
end

always @(negedge ADC_SCLK) begin    // Emulate ADC output with a maximum 'measured' delay of 7ns from the serial clock launch edge, the falling edge as per the SPI-00 protocol, to the next data valid on SDO.
    ADC_SDO = #7 ~ADC_SDO;          
end

`include "./okHostCalls.vh"         // Do not remove!  The tasks, functions, and data stored
                                    // in okHostCalls.vh must be included here.
endmodule

`default_nettype wire
