from IFAT6_functions_v2 import *

bit_file_path = script_dir / 'BIT_FILES' / 'top.bit'
#LOAD_BIT_FILE = True                              # Load the bit file on power reset
LOAD_BIT_FILE = False                            # Skip loading bitfile if LOAD BIT FILE = False (rely on flash).
if LOAD_BIT_FILE:
    FPGA.loadBitFile(str(bit_file_path))
    
'''
 Write '1111b' to reset the ADC data FIFO (bit 3), ADC state machine (bit 2), 
 DAC state machine (bit 1) and the clocking wizard IP (bit 0).
'''
write_WireIn(FPGA, 0x00, 0x0000_000f)       
write_WireIn(FPGA, 0x00, 0x0000_0000)
write_WireIn(FPGA, 0x02, 0x0000_0000)             # DAC LDACb
write_WireIn(FPGA, 0x03, 0x0000_001f)             # DAC CLRb

# %%
#------------------------------------------------------------------------
# Write to DACs
#------------------------------------------------------------------------

DAC_Int_Ref_Enable(FPGA, 1)                       # Enable internal reference for DAC1.
write_DAC(FPGA, 1, VREF_2, 2)
write_DAC(FPGA, 1, DVDD, 1.2)
write_DAC(FPGA, 1, VREF_1_8, 1.8)
write_DAC(FPGA, 1, AVDD, 1.8)
write_DAC(FPGA, 1, DVDD_HIGH, 1.8)
write_DAC(FPGA, 1, EVDD, 1.8)

write_DAC(FPGA, 2, V_TAU0, 1.6)
write_DAC(FPGA, 2, V_TAU1, 0.2)
write_DAC(FPGA, 2, V_TAU2, 0.2)
write_DAC(FPGA, 2, V_TAU3, 0.2)
write_DAC(FPGA, 2, GCOMP, 0)
write_DAC(FPGA, 2, GLEAK_PROXIMAL, 0.2)
write_DAC(FPGA, 2, GLEAK_DISTAL, 0.2)
write_DAC(FPGA, 2, ELEAK, 0.0)

write_DAC(FPGA, 3, VBIAS_SF, 0.0)
write_DAC(FPGA, 3, VAMP_HIGH, 0.0)
write_DAC(FPGA, 3, VBIAS_UNITYBUFFER, 0)
write_DAC(FPGA, 3, VAMP_LOW, 0.0)
write_DAC(FPGA, 3, VSPIKE, 1.8)
write_DAC(FPGA, 3, VSS_SYN, 0.0)
write_DAC(FPGA, 3, SYNAPSE_DRIVE_LOW, 0.0)
write_DAC(FPGA, 3, VREFR, 0.1)

write_DAC(FPGA, 4, EREV0, 0.0)
write_DAC(FPGA, 4, EREV1, 0.0)
write_DAC(FPGA, 4, EREV2, 0.0)
write_DAC(FPGA, 4, EREV3, 0.0)
write_DAC(FPGA, 4, VTHRESH, 0.0)
write_DAC(FPGA, 4, VRESET, 0.0)
write_DAC(FPGA, 4, VPDN, 0.6)
write_DAC(FPGA, 4, VBIAS, 1.2)

write_DAC(FPGA, 5, VBP, 0.9)
write_DAC(FPGA, 5, WIDTH_BIAS_HIGH, 0.0)
write_DAC(FPGA, 5, WIDTH_BIAS_LOW, 0.0)
write_DAC(FPGA, 5, VpupReq, 0.8)
write_DAC(FPGA, 5, Vpup_arb, 0.8)
write_DAC(FPGA, 5, VINPUT_CURRENT_BIAS, 1.2)
write_DAC(FPGA, 5, WIDTH_BIAS, 0.0)
write_DAC(FPGA, 5, VDD_1_2, 1.2)

#%% 
#------------------------------------------------------------------------
# Initialise ADC ADS7067
#------------------------------------------------------------------------

'''
    1. Reset the ADC state Machine.
    
    2. Configure the ADC state machine parameters. Command syntax is shown below for reference.
       configure_ADC_SM(FPGA, Low_Time, High_Time, Conversion_Time, Frame_Size, Num_Samples).
    
    3. Clear Brown out reset indicator in the SYSTEM_STATUS register (Address = 0x0).
       BOR field (bit 0) is set if a brown out condition occurs or the device is power cycled. 
       Check CRCERR_FUSE field (bit 2) as well. If the bit is set, it means that the power-up
       configuration did not load correctly.
    
    4. Software reset all registers to their default values by setting RST field (bit 0) in
       the GENERAL_CFG register at address location 0x01. 
    
    5. According to the switching characterisics table in the datasheet, the device reset 
       takes a maximum of 5ms, after which the RST bit (0) is automatically reset to 0b,
       and the Brown Out Reset (BOR) indicator bit is set to 1b.
    
    6. Clear Brown out reset indicator. 
    
    7. Calibrate the ADC offset, and then verify if the calibration has been completed. 
       Bit 1 of the 8-bit register read data, obtained using the 'read_ADC_register' 
       function call, should be cleared to 0 once the calibration is complete.
    
    8. Set APPEND_STATUS[1:0] in 0x02 -- Displays CHID field in the output data.
    
    9. Optionally, to debug communication with the device, FIX_PAT field (bit 7) in DATA_CFG
       register at location 0x02 could be set. The device outputs fixed code 0xA5A5 
       repetitively when reading ADC data.
    
    10. Reset Bit 7 of 0x2 DATA_CFG register.
       
'''
write_WireIn(FPGA, 0x00, 0x0000_0004)             # 1.
write_WireIn(FPGA, 0x00, 0x0000_0000)
configure_ADC_SM(FPGA, 1, 1, 114, 24, 2)          # 2.
write_ADC(FPGA, 0x080001)                         # 3.
read_ADC_register(FPGA, 0x100000)
write_ADC(FPGA, 0x080101)                         # 4.
time.sleep(5e-3)                                  # 5.
read_ADC_register(FPGA, 0x100000)
write_ADC(FPGA, 0x080001)                         # 6.
read_ADC_register(FPGA, 0x100000)
write_ADC(FPGA, 0x080102)                         # 7.
read_ADC_register(FPGA, 0x100100)
write_ADC(FPGA, 0x080210)                         # 8.
write_ADC(FPGA, 0x080280)                         # 9.
read_ADC_register(FPGA, 0x000000)
write_ADC(FPGA, 0x080200)                         # 10.

#%%
#------------------------------------------------------------------------ 
# Diagnostics - Bit-walk test mode 
#------------------------------------------------------------------------

print('Testing a 100 mV readout: \n')

'''
 1. Write 0x96 to the DIAGNOSTICS_KEY register at location 0xBF. 
    This action enables write access to diagnostic registers at locations 0xC0, 0xC1 and 0xC2.

 2. Enable diagnostics by setting the BITWALK_EN field (bit 0) in the 
    DIAGNOSTICS_EN register at location 0xC0.
 
 3. Write to the BIT_SAMPLE_LSB register at location 0xC1.
 
 4. Write to the BIT_SAMPLE_MSB register at location 0xC2.
 
 5. Set the ADC output frame size to be 18 bits.
 
 6. Deliver 18 serial clock cycles for data Acquisition from the 
    newly selected MUX channel.
 
 7. Initiate conversion (CSb rising edge), read the conversion result, and save
    it in 'data_out' variable.

 8. Convert the readout digital code to its analog counterpart by dividing with
    65,536 and later multiplying by the ADC reference voltage.
'''

write_WireIn(FPGA, 0x00, 0x0000_0004)             # Reset the ADC state machine.
write_WireIn(FPGA, 0x00, 0x0000_0000)
configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)          # Register write/read require 24 clock cycles.
write_ADC(FPGA, 0x08BF96)                         # 1.
write_ADC(FPGA, 0x08C001)                         # 2.
write_ADC(FPGA, 0x08C139)                         # 3.
write_ADC(FPGA, 0x08C20e)                         # 4.
configure_ADC_SM(FPGA, 1, 1, 114, 18, 1)          # 5.
write_ADC(FPGA, 0x00000)                          # 6.
data_out = read_ADC_sample(FPGA, 0x00000)         # 7.         
print('ADC Voltage Readout: ' + str(((int(data_out, 16)>>2)/2**16)*VREF_1_8v*1000) + ' mV')  # 8.

#%% 
#------------------------------------------------------------------------
# Diagnostics - Fixed voltage test mode, verify 1.8v on AIN6
#------------------------------------------------------------------------

'''
 1. Write 0x96 to the DIAGNOSTICS_KEY register at location 0xBF. 
    This action enables write access to diagnostic registers at 
    locations 0xC0, 0xC1 and 0xC2.
 
 2. Enable diagnostics by setting the VTEST_EN field (bit 4) in the 
    DIAGNOSTICS_EN register at location 0xC0.
 
 3. Configure the desired channel ID in the MANUAL_CHID field of the CHANNEL_SEL 
    register at location 0x11.
 
 4. Set the ADC output frame size to be 18 bits.
 
 5. Transmit 18 serial clock cycles for data Acquisition from the 
    newly selected MUX channel.
 
 6. Initiate conversion (CSb rising edge), read the conversion result, and save
    the it in 'data_out' variable.
    
 7. Convert the readout digital code to its analog counterpart by dividing with
    65,536 and later multiplying by the ADC reference voltage.

'''

configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x08BF96)                         # 1.
write_ADC(FPGA, 0x08C010)                         # 2.
write_ADC(FPGA, 0x081106)                         # 3.
configure_ADC_SM(FPGA, 1, 1, 114, 18, 1)          # 4.
write_ADC(FPGA, 0x00000)                          # 5.
data_out = read_ADC_sample(FPGA, 0x00000)         # 6.
print('ADC Voltage Readout: ' + str(((int(data_out,16)>>2)/2**16)*VREF_1_8v) + ' V')    #7.

#%% Disable diagnostics

'''
 1. Disable diagnostics by resetting the BITWALK_EN/VTEST_EN field 
    in the DIAGNOSTICS_EN register at location 0xC0.
    
 2. Reset the DIAGNOSTICS_KEY register at location 0xBF.
'''

configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x08C000)                         # 1.
write_ADC(FPGA, 0x08BF00)                         # 2.

#%% Manual Sequence Mode.

'''
 1. Configure all channels as analog inputs (AIN) by writing 0x00 to the PIN_CFG
    register at location 0x05.
    
 2. Calibrate the ADC offset error by setting the CAL field (bit 1) of the GENERAL_CFG
    register at location 0x01.
    
 3. Select the SEQ_MODE field of the SEQUENCE_CFG register at location 0x10 to 
    Manual Sequence Mode (00b).
    
 4. Configure the desired channel ID in the MANUAL_CHID field of the CHANNEL_SEL 
    register at location 0x11.
    
 5. Set the ADC output frame size to be 18 bits.
 
 6. Deliver 18 serial clock cycles for data Acquisition from the 
    newly selected MUX channel.
    
 7. Initiate conversion (CSb rising edge), readout the conversion result, and save
    the result in a 'data_out' variable.
    
 8. Convert the readout digital code to its analog counterpart by dividing with
    65,536 and later multiplying by the ADC reference voltage.
'''

write_WireIn(FPGA, 0x00, 0x0000_000c)             # Reset FIFO & ADC SM.
write_WireIn(FPGA, 0x00, 0x0000_0000)
configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x080500)                         # 1.
write_ADC(FPGA, 0x080102)                         # 2.
read_ADC_register(FPGA, 0x100100)                 # Check if calibration is done.
write_ADC(FPGA, 0x081000)                         # 3.
write_ADC(FPGA, 0x081100)                         # 4.
configure_ADC_SM(FPGA, 1, 1, 114, 18, 1)          # 5.
write_ADC(FPGA, 0x00000)                          # 6.
data_out = read_ADC_sample(FPGA, 0x00000)         # 7.
print('ADC Voltage Readout: ' + str(((int(data_out, 16)>>2)/2**16)*VREF_1_8v) + ' V')   # 8.

status_flags    = read_WireOut(FPGA, 0x22)        # FIFO status flags: {24'b0, wr_ack, full, 
                                                  # overflow, valid, empty, underflow, wr_rst_busy, rd_rst_busy}.
rd_data_count   = read_WireOut(FPGA, 0x23)        # FIFO read data count: {15'b0, rd_data_count}.
wr_data_count   = read_WireOut(FPGA, 0x24)        # FIFO write data count: {15'b0, wr_data_count}.
activate_TriggerIn(FPGA, 0x42, 0)                 # FIFO read trigger.
print('FIFO Data Output: '      + str(hex(read_WireOut(FPGA, 0x21))))
print('FIFO status: '           + str(bin(status_flags)))
print('FIFO read data count: '  + str(rd_data_count))
print('FIFO write data count: ' + str(wr_data_count))

#%% Manual Sequence Mode. Multi-sample readout and FIFO test.

CH_ID = 0
Num_Samples = 5000
Sampling_period = 1.242e-6
write_WireIn(FPGA, 0x00, 0x0000_000c)
write_WireIn(FPGA, 0x00, 0x0000_0000)  
configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x080102)
read_ADC_register(FPGA, 0x100100)                 # Check if calibration is done.
write_ADC(FPGA, 0x081000)                         # Set scanning mode to manual.
write_ADC(FPGA, int(0x081100+CH_ID))

configure_ADC_SM(FPGA, 1, 1, 114, 16, 1)                                         
write_ADC(FPGA, 0x0000)                           # First Acquisition (Conversion readout through SPI to be discarded). 
configure_ADC_SM(FPGA, 1, 1, 114, 16, Num_Samples)# Configure ADC state machine to take 'Num_Samples' samples.
data_out        = read_ADC_sample(FPGA, 0x0000)   # Take 'Num_Samples' samples.
time.sleep(1)                                     # Wait for ADC to finish.
status_flags    = read_WireOut(FPGA, 0x22)                     
rd_data_count   = read_WireOut(FPGA, 0x23)     
wr_data_count   = read_WireOut(FPGA, 0x24)     
print("FIFO status: " + str(bin(status_flags)))
print("FIFO read data count: " + str(rd_data_count))
print("FIFO write data count: " + str(wr_data_count) + '\n')

'''
    1.  Read data from PipeOut.
    
    2.  Reshape the bytearray into a 2D Numpy array with 4 columns. Each group 
        of 4 bytes from the original bytearray forms a single row in the new 2D 
        array, representing a 32-bit packet from PipeOut.
       
    3.  Convert to 32-bit unsigned integers by using view() to reinterpret the reshaped array as uint32.
       
       Compare the for loop ADC output printed in hex with the data stored in 
       the PipeOut buffer: 
       
    4. Create a new array to store the first 'Num_Samples' elements from PipeOut buffer.
    
    5. Convert to hexadecimal and store in the new array.
    
    6. Print out the new array.
    
    7. Plot the first 'Num_Samples' points.
'''

datalength = 131072                                         # When reading from PipeOut, 
                                                            # ensure the bytearray's size (4*datalength) 
                                                            # that stores pipe data is a multiple of 16.
buf = read_PipeOut(FPGA, 0xa0, datalength)                  # 1.
buf_uint8_reshaped = np.reshape(buf,(-1,4))                 # 2.
buf_uint32 = buf_uint8_reshaped.view(dtype=np.uint32)       # 3.

buf_hex = np.empty(Num_Samples, dtype=object)               # 4.
for i, value in enumerate(buf_uint32[:Num_Samples,0]):      # 5.
    buf_hex[i] = hex(value)
print(buf_hex)                                              # 6.

for i in range(1):                                          # 7.
    plt.figure(figsize=(10, 5))
    plt.plot(np.arange(Num_Samples)*Sampling_period, (buf_uint32[:Num_Samples] / 2 ** 16) * VREF_1_8v, marker='o', linestyle='-')
    plt.title(f'First 100 points of buf_ch{CH_ID}')
    plt.xlabel('Time')
    plt.ylabel('Value')
    plt.grid(True)
    plt.show()

#%% Auto-Sequence mode.

Num_Channels = 8
Num_Samples = 5000
Sampling_period = 1.242e-6
write_WireIn(FPGA, 0x00, 0x0000_000c)
write_WireIn(FPGA, 0x00, 0x0000_0000)  
configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x0812ff)                         # Select all channels auto sequencing.
write_ADC(FPGA, 0x081011)                         # Select auto-sequence mode as the
                                                  # mode of scanning and start channel sequencing.
configure_ADC_SM(FPGA, 1, 1, 114, 16, 1)                                         
write_ADC(FPGA, 0x0000)                           # First Acquisition (Conversion readout through SPI to be discarded). 
configure_ADC_SM(FPGA, 1, 1, 114, 16, Num_Samples)# Configure ADC state machine to take 'Num_Samples' samples.
data_out        = read_ADC_sample(FPGA, 0x0000)   # Take 'Num_Samples' samples.
time.sleep(1)                                     # Wait for ADC to finish.
status_flags    = read_WireOut(FPGA, 0x22)                     
rd_data_count   = read_WireOut(FPGA, 0x23)     
wr_data_count   = read_WireOut(FPGA, 0x24)     
print("FIFO status: " + str(bin(status_flags)))
print("FIFO read data count: " + str(rd_data_count))
print("FIFO write data count: " + str(wr_data_count) + '\n')
configure_ADC_SM(FPGA, 1, 1, 114, 24, 1)
write_ADC(FPGA, 0x081001)                         # Stop channel sequencing.

'''
    1.  Read data from PipeOut.
    
    2.  Reshape the bytearray into a 2D Numpy array with 4 columns. Each group 
        of 4 bytes from the original bytearray forms a single row in the new 2D 
        array, representing a 32-bit packet from PipeOut.
       
    3.  Convert to 32-bit unsigned integers by using view() to reinterpret the reshaped array as uint32.
       
       Compare the for loop ADC output printed in hex with the data stored in 
       the PipeOut buffer: 
       
    4. Create a new array to store the first 'Num_Samples' elements from PipeOut buffer.
    
    5. Convert to hexadecimal and store in the new array.
    
    6. Print out the new array.
    
    7. Separate each sequenced channel's data.
    
    8. Plot the first 'Num_Samples' data points of each sequenced channel.
'''

datalength = 131072                                         # When reading from PipeOut, 
                                                            # ensure the bytearray's size (4*datalength) 
                                                            # that stores pipe data is a multiple of 16.
buf = read_PipeOut(FPGA, 0xa0, datalength)                  # 1.
buf_uint8_reshaped = np.reshape(buf,(-1,4))                 # 2.
buf_uint32 = buf_uint8_reshaped.view(dtype=np.uint32)       # 3.

buf_hex = np.empty(Num_Samples, dtype=object)               # 4.
for i, value in enumerate(buf_uint32[:Num_Samples,0]):      # 5.
    buf_hex[i] = hex(value)
print(buf_hex)                                              # 6.

buf_ch0 = buf_uint32[::Num_Channels]                        # 7. 
buf_ch1 = buf_uint32[1::Num_Channels]
buf_ch2 = buf_uint32[2::Num_Channels]
buf_ch3 = buf_uint32[3::Num_Channels]
buf_ch4 = buf_uint32[4::Num_Channels]                        
buf_ch5 = buf_uint32[5::Num_Channels]
buf_ch6 = buf_uint32[6::Num_Channels]
buf_ch7 = buf_uint32[7::Num_Channels]

for i in range(Num_Channels):                               # 8.
    plt.figure(figsize=(10, 5))
    buf_ch = globals()[f"buf_ch{i}"]  # Dynamically access buf_ch0, buf_ch1, buf_ch2, buf_ch3
    plt.plot(np.arange(round(Num_Samples/Num_Channels))*Sampling_period*Num_Channels, 
    (buf_ch[:round(Num_Samples/Num_Channels)] / 2 ** 16) * VREF_1_8v, marker='o', linestyle='-')
    plt.title(f'First 100 points of buf_ch{i}')
    plt.xlabel('Index')
    plt.ylabel('Value')
    plt.grid(True)
    plt.show()