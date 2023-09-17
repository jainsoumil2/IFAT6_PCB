`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2022 01:27:16 AM
// Design Name: 
// Module Name: top_tb
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
module top_tb;

wire  [4:0]   okUH;
wire  [2:0]   okHU;
wire  [31:0]  okUHU;
wire          okAA;

wire okClk;
wire [31:0]  wi00_ep_dataout, wi01_ep_dataout, wi02_ep_dataout, wi03_ep_dataout, wi04_ep_dataout, 
             wi05_ep_dataout, wi06_ep_dataout, wi07_ep_dataout, wi08_ep_dataout, wi09_ep_dataout,
             wi0a_ep_dataout, wi0b_ep_dataout, wi0c_ep_dataout;
wire [31:0]  wo20_ep_datain, wo21_ep_datain, wo22_ep_datain, wo23_ep_datain;

assign wo23_ep_datain = 32'b0;

// Change to your top level module
frontpanel_ifat6 simulation_inst (
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA),
    
    // Add in the top level ports for your design below:
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
    .wo20_ep_datain(wo20_ep_datain),    // output wire [31 : 0] wo20_ep_datain
    .wo21_ep_datain(wo21_ep_datain),    // output wire [31 : 0] wo21_ep_datain
    .wo22_ep_datain(wo22_ep_datain),    // output wire [31 : 0] wo22_ep_datain
    .wo23_ep_datain(wo23_ep_datain)     // output wire [31 : 0] wo23_ep_datain
);

//////////////////////////////////////////DAC control///////////////////////////////////////////////////////////	 

wire DAC1_LDACB, DAC2_LDACB, DAC3_LDACB, DAC4_LDACB, DAC5_LDACB;
wire DAC1_CLRB, DAC2_CLRB, DAC3_CLRB, DAC4_CLRB, DAC5_CLRB; 
wire DAC_SCLK;
wire DAC1_SDI, DAC2_SDI, DAC3_SDI, DAC4_SDI, DAC5_SDI;
wire DAC1_SYNCB, DAC2_SYNCB, DAC3_SYNCB, DAC4_SYNCB, DAC5_SYNCB;

wire dac1_sclk, dac2_sclk, dac3_sclk, dac4_sclk, dac5_sclk;

assign DAC1_LDACB   = wi06_ep_dataout[0];       // keep low -- synchronous mode (LDACb functionality in datasheet)
assign DAC2_LDACB   = wi06_ep_dataout[1];
assign DAC3_LDACB   = wi06_ep_dataout[2];
assign DAC4_LDACB   = wi06_ep_dataout[3];
assign DAC5_LDACB   = wi06_ep_dataout[4];

assign DAC1_CLRB    = wi07_ep_dataout[0];       // keep high 
assign DAC2_CLRB    = wi07_ep_dataout[1];
assign DAC3_CLRB    = wi07_ep_dataout[2];
assign DAC4_CLRB    = wi07_ep_dataout[3];
assign DAC5_CLRB    = wi07_ep_dataout[4];

assign DAC_SCLK     = dac1_sclk | dac2_sclk | dac3_sclk | dac4_sclk | dac5_sclk;
 
assign wo20_ep_datain[31:5] = 27'b0;
 
dac uut_dac1 (
	// inputs
	.reset_dac(wi0a_ep_dataout[0]),
	.clk_dac(clk_dac),
	.trig(wi00_ep_dataout[0]),
	.data(wi01_ep_dataout[31:0]),
	
	// outputs
	.sdi(DAC1_SDI),
	.syncb(DAC1_SYNCB),
	.sclk(dac1_sclk),
	.done(wo20_ep_datain[0])
);
	 
dac uut_dac2 (
	// inputs
	.reset_dac(wi0a_ep_dataout[0]),
	.clk_dac(clk_dac),
	.trig(wi00_ep_dataout[1]),
	.data(wi02_ep_dataout[31:0]),
	
	// outputs
	.sdi(DAC2_SDI),
	.syncb(DAC2_SYNCB),
	.sclk(dac2_sclk),
	.done(wo20_ep_datain[1])
);
	 
dac uut_dac3 (
	// inputs
	.reset_dac(wi0a_ep_dataout[0]),
	.clk_dac(clk_dac),
	.trig(wi00_ep_dataout[2]),
	.data(wi03_ep_dataout[31:0]),
	
	// outputs
	.sdi(DAC3_SDI),
	.syncb(DAC3_SYNCB),
	.sclk(dac3_sclk),
	.done(wo20_ep_datain[2])
);
	 
dac uut_dac4 (
	// inputs 
	.reset_dac(wi0a_ep_dataout[0]),
	.clk_dac(clk_dac),
	.trig(wi00_ep_dataout[3]),
	.data(wi04_ep_dataout[31:0]),
	
	// outputs
	.sdi(DAC4_SDI),
	.syncb(DAC4_SYNCB),
	.sclk(dac4_sclk),
	.done(wo20_ep_datain[3])
);
	 
dac uut_dac5 (
	// inputs
	.reset_dac(wi0a_ep_dataout[0]),
	.clk_dac(clk_dac),
	.trig(wi00_ep_dataout[4]),
	.data(wi05_ep_dataout[31:0]),
	
	// outputs
	.sdi(DAC5_SDI),
	.syncb(DAC5_SYNCB),
	.sclk(dac5_sclk),
	.done(wo20_ep_datain[4])
);

//////////////////////////////////////////ADC control///////////////////////////////////////////////////////////
wire ADC_SDO;
wire ADC_CSb;
wire ADC_SCLK;
wire ADC_SDI;

wire temp_adc_bit;								
wire temp_adc_csb;													
wire temp_adc_sclk; 
wire adc_done;
wire [23:0] adc_dout;
assign wo21_ep_datain[0] = adc_done;
assign wo22_ep_datain[23:0] = adc_dout;


assign ADC_CSb = temp_adc_csb;								
assign ADC_SCLK = temp_adc_sclk;							
assign ADC_SDI = temp_adc_bit;						


adc uut_adc (
	// inputs
	.clk_adc(clk_adc),
	.trig(wi08_ep_dataout[0]),
	.reset_adc(wi0a_ep_dataout[1]),
    .adc_sdo(ADC_SDO),
	.adc_din(wi0b_ep_dataout[23:0]),
	
	
	// outputs
	.temp_adc_bit(temp_adc_bit),
	.temp_adc_csb(temp_adc_csb),
	.temp_adc_sclk(temp_adc_sclk),
	.adc_done(adc_done),
	.adc_dout(adc_dout)
);


assign wo21_ep_datain[31:1] = 31'b0;            // unused opal kelly wireouts driven to GND
assign wo22_ep_datain[31:24] = 8'b0;            // unused opal kelly wireouts driven to GND


////////////////////////////// MMCM Clk -- 100Mhz ////////////////////////////
wire clk_dac; 

clk_wiz_0 clk_dac_inst  (
.reset(1'b0),
.clk_in1(okClk),
.clk_out1(clk_dac),
.locked()
);

////////////////////////////// MMCM Clk -- 120Mhz ////////////////////////////
wire clk_adc; 

clk_wiz_1 clk_adc_inst  (
.reset(1'b0),
.clk_in1(okClk),
.clk_out1(clk_adc),
.locked()
);

////////////////////////////// MMCM Clk --300MHz ////////////////////////////
wire clk_300M; 

clk_wiz_2 clk_300M_inst  (
.reset(1'b0),
.clk_in1(okClk),
.clk_out1(clk_300M),
.locked()
);

////////////////////////////// fifo ////////////////////////////
reg wr_en, rd_en; 
wire [23:0] dout;
wire empty, full;
wire [13:0] data_count;
wire wr_ack, valid;


always @(posedge adc_done or posedge wr_ack) begin
    if (wr_ack) wr_en = 1'b0;
    else wr_en = 1'b1;    
end


always @(negedge clk_adc) begin
    if (valid) rd_en = 1'b0;
end
  

fifo_generator_1 fifo_inst_1 (
  .clk(clk_adc),               // input wire clk
  .srst(1'b0),                  // input wire srst
  .din(adc_dout),               // input wire [23 : 0] din
  .wr_en(wr_en),                // input wire wr_en
  .rd_en(rd_en),                // input wire rd_en
  
  .dout(dout),                  // output wire [23 : 0] dout
  .full(full),                  // output wire full
  .wr_ack(wr_ack),              // output wire wr_ack
  .empty(empty),                // output wire empty
  .valid(valid),                // output wire valid
  .data_count(data_count)       // output wire [13: 0] data_count
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

initial begin
    FrontPanelReset;
    dummy_adc_sdo = 1'b0;

    wr_en         = 1'b0;
    rd_en         = 1'b0;


    SetWireInValue(8'h0a, 32'h0000_0001, NO_MASK);       // reset DACs
    UpdateWireIns;
    
    SetWireInValue(8'h0a, 32'h0000_0000, NO_MASK);  
    UpdateWireIns;

 
    #4000;                                                // test DAC1
    SetWireInValue(8'h00, 32'h0000_0001, NO_MASK);
    SetWireInValue(8'h01, 32'h0314_d930, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test DAC2
    SetWireInValue(8'h00, 32'h0000_0002, NO_MASK);
    SetWireInValue(8'h02, 32'h0314_d930, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test DAC3
    SetWireInValue(8'h00, 32'h0000_0004, NO_MASK);
    SetWireInValue(8'h03, 32'h0314_d930, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test DAC4
    SetWireInValue(8'h00, 32'h0000_0008, NO_MASK);
    SetWireInValue(8'h04, 32'h0314_d930, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test DAC5
    SetWireInValue(8'h00, 32'h0000_0010, NO_MASK);
    SetWireInValue(8'h05, 32'h0314_d930, NO_MASK);
    UpdateWireIns;
    
    
    
    #4000;
    SetWireInValue(8'h0a, 32'h0000_0002, NO_MASK);       // reset ADC
    UpdateWireIns;
    
    SetWireInValue(8'h0a, 32'h0000_0000, NO_MASK);  
    UpdateWireIns;
    
    
    #4000;                                                // test ADC
    SetWireInValue(8'h08, 32'h0000_0001, NO_MASK);
    SetWireInValue(8'h0b, 32'h0081_d930, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test ADC
    SetWireInValue(8'h08, 32'h0000_0001, NO_MASK);
    SetWireInValue(8'h0b, 32'h0080_f055, NO_MASK);
    UpdateWireIns;
    
    
    #4000;                                                // test ADC
    SetWireInValue(8'h08, 32'h0000_0001, NO_MASK);
    SetWireInValue(8'h0b, 32'h0080_f055, NO_MASK);
    UpdateWireIns;
    
    
    #4000;
    rd_en           = 1'b1;
    #80;
    rd_en           = 1'b0;
    
    #400;
    rd_en           = 1'b1;
    #80;
    rd_en           = 1'b0;
     
    
    // Example for using the pipeIn array with the WriteToPipeIn function
    for(i=0; i<pipeInSize; i=i+1) begin
        pipeIn[i] = $random;
    end
    WriteToPipeIn(8'h80, pipeInSize);


    // Example for using ReadFromPipeOut function with the pipeOut array
    ReadFromPipeOut(8'ha0, pipeOutSize);
    for (k=0; k<pipeOutSize; k=k+1) begin
        $display("pipeOut[%d] 0x%04h", i, pipeOut[i]);
    end
    
    
end


// DAC 1 de-assert trigger on receiving a done signal
always @(posedge wo20_ep_datain[0]) begin
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


// DAC 2 de-assert trigger on receiving a done signal
always @(posedge wo20_ep_datain[1]) begin
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


// DAC 3 de-assert trigger on receiving a done signal
always @(posedge wo20_ep_datain[2]) begin
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


// DAC 4 de-assert trigger on receiving a done signal
always @(posedge wo20_ep_datain[3]) begin
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


// DAC 5 de-assert trigger on receiving a done signal
always @(posedge wo20_ep_datain[4]) begin
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


// ADC de-assert trigger on receiving a done signal
always @(posedge wo21_ep_datain[0]) begin
    SetWireInValue(8'h08, 32'h0000_0000, NO_MASK);   
    UpdateWireIns; 
end


reg dummy_adc_sdo;
assign ADC_SDO = dummy_adc_sdo;

// dummy ADC SDO data
always @(posedge ADC_SCLK) begin
    dummy_adc_sdo = ~dummy_adc_sdo;
end


`include "./okHostCalls.vh"   // Do not remove!  The tasks, functions, and data stored
                             // in okHostCalls.vh must be included here.
endmodule

`default_nettype wire
