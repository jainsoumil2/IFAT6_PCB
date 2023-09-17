#%%Inititalize


import os
#path = "C:/Users/jains/OneDrive - UC San Diego/research/IFAT6 PCB/python"
path = "C:/Users/Soumil/OneDrive - UC San Diego/research/IFAT6 PCB/python"
os.chdir(path)


from IFAT6_functions import *
import time
import pyvisa


ssrx.xem.bitfile = str(path)+"/top.bit"    # Location of the bitfile
ssrx.xem.OpenBySerial("")                                                                       # find connected xem7310
error = ssrx.xem.ConfigureFPGA(ssrx.xem.bitfile)                                                # load bitfile
print("FPGA configuration error code:")
print(error)


write_FPGA(ssrx, 0x00, 0x00000020)       # DAC triggers off, LEDs flashing
write_FPGA(ssrx, 0x06, 0x00000000)       # LDACb DAC
write_FPGA(ssrx, 0x07, 0xffffffff)       # CLRb DAC
write_FPGA(ssrx, 0x08, 0x00000000)       # ADC trigger off
write_FPGA(ssrx, reset, 0x03)            # reset DACs and ADC 
time.sleep(1e-3)
write_FPGA(ssrx, reset, 0x00)


#VREF_LDO = 1.804                         # ADC reference voltage provided by LDO
VREF_LDO = 1.793                         # ADC reference voltage provided by LDO


print("Finish DAC1/2/3/4/5 and ADC initialization")
# func_gen = Lab_instruments.AFG3000('GPIB0::8::INSTR')
# curr_source = Lab_instruments.KEI2600B('GPIB0::1::INSTR')


#%% Write to DACs


write_FPGA(ssrx, 0x00, 0x00000020)      # LEDs flashing
    

DAC_Int_Ref_EN(ssrx, 1)
write_DAC(ssrx, 1, VREF_2, 2)
write_DAC(ssrx, 1, DVDD, 1.2)
write_DAC(ssrx, 1, VREF_1_8, 1.8)
write_DAC(ssrx, 1, AVDD, 1.8)
write_DAC(ssrx, 1, DVDD_HIGH, 1.8)
write_DAC(ssrx, 1, EVDD, 1.8)


write_DAC(ssrx, 2, V_TAU0, 0.2)
write_DAC(ssrx, 2, V_TAU1, 0.2)
write_DAC(ssrx, 2, V_TAU2, 0.2)
write_DAC(ssrx, 2, V_TAU3, 0.2)
write_DAC(ssrx, 2, GCOMP, 0)
write_DAC(ssrx, 2, GLEAK_PROXIMAL, 0.2)
write_DAC(ssrx, 2, GLEAK_DISTAL, 0.2)
write_DAC(ssrx, 2, ELEAK, 0.0)


write_DAC(ssrx, 3, VBIAS_SF, 0.0)
write_DAC(ssrx, 3, VAMP_HIGH, 0.0)
write_DAC(ssrx, 3, VBIAS_UNITYBUFFER, 0)
write_DAC(ssrx, 3, VAMP_LOW, 0.0)
write_DAC(ssrx, 3, VSPIKE, 1.8)
write_DAC(ssrx, 3, VSS_SYN, 0.0)
write_DAC(ssrx, 3, SYNAPSE_DRIVE_LOW, 0.0)
write_DAC(ssrx, 3, VREFR, 0.1)


write_DAC(ssrx, 4, EREV0, 0.0)
write_DAC(ssrx, 4, EREV1, 0.0)
write_DAC(ssrx, 4, EREV2, 0.0)
write_DAC(ssrx, 4, EREV3, 0.0)
write_DAC(ssrx, 4, VTHRESH, 0.0)
write_DAC(ssrx, 4, VRESET, 0.0)
write_DAC(ssrx, 4, VPDN, 0.6)
write_DAC(ssrx, 4, VBIAS, 1.2)


write_DAC(ssrx, 5, VBP, 0.9)
write_DAC(ssrx, 5, WIDTH_BIAS_HIGH, 0)
write_DAC(ssrx, 5, WIDTH_BIAS_LOW, 0)
write_DAC(ssrx, 5, VpupReq, 0.8)
write_DAC(ssrx, 5, Vpup_arb, 0.8)
write_DAC(ssrx, 5, VINPUT_CURRENT_BIAS, 1.2)
write_DAC(ssrx, 5, WIDTH_BIAS, 0.0)
write_DAC(ssrx, 5, VDD_1_2, 1.2)


print ("dacs configured")


#%% test clks

write_FPGA(ssrx, 0x0c, 0x06)            # probe DACs and ADC clock 
write_FPGA(ssrx, 0x0c, 0x00) 

#%% ADC


# Clear Brown out reset indicator in 0x00 (SYSTEM_STATUS) register
write_ADC(ssrx, 0x080001)         
read_ADC(ssrx, 0x100000)         # 0 for reading from internal register, 1 for reading a channel


# Reset device (bit 0 in 0x01 register)
write_ADC(ssrx, 0x080101)
time.sleep(5e-3)
read_ADC(ssrx, 0x100000)


#Clear Brown out reset indicator in 0x00 register
write_ADC(ssrx, 0x080001)
read_ADC(ssrx, 0x100000)


# Calibrate
write_ADC(ssrx, 0x080102)


# Check if calibration is done
read_ADC(ssrx, 0x100100)


# Set APPEND_STATUS[1:0] in 0x02 -- Displays CHID on SDO
write_ADC(ssrx, 0x080210)


# Disable Manual mode in ADC FSM
write_FPGA(ssrx, 0x09, 0x00000000)


#%% Diagnostics -- Bit-walk test mode 
write_ADC(ssrx, 0x08BF96)         # set diagnostics_key register
read_ADC(ssrx, 0x10BF00)

write_ADC(ssrx, 0x08C001)         # enable diagnostics
read_ADC(ssrx, 0x10C000)

write_ADC(ssrx, 0x08C100)         # LSB
read_ADC(ssrx, 0x10C100)

write_ADC(ssrx, 0x08C280)         # MSB
read_ADC(ssrx, 0x10C200)

# read voltage from a channel
write_ADC(ssrx, 0x081104)         # Switch to the desired channel  
write_ADC(ssrx, 0x000000)         # send dummy 24 clk cycles, acquire data from the desired channel
data_out = read_ADC(ssrx, 0x000000) # convert and readout the desired channel

data_out = int(data_out, 16)>>8
print((data_out/2**16)*VREF_LDO)

#%% Diagnostics -- Fixed voltage test mode, verify 1.8v on AIN6
write_ADC(ssrx, 0x08BF96)        # set diagnostics_key register 
read_ADC(ssrx, 0x10BF00)


write_ADC(ssrx, 0x08C010)        # enable diagnostics    
read_ADC(ssrx, 0x10C000)


# read voltage from CH6
write_ADC(ssrx, 0x081106)        # Switch to CH6  
write_ADC(ssrx, 0x000000)        # send dummy 24 clk cycles, acquire data from CH6
data_out = read_ADC(ssrx, 0x000000) # convert and readout CH6

data_out = int(data_out, 16)>>8
print((data_out/2**16)*VREF_LDO)


#%% Disable diagnostics
write_ADC(ssrx, 0x08C000)        # disable diagnostics
read_ADC(ssrx, 0x10C000)


write_ADC(ssrx, 0x08BF00)        # set diagnostics_key register 
read_ADC(ssrx, 0x10BF00)


#%% Read a channel in Manual Mode


# Set SEQ_MODE to Manual
write_ADC(ssrx, 0x081000)


# Configure PIN_CFG reg for setting channels as analog inputs
write_ADC(ssrx, 0x080500)
read_ADC(ssrx, 0x100500)


# Calibrate
write_ADC(ssrx, 0x080102)
#time.sleep(1e-3)


# Check if calibration is done
read_ADC(ssrx, 0x100100)


# Set SEQ_MODE to Manual
write_ADC(ssrx, 0x081000)


# read voltage from CH7
write_ADC(ssrx, 0x081107)                   # Switch to the desired channel  
write_ADC(ssrx, 0x000000)                   # send dummy 24 clk cycles, acquire data from the desired channel
data_out = read_ADC(ssrx, 0x000000)         # convert and readout the desired channel 

data_out = int(data_out, 16)>>8
print((data_out/2**16)*VREF_LDO)