#%%
"""
 Specify the location of supporting API files (ok.py, _ok.so, ...) and
 add that location of supporting API files to systems's path.
"""

from pathlib import Path
import platform
import sys

script_dir = Path("IFAT6_functions_v2.py").resolve().parent

ok_files_path = {
    'Darwin': script_dir / 'okFiles' / 'Mac',
    'Windows': script_dir / 'okFiles' / 'Win'
}

sys_path_to_append = ok_files_path.get(platform.system())

if sys_path_to_append:
    sys.path.append(str(sys_path_to_append))                        
else:
    print(f'We might need Opal Kelly drivers for {platform.system()}')

import visa
import pyvisa
import ok
import string
import serial
import struct
import numpy as np
import scipy as sp
import pandas as pd
import csv
import os
import scipy.io
import operator
import time
from scipy.integrate import quad
import matplotlib.pyplot as plt
from matplotlib.figure import Figure
from matplotlib import colors
from operator import itemgetter # for sorting the array by column
from scipy.signal import butter, lfilter, freqz

# BOARD_TAG = 1     # home
BOARD_TAG = 2

VREF_INT            = 2.5
VREF_2v             = 1.9784
VREF_1_8v           = 1.8 
global Num_Samples

# DAC Channels 
# DAC 1
VREF_2              = 0
DVDD                = 1
VREF_1_8            = 2
AVDD                = 3
DVDD_HIGH           = 4
EVDD                = 5

# DAC 2
V_TAU3              = 0
GLEAK_PROXIMAL      = 1
V_TAU2              = 2
GLEAK_DISTAL        = 3
V_TAU1              = 4
ELEAK               = 5
V_TAU0              = 6
GCOMP               = 7 

# DAC 3
VBIAS_SF            = 0
VAMP_HIGH           = 1
VBIAS_UNITYBUFFER   = 2
VAMP_LOW            = 3
VSPIKE              = 4
VSS_SYN             = 5
SYNAPSE_DRIVE_LOW   = 6
VREFR               = 7

# DAC 4
VTHRESH             = 0
EREV0               = 1
VRESET              = 2
EREV1               = 3
VPDN                = 4
EREV2               = 5
VBIAS               = 6
EREV3               = 7

# DAC 5
VBP                 = 0
WIDTH_BIAS_HIGH     = 1
VpupReq             = 2
WIDTH_BIAS_LOW      = 3
Vpup_arb            = 4
VINPUT_CURRENT_BIAS = 5
VDD_1_2             = 6
WIDTH_BIAS          = 7

#%% Opal Kelly definition functions

class OpalKelly:
    def __init__(self):
        return
      
    def InitializeDevice(self):
        
        ''' 
         self.xem = ok.okCFrontPanel()                        Creates a xem7310 object()  -- DEPRECATED.
         self.xem.OpenBySerial("")                            Finds connected xem7310     -- DEPRECATED.
         FrontPanel SDK version used - 5.3.0
         The older FrontPanel API Python class, okCFrontPanel(), is deprecated; now migrating to FrontPanelDevices().
         See https://library.opalkelly.com/library/FrontPanelAPI/migrate_fpdevices.html
         See a list of deprecated API classes and methods, as of FrontPanel SDK version 5.3.0: 
         https://docs.opalkelly.com/fpsdk/frontpanel-api/support-matrix/
        '''
        devices = ok.FrontPanelDevices()
        deviceCount = devices.GetCount()
        print("Device Count:", deviceCount)
        
        self.xem = devices.Open()                                   # Open the first device we find.
        if self.xem == None:
            print("ERROR!\nIs the FrontPanelGui open and connected to the board? Please close the GUI and rerun!")
            return(False)
        else:
            print("                  Device Open:", self.xem.IsOpen())

            # Get some general information about the device.
            info = ok.okTDeviceInfo() 
            self.xem.GetDeviceInfo(info)                            # Populates the info of okTDeviceInfo class -- https://library.opalkelly.com/library/FrontPanelAPI/structokTDeviceInfo.html#details
            print("                      Product: " + info.productName)
            print("             Firmware version: %d.%d" % (info.deviceMajorVersion, info.deviceMinorVersion))
            print("                Serial Number: %s" % info.serialNumber)
            print("                    Device ID: %s" % info.deviceID)
            print("                    USB speed: USB %d" % info.usbSpeed + ".0")
            print(" Configures from System Flash: %s" % info.configuresFromSystemFlash)
            if info.isPLL22150Supported == True:                    # USB 3.0 methods do not support PLLs. See the supported API classes and methods: https://docs.opalkelly.com/fpsdk/frontpanel-api/support-matrix/
                print("Device contains a Cypress CY22150 PLL.")
                self.xem.LoadDefaultPLLConfiguration()
            else:
                print("Device does not contain Cypress CY22150 PLL.")
            if info.isPLL22393Supported == True:
                print("Device contains a Cypress CY22393 PLL.")
                self.xem.LoadDefaultPLLConfiguration()
            else:
                print("Device does not contain Cypress CY22393 PLL.")
                
        return(True) 

    def loadBitFile(self, BIT_FILE_PATH):
        error = self.xem.ConfigureFPGA(BIT_FILE_PATH)               # load bitfile
        if error == 0:
            print("Successfully configured FPGA!")
        else:
            print("FPGA configuration error...")
            print("Error Code: ", error)
            
FPGA = OpalKelly()
if not FPGA.InitializeDevice():
    exit(-1)

#%% Opal Kelly read/write functions.

def write_WireIn(FPGA,addr,value):
    FPGA.xem.SetWireInValue(addr, value, 0xffffffff)
    FPGA.xem.UpdateWireIns()

def read_WireOut(FPGA,addr):
    FPGA.xem.UpdateWireOuts()
    return FPGA.xem.GetWireOutValue(addr)
   
def activate_TriggerIn(FPGA, addr, bit):
    FPGA.xem.ActivateTriggerIn(addr, bit)
    '''
     Trigger a specific bit (second argument) at the TriggerIn endpoint address 
     (first argument).
    '''
    
def check_TriggerOut(FPGA, addr, mask):
    FPGA.xem.UpdateTriggerOuts()
    return FPGA.xem.IsTriggered(addr, mask)                         
    '''
     Check if a particular bit (or bits) on a particular TriggerOut endpoint 
     has triggered since the last call to UpdateTriggerOuts().
     
     Example usage - Returns true if bit 7 of endpoint 0x71 has triggered.
     FPGA.xem.IsTriggered(0x71, 0x80).
    '''

def write_PipeIn(FPGA, addr, data):
    buf = bytearray(data)
    FPGA.xem.WriteToPipeIn(addr, buf)                               # Method transfers a specified buffer of data to the given Pipe In endpoint. 
    '''
     Within Python, the 'length' parameter is not used and the 'data' parameter 
     is of the mutable type bytearray. For example, 
     (see https://library.opalkelly.com/library/FrontPanelAPI/classokCFrontPanel.html)
     buf = bytearray(81920)
     xem.WriteToPipeIn(0x80, buf)
    '''
    
def read_PipeOut(FPGA, addr, length):
    buf = bytearray([0]*4*length)                                   # should be multiple of 16, datain is 4*8-bit = 32-bit number
    error_code=FPGA.xem.ReadFromPipeOut(addr, buf)                  # Method tranfers data from a specified Pipe Out endpoint to the given buffer.
    if (error_code<0):
        print('Read failed. Check error code '+str(error_code)+' from https://docs.opalkelly.com/fpsdk/frontpanel-api/error-codes/')
    else:
        print('number of bytes read: '+str(error_code))
    return buf
    '''    
     Within Python, the 'length' parameter is not used and the 'data' parameter
     is of the mutable type bytearray. For example,
     buf = bytearray(15360)
     xem.ReadFromPipeOut(0x0a, buf)
    '''
    
def write_BlockPipeIn(FPGA, addr, blocksize, data):
    buf = bytearray(data)                               
    FPGA.xem.WriteToBlockPipeIn(addr, blocksize, buf)               # Method transfers a specified buffer of data to the given BlockPipeIn endpoint. 
    '''
     Block size is specified in bytes and can be a power of two [16... 16384] for 
     a USB 3.0 SuperSpeed device.
    
     Within Python, the 'length' parameter is not used and the 'data' parameter 
     is of the mutable type bytearray. For example,
     buf = bytearray(4096)
     xem.ReadFromPipeOut(0x80, 512, buf)
    '''
    
def read_BlockPipeOut(FPGA, addr, blocksize, length):
    buf = bytearray([0]*4*length)                                   # Initialise a buffer for the expected length of data from the Block Pipe Out endpoint.It should be multiple of 16, datain is 4*8-bit = 32-bit number.
    return FPGA.xem.ReadFromBlockPipeOut(addr, blocksize, buf)      # Method transfers data from a specified BlockPipeOut endpoint to the given buffer. 
    '''
     Block size is specified in bytes and can be a power of two [16... 16384] for 
     a USB 3.0 SuperSpeed device.
     Performance Note: Optimum bandwidth performance is achieved when blocksize 
     is a power of two.
     
     Within Python, the 'length' parameter is not used and the 'data' parameter
     is of the mutable type bytearray. For example,
     buf = bytearray(81920)
     xem.ReadFromPipeOut(0xa0, 1024, buf)
    '''

#%% DAC functions.

def Corrected_DAC_Voltage(index, ch, targetV):
    """
     Calculates the corrected target voltage based 
     on linear regression on measured and programmed DAC voltage
    """
    global BOARD_TAG
    if BOARD_TAG == 1:
        if index == 1:
            if ch == 0:     #VREF_2
                correctedV = 0.9994*targetV + 4.1792e-04
                return correctedV
            elif ch == 1:     #DVDD
                correctedV = 0.9990*targetV + 2.7245e-04
                return correctedV 
            elif ch == 2:     #VREF_1_8
                correctedV = 0.9992*targetV - 3.0431e-04
                return correctedV 
            elif ch == 3:     #AVDD
                correctedV = 0.9991*targetV - 9.9911e-05
                return correctedV 
            elif ch == 4:     #DVDD_HIGH
                correctedV = 0.9992*targetV - 3.5882e-04
                return correctedV
            elif ch == 5:     #EVDD
                correctedV = 0.9992*targetV + 4.1786e-04
                return correctedV
            else:
                print('invalid channel.')
            
        elif index == 2:
            if ch == 0:     #V_TAU3
                correctedV = 1.0005*targetV + 5.1390e-04
                return correctedV
            elif ch == 1:     #GLEAK_PROXIMAL
                correctedV = 1.0007*targetV + 7.0506e-04
                return correctedV
            elif ch == 2:     #V_TAU2
                correctedV = 1.0005*targetV + 5.1390e-04
                return correctedV
            elif ch == 3:     #GLEAK_DISTAL
                correctedV = 1.0006*targetV + 9.0058e-04
                return correctedV
            elif ch == 4:     #V_TAU1
                correctedV = 1.0004*targetV + 6.3665e-04
                return correctedV
            elif ch == 5:     #ELEAK
                correctedV = 1.0006*targetV + 0.0012
                return correctedV
            elif ch == 6:     #V_TAU0
                correctedV = 1.0004*targetV + 8.3217e-04
                return correctedV
            elif ch == 7:     #GCOMP
                correctedV = 1.0005*targetV + 5.3663e-04
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 3:
            if ch == 0:     #VBIAS_SF
                correctedV = 1.0008*targetV - 4.3672e-04
                return correctedV
            elif ch == 1:     #VAMP_HIGH
                correctedV = 1.0006*targetV + 3.8205e-04
                return correctedV
            elif ch == 2:     #VBIAS_UNITYBUFFER
                correctedV = 1.0006*targetV + 3.0929e-04
                return correctedV
            elif ch == 3:     #VAMP_LOW
                correctedV = 1.0006*targetV + 2.1376e-04
                return correctedV
            elif ch == 4:     #VSPIKE
                correctedV = 1.0003*targetV - 3.5010e-04
                return correctedV
            elif ch == 5:     #VSS_SYN
                correctedV = 1.0006*targetV + 0.0012
                return correctedV
            elif ch == 6:     #SYNAPSE_DRIVE_LOW
                correctedV = 1.0006*targetV + 4.8663e-04
                return correctedV
            elif ch == 7:     #VREFR
                correctedV = 1.0007*targetV + 3.0020e-04
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 4:
            if ch == 0:     #VTHRESH
                correctedV = 1.0008*targetV + 0.0011
                return correctedV
            elif ch == 1:     #EREV0
                correctedV = 1.0008*targetV + 4.5945e-04 
                return correctedV
            elif ch == 2:     #VRESET 
                correctedV = 1.0007*targetV + 2.9565e-04
                return correctedV
            elif ch == 3:     #EREV1
                correctedV = 1.0007*targetV - 2.1378e-04
                return correctedV
            elif ch == 4:     #VPDN 
                correctedV = 1.0009*targetV + 5.0043e-04
                return correctedV
            elif ch == 5:     #EREV2
                correctedV = 1.0006*targetV + 4.5025e-04
                return correctedV
            elif ch == 6:     #VBIAS
                correctedV = 1.0009*targetV + 7.2795e-05
                return correctedV
            elif ch == 7:     #EREV3
                correctedV = 1.0005*targetV + 3.4107e-04
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 5:
            if ch == 0:     #VBP
                correctedV = 0.9974*targetV + 6.7097e-04
                return correctedV
            elif ch == 1:     #WIDTH_BIAS_HIGH
                correctedV = 0.9972*targetV - 7.7055e-05
                return correctedV
            elif ch == 2:     #VpupReq
                correctedV = 0.9973*targetV + 8.2961e-04
                return correctedV
            elif ch == 3:     #WIDTH_BIAS_LOW
                correctedV = 0.9973*targetV + 2.0852e-04
                return correctedV
            elif ch == 4:     #Vpup_arb
                correctedV = 0.9976*targetV + 3.9450e-04
                return correctedV
            elif ch == 5:     #VINPUT_CURRENT_BIAS
                correctedV = 0.9974*targetV + 7.1175e-04
                return correctedV
            elif ch == 6:     #VDD_1_2
                correctedV = 0.9987*targetV + 5.3114e-04
                return correctedV
            elif ch == 7:     #WIDTH_BIAS
                correctedV = 0.9976*targetV + 4.3530e-04
                return correctedV
            else:
                print('invalid channel.')
                
                
    elif BOARD_TAG == 2:
        if index == 1:
            if ch == 0:     #VREF_2
                correctedV = 1.0072*targetV - 1.3276e-04
                return correctedV
            elif ch == 1:     #DVDD
                correctedV = 1.0069*targetV - 5.4008e-04
                return correctedV 
            elif ch == 2:     #VREF_1_8  
                correctedV = 1.0072*targetV - 3.3419e-04 
                return correctedV 
            elif ch == 3:     #AVDD
                correctedV = 1.0070*targetV - 6.6370e-04
                return correctedV 
            elif ch == 4:     #DVDD_HIGH
                correctedV = 1.0069*targetV - 1.4188e-04
                return correctedV
            elif ch == 5:     #EVDD
                correctedV = 1.0093*targetV + 0.0690 
                return correctedV
            else:
                print('invalid channel.')
                
        # Verify index 2 through 5. Correcting for slope/offset from measurements using scope and multimeter does not show improvement.
        elif index == 2:
            if ch == 0:     #V_TAU3
                correctedV = targetV + 0.0016           
                return correctedV
            elif ch == 1:     #GLEAK_PROXIMAL
                correctedV = targetV
                return correctedV
            elif ch == 2:     #V_TAU2
                correctedV = targetV
                return correctedV
            elif ch == 3:     #GLEAK_DISTAL
                correctedV = targetV
                return correctedV
            elif ch == 4:     #V_TAU1
                correctedV = targetV
                return correctedV
            elif ch == 5:     #ELEAK
                correctedV = targetV
                return correctedV
            elif ch == 6:     #V_TAU0
                correctedV = targetV
                return correctedV
            elif ch == 7:     #GCOMP
                correctedV = targetV
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 3:
            if ch == 0:     #VBIAS_SF
                correctedV = targetV
                return correctedV
            elif ch == 1:     #VAMP_HIGH
                correctedV = targetV
                return correctedV
            elif ch == 2:     #VBIAS_UNITYBUFFER
                correctedV = targetV
                return correctedV
            elif ch == 3:     #VAMP_LOW
                correctedV = targetV
                return correctedV
            elif ch == 4:     #VSPIKE
                correctedV = targetV
                return correctedV
            elif ch == 5:     #VSS_SYN
                correctedV = targetV
                return correctedV
            elif ch == 6:     #SYNAPSE_DRIVE_LOW
                correctedV = targetV
                return correctedV
            elif ch == 7:     #VREFR
                correctedV = targetV
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 4:
            if ch == 0:     #VTHRESH
                correctedV = targetV
                return correctedV
            elif ch == 1:     #EREV0
                correctedV = targetV
                return correctedV
            elif ch == 2:     #VRESET 
                correctedV = targetV
                return correctedV
            elif ch == 3:     #EREV1
                correctedV = targetV
                return correctedV
            elif ch == 4:     #VPDN 
                correctedV = targetV
                return correctedV
            elif ch == 5:     #EREV2
                correctedV = targetV
                return correctedV
            elif ch == 6:     #VBIAS
                correctedV = targetV
                return correctedV
            elif ch == 7:     #EREV3
                correctedV = targetV
                return correctedV
            else:
                print('invalid channel.')
                
        elif index == 5:
            if ch == 0:       #VBP
                correctedV = targetV
                return correctedV
            elif ch == 1:     #WIDTH_BIAS_HIGH
                correctedV = targetV
                return correctedV
            elif ch == 2:     #VpupReq
                correctedV = targetV
                return correctedV
            elif ch == 3:     #WIDTH_BIAS_LOW
                correctedV = targetV
                return correctedV
            elif ch == 4:     #Vpup_arb
                correctedV = targetV
                return correctedV
            elif ch == 5:     #VINPUT_CURRENT_BIAS
                correctedV = targetV
                return correctedV
            elif ch == 6:     #VDD_1_2
                correctedV = targetV
                return correctedV
            elif ch == 7:     #WIDTH_BIAS
                correctedV = targetV
                return correctedV
            else:
                print('invalid channel.')            
                
    else:
        print('invalid board tag entered.')
        return 0
    
def calc_dac_value(index, ch, targetV):
    """
     Converts the target analog output voltage to its equivalent digital counterpart.
    """
    correctedV = Corrected_DAC_Voltage(index, ch, targetV)
    if correctedV < 0:
        correctedV = 0
    print('Corrected Voltage ', correctedV)
    
    if BOARD_TAG == 1:
        if index == 1:
            global VREF_INT
            if correctedV == VREF_INT:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(correctedV / VREF_INT * 2 ** 16).astype('int')
       
        elif (index >= 2) and (index<5):
            global VREF_2v 
            if correctedV == VREF_2v:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(correctedV / VREF_2v * 2 ** 16).astype('int')        
            
        elif index == 5: 
            global VREF_1_8v
            if correctedV == VREF_1_8v:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(correctedV / VREF_1_8v * 2 ** 16).astype('int') 
        
        else: 
            print ('DAC index is wrong.')
            
    if BOARD_TAG == 2:
        if index == 1:
            #global VREF_INT
            if targetV == VREF_INT:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(targetV / VREF_INT * 2 ** 16).astype('int')
       
        elif (index >= 2) and (index<5):
            #global VREF_2v 
            if correctedV == VREF_2v:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(targetV / VREF_2v * 2 ** 16).astype('int')        
            
        elif index == 5: 
            #global VREF_1_8v
            if targetV == VREF_1_8v:
                return np.round(2 ** 16 - 1).astype('int')
            else:
                return np.round(targetV / VREF_1_8v * 2 ** 16).astype('int') 
        
        else: 
            print ('DAC index is wrong.')

def write_DAC(FPGA, index, addr, value):    
    """ 
     Writes to the DAC8568 input 32-bit wide shift register.
    """ 
    if 0 <= addr <= 8:
        data = calc_dac_value(index, addr, value)
        command = int(0x3000000 + (addr * 0x100000) + (data*0x10))
        print('Hex Command ' + str(hex(command)))   
        write_WireIn(FPGA, 0x01, command)
        
        if index == 1:                                  # Specify the DAC to be programmed.
            activate_TriggerIn(FPGA, 0x40, 0)           # Trigger DAC1 State Machine.
        elif index == 2:
            activate_TriggerIn(FPGA, 0x40, 1)           # Trigger DAC2 State Machine.
        elif index == 3:
            activate_TriggerIn(FPGA, 0x40, 2)           # Trigger DAC3 State Machine.
        elif index == 4:
            activate_TriggerIn(FPGA, 0x40, 3)           # Trigger DAC4 State Machine.
        elif index == 5:
            activate_TriggerIn(FPGA, 0x40, 4)           # Trigger DAC5 State Machine.
        else:
            print('Incorrect DAC index.')
    else:
        print('DAC channel address is wrong.')
    

def DAC_Int_Ref_Enable(FPGA, index):
    """ 
     Write into the 32-bit input shift register the command to 
     enable the DAC8568 internal reference (Always Powered On,
     except when performing a power cycle to reset the DAC8568).
    """ 
    command = 0x090A0000
    write_WireIn(FPGA, 0x01, command)   
    
    if index == 1:
        activate_TriggerIn(FPGA, 0x40, 0)               # Trigger DAC1 State Machine.
    elif index == 2:
        activate_TriggerIn(FPGA, 0x40, 1)               # Trigger DAC2 State Machine.
    elif index == 3:
        activate_TriggerIn(FPGA, 0x40, 2)               # Trigger DAC3 State Machine.
    elif index == 4:
        activate_TriggerIn(FPGA, 0x40, 3)               # Trigger DAC4 State Machine.
    elif index == 5:
        activate_TriggerIn(FPGA, 0x40, 4)               # Trigger DAC5 State Machine.
    else:
        print('Incorrect DAC index.')    


#%% ADC functions.

def configure_ADC_SM(FPGA, Low_Time, High_Time, Conversion_Time, Frame_Size, Num_Samples_input):
    '''
    Configure the State Machine parameters within the FPGA for the ADS7067 as follows: 
    1. Set the state machine address as 1, specifying that the ADS7067 state machine
       is being configured.
    2. Set the low and high times of the serial clock input.
    3. Determine the ADC conversion time (the duration during which CSb is logic high).
    4. Define the output data length or frame size, such as 16, 20, 24 or 32 bits long.
    5. Specify the number of samples to be taken.
    '''
    
    # Declare global variables
    global Num_Samples
    Num_Samples = Num_Samples_input
    
    write_WireIn(FPGA, 0x06, 1)                         # 1.
    write_WireIn(FPGA, 0x07, Low_Time)                  # 2.
    write_WireIn(FPGA, 0x08, High_Time)                 # 2.
    write_WireIn(FPGA, 0x0c, Conversion_Time)           # 3.
    write_WireIn(FPGA, 0x0a, Frame_Size)                # 4.
    write_WireIn(FPGA, 0x0b, Num_Samples)               # 5.

def write_ADC(FPGA, command):
    write_WireIn(FPGA, 0x00, 0x00)                      # wi00_ep_dataout[4]=0. Deactivate FIFO write enable pulse generation at the rising edge of CSb.
    write_WireIn(FPGA, 0x09, command)
    activate_TriggerIn(FPGA, 0x41, 0)

def read_ADC_register(FPGA, command):
    write_WireIn(FPGA, 0x00, 0x00)                      # wi00_ep_dataout[4]=0. Deactivate FIFO write enable pulse generation at the rising edge of CSb.
    write_WireIn(FPGA, 0x09, command)
    activate_TriggerIn(FPGA, 0x41, 0)
    ADC_out = read_WireOut(FPGA, 0x20)
    print ("ADC Register Read Output  (bin): " + str(bin(ADC_out>>8)))

def read_ADC_sample(FPGA, command):
    write_WireIn(FPGA, 0x00, 0x10)                      # wi00_ep_dataout[4]=1. Generate a FIFO write enable pulse at the rising edge of CSb.
    write_WireIn(FPGA, 0x09, command)
    activate_TriggerIn(FPGA, 0x41, 0)
    ADC_out = read_WireOut(FPGA, 0x20)
    if (Num_Samples == 1):
        print ("ADC Sample Output (hex): " + str(hex(ADC_out)))
    else:
        pass
    return hex(ADC_out)
