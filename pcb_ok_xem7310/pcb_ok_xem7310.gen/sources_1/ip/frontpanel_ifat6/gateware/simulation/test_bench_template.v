//------------------------------------------------------------------------
// A simple text bench template for simulating a top level user design
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

module TEST_BENCH_TEMPLATE;

wire  [4:0]   okUH;
wire  [2:0]   okHU;
wire  [31:0]  okUHU;
wire          okAA;

// Change to your top level module
USER_TOP_LEVEL_MODULE dut (
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA)

    // Add in the top level ports for your design below:

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

    // Example for applying a reset to the design
    SetWireInValue(8'h00, 32'h0000_0001, NO_MASK);
    UpdateWireIns;
    SetWireInValue(8'h00, 32'h0000_0000, NO_MASK);
    UpdateWireIns;


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

`include "./okHostCalls.vh"   // Do not remove!  The tasks, functions, and data stored
                             // in okHostCalls.vh must be included here.
endmodule

`default_nettype wire
