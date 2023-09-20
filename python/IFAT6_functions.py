import sys
import visa
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


#path = "C:/Users/jains/OneDrive - UC San Diego/research/IFAT6_PCB/python"
BOARD_TAG = 1
path = "C:/Users/Soumil/OneDrive - UC San Diego/research/IFAT6_PCB/python"
#BOARD_TAG = 2


VREF_INT            = 2.5
VREF_2v             = 2
VREF_1_8v           = 1.8


DAC1_data_addr      = 0x01                                                      # opal kelly's wire in endpoint address for sending DAC commands
DAC2_data_addr      = 0x02                                                      # opal kelly's wire in endpoint address for sending DAC commands
DAC3_data_addr      = 0x03                                                      # opal kelly's wire in endpoint address for sending DAC commands
DAC4_data_addr      = 0x04                                                      # opal kelly's wire in endpoint address for sending DAC commands
DAC5_data_addr      = 0x05                                                      # opal kelly's wire in endpoint address for sending DAC commands
DAC_trig_addr       = 0x00                                                      # opal kelly's wire in endpoint address for trigger for initiating DAC SPI 
DAC_done_addr       = 0x20                                                      # opal kelly's wire out endpoint address for done flag when DAC SPI ends


#DAC Channels 
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


reset               = 0x0a
ADC_data_addr       = 0x0b
ADC_trig_addr       = 0x08
#ADC_read            = 0x0a
ADC_done_addr       = 0x21
ADC_data_out        = 0x22


class Object(object):
    pass

class SsRx:
    def __init__(self):
        self.xem = ok.okCFrontPanel()  # create xem7310 object
        self.xem.bitfile = str(path)+"/BIT_FILES/top.bit"  # Location of the bitfile
        self.xem.OpenBySerial()  # find connected xem7310
        error = self.xem.ConfigureFPGA(self.xem.bitfile)  # load bitfile
        print("FPGA configuration error code: " + str(error))
        print("Inital FPGA Bit flash complete..")
        return 

    def initDevice(self): # set the SYS_RST
        # self.xem.LoadDefaultPLLConfiguration()
        self.xem.SetWireInValue(0x00,1, 0xffffffff)
        self.xem.UpdateWireIns()
        time.sleep(0.00001) # unit: second
        self.xem.SetWireInValue(0x00,0, 0xffffffff)
        self.xem.UpdateWireIns()
        time.sleep(0.0001)
        self.xem.SetWireInValue(0x00,1,0xffffffff)
        self.xem.UpdateWireIns()
        print("Finish SYS_RST")
        return

ssrx = SsRx()

def write_FPGA(ssrx,addr,value): 
    ssrx.xem.SetWireInValue(addr, value,0xffffffff)
    ssrx.xem.UpdateWireIns()

def SetWire(ssrx,addr,value): 
    ssrx.xem.SetWireInValue(addr, value,0xffffffff)
    
def UpdateWire(ssrx):
    ssrx.xem.UpdateWireIns()

def read_FPGA(ssrx,addr): 
    ssrx.xem.UpdateWireOuts()
    return ssrx.xem.GetWireOutValue(addr)

def calc_corrected_dac_value(index, ch, targetV):
    """
    functional description - calculates the corrected target voltage based 
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
                print('invalid channel!')
            
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
                print('invalid channel!')
                
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
                print('invalid channel!')
                
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
                print('invalid channel!')
                
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
                print('invalid channel!')
                
                
    elif BOARD_TAG == 2:
        if index == 1:
            if ch == 0:     #VREF_2
                correctedV = 1.0072*targetV - 1.3276e-04
                return correctedV
            if ch == 1:     #DVDD
                correctedV = 1.0069*targetV - 5.4008e-04
                return correctedV 
            if ch == 2:     #VREF_1_8  
                correctedV = 1.0072*targetV - 3.3419e-04 
                return correctedV 
            if ch == 3:     #AVDD
                correctedV = 1.0070*targetV - 6.6370e-04
                return correctedV 
            if ch == 4:     #DVDD_HIGH
                correctedV = 1.0069*targetV - 1.4188e-04
                return correctedV
            
    else:
        print('invalid board tag entered!')
        return 0
    
def calc_dac_values(index, ch, targetV):
    """
    functional description - calculates the DAC digital value to achieve the
    target output voltage
    """
    correctedV = calc_corrected_dac_value(index, ch, targetV)
    if correctedV < 0:
        correctedV = 0
    print('corrected voltage: ', correctedV)
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
            print ('DAC index is wrong!')
            
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
            print ('DAC index is wrong!')

def write_DAC(ssrx, index, ch, value):
    """
    functional description:
    writes I/V DACs
    """
    if 0 <= ch <= 8:
        done = 0
        addr = ch % 8
        data = calc_dac_values(index, ch, value)
        command = int(0x3000000 + (addr * 0x100000) + (data*0x10))
        print('command: ' + str(hex(command)))
        if index == 1:                                                          # index specifies one out of five DACs 
            write_FPGA(ssrx, DAC1_data_addr, command)    
            write_FPGA(ssrx, DAC_trig_addr, 0x01)                               # 0x01 triggers DAC1 SPI
            while True:
                done = read_FPGA(ssrx, DAC_done_addr)
                if done == 0x01:
                    write_FPGA(ssrx, DAC_trig_addr, 0x00)
                    break
        elif index == 2:
            write_FPGA(ssrx, DAC2_data_addr, command)    
            write_FPGA(ssrx, DAC_trig_addr, 0x02)                               # 0x02 triggers DAC2 SPI
            while True:
                done = read_FPGA(ssrx, DAC_done_addr)
                #print('done '+ str(hex(done)))                                 # Printing 'done' is useful for debugging purpose
                if done == 0x02:
                    write_FPGA(ssrx, DAC_trig_addr, 0x00)
                    break
        elif index == 3:
            write_FPGA(ssrx, DAC3_data_addr, command)    
            write_FPGA(ssrx, DAC_trig_addr, 0x04)                               # 0x04 triggers DAC3 SPI
            while True:
                done = read_FPGA(ssrx, DAC_done_addr)
                if done == 0x04:
                    write_FPGA(ssrx, DAC_trig_addr, 0x00)
                    break
        elif index == 4:
            write_FPGA(ssrx, DAC4_data_addr, command)    
            write_FPGA(ssrx, DAC_trig_addr, 0x08)                               # 0x08 triggers DAC4 SPI
            while True:
                done = read_FPGA(ssrx, DAC_done_addr)
                if done == 0x08:
                    write_FPGA(ssrx, DAC_trig_addr, 0x00)
                    break
        elif index == 5:
            write_FPGA(ssrx, DAC5_data_addr, command)    
            write_FPGA(ssrx, DAC_trig_addr, 0x10)                               # 0x10 triggers DAC5 SPI
            while True:
                done = read_FPGA(ssrx, DAC_done_addr)
                if done == 0x10:
                    write_FPGA(ssrx, DAC_trig_addr, 0x00)
                    break
        else:
            print('DAC index is wrong!')
    else:
        print("DAC Channel 'ch' is wrong!")
    

def DAC_Int_Ref_EN(ssrx, index):
    done = 0
    command = 0x090A0000
    if index == 1:
        write_FPGA(ssrx, DAC1_data_addr, command)    
        write_FPGA(ssrx, DAC_trig_addr, 0x01)                               # 0x01 triggers DAC1 SPI
        while True:
            done = read_FPGA(ssrx, DAC_done_addr)
            if done == 0x01:
                write_FPGA(ssrx, DAC_trig_addr, 0x00)
                break
    elif index == 2:
        write_FPGA(ssrx, DAC2_data_addr, command)    
        write_FPGA(ssrx, DAC_trig_addr, 0x02)                               # 0x02 triggers DAC2 SPI
        while True:
            done = read_FPGA(ssrx, DAC_done_addr)
            #print('done '+ str(hex(done)))                                 # Printing 'done' is useful for debugging purpose
            if done == 0x02:
                write_FPGA(ssrx, DAC_trig_addr, 0x00)
                break
    elif index == 3:
        write_FPGA(ssrx, DAC3_data_addr, command)    
        write_FPGA(ssrx, DAC_trig_addr, 0x04)                               # 0x04 triggers DAC3 SPI
        while True:
            done = read_FPGA(ssrx, DAC_done_addr)
            if done == 0x04:
                write_FPGA(ssrx, DAC_trig_addr, 0x00)
                break
    elif index == 4:
        write_FPGA(ssrx, DAC4_data_addr, command)    
        write_FPGA(ssrx, DAC_trig_addr, 0x08)                               # 0x08 triggers DAC4 SPI
        while True:
            done = read_FPGA(ssrx, DAC_done_addr)
            if done == 0x08:
                write_FPGA(ssrx, DAC_trig_addr, 0x00)
                break
    elif index == 5:
        write_FPGA(ssrx, DAC5_data_addr, command)    
        write_FPGA(ssrx, DAC_trig_addr, 0x10)                               # 0x10 triggers DAC5 SPI
        while True:
            done = read_FPGA(ssrx, DAC_done_addr)
            if done == 0x10:
                write_FPGA(ssrx, DAC_trig_addr, 0x00)
                break
    else:
        print('DAC index is wrong!')    

    
def write_ADC(ssrx, command):

    done = 0  
    write_FPGA(ssrx, ADC_data_addr, command)
    #write_FPGA(ssrx, ADC_read, 0x00)
    write_FPGA(ssrx, ADC_trig_addr, 0x01)                                       # 0x01 triggers ADC SPI 
       
    while True:
        done = read_FPGA(ssrx, ADC_done_addr)
        if done == 1:
            write_FPGA(ssrx, ADC_trig_addr, 0x00)
            break
        
        
def read_ADC(ssrx, command):

    done = 0
    write_FPGA(ssrx, ADC_data_addr, command)
    #write_FPGA(ssrx, ADC_read, 0x01)
    write_FPGA(ssrx, ADC_trig_addr, 0x01)  # 0x01 will initiate write to ADC0

    while True:
        done = read_FPGA(ssrx, ADC_done_addr)
        if done == 1:
            ADC_out = read_FPGA(ssrx, ADC_data_out)
            print ("ADC " + str(hex(ADC_out)))
            write_FPGA(ssrx, ADC_trig_addr, 0x00)
            return hex(ADC_out)

    
    