############################################################################
## System Clock On XEM7310-A200
############################################################################
set_property PACKAGE_PIN W11 [get_ports {sys_clkp}]
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkp}]

set_property PACKAGE_PIN W12 [get_ports {sys_clkn}]
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkn}]

create_clock -name sys_clk -period 5 [get_ports sys_clkp]

############################################################################
## Asyncronous Clocks
############################################################################
# okUH[0] is used to produce okClk on the IP instantiation
set_clock_groups -name async-groups -asynchronous \
-group [get_clocks -include_generated_clocks -of_objects [get_ports okUH[0]]] \
-group [get_clocks -include_generated_clocks sys_clk] \
-group clk_dac \
-group clk_adc \
-group clk_300M

#set_clock_groups -group clk_dac -group clk_adc -asynchronous
############################################################################
## IFAT6 
############################################################################

# Outputs
# MC2-15
set_property PACKAGE_PIN P5 [get_ports {INPUT_DATA0}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA0}]

# MC2-17
set_property PACKAGE_PIN P4 [get_ports {INPUT_DATA1}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA1}]

# MC2-19
set_property PACKAGE_PIN N4 [get_ports {INPUT_DATA2}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA2}]

# MC2-21
set_property PACKAGE_PIN N3 [get_ports {INPUT_DATA3}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA3}]

# MC2-23
set_property PACKAGE_PIN L5 [get_ports {INPUT_DATA4}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA4}]

# MC2-25
set_property PACKAGE_PIN L4 [get_ports {INPUT_DATA5}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA5}]

# MC2-27
set_property PACKAGE_PIN M6 [get_ports {INPUT_DATA6}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA6}]

# MC2-29
set_property PACKAGE_PIN M5 [get_ports {INPUT_DATA7}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA7}]

# MC2-31
set_property PACKAGE_PIN M1 [get_ports {INPUT_DATA8}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA8}]

# MC2-33
set_property PACKAGE_PIN L1 [get_ports {INPUT_DATA9}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA9}]

# MC2-37
set_property PACKAGE_PIN K2 [get_ports {INPUT_DATA10}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA10}]

# MC2-39
set_property PACKAGE_PIN J2 [get_ports {INPUT_DATA11}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA11}]

# MC2-41
set_property PACKAGE_PIN K1 [get_ports {INPUT_DATA12}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA12}]

# MC2-43
set_property PACKAGE_PIN J1 [get_ports {INPUT_DATA13}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA13}]

# MC2-45
set_property PACKAGE_PIN H3 [get_ports {INPUT_DATA14}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA14}]

# MC2-47
set_property PACKAGE_PIN G3 [get_ports {INPUT_DATA15}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA15}]

# MC2-49
set_property PACKAGE_PIN E2 [get_ports {INPUT_DATA16}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA16}]

# MC2-51
set_property PACKAGE_PIN D2 [get_ports {INPUT_DATA17}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA17}]

# MC2-53
set_property PACKAGE_PIN F3 [get_ports {INPUT_DATA18}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA18}]

# MC2-57
set_property PACKAGE_PIN E3 [get_ports {INPUT_DATA19}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA19}]

# MC2-59
set_property PACKAGE_PIN B1 [get_ports {INPUT_DATA20}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA20}]

# MC2-61
set_property PACKAGE_PIN A1 [get_ports {INPUT_DATA21}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA21}]

# MC2-63
set_property PACKAGE_PIN K4 [get_ports {INPUT_DATA22}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA22}]

# MC2-65
set_property PACKAGE_PIN J4 [get_ports {INPUT_DATA23}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA23}]

# MC1-62
set_property PACKAGE_PIN AB2 [get_ports {INPUT_DATA_REQ}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA_REQ}]

# MC1-58
set_property PACKAGE_PIN Y1 [get_ports {SHIFT_REG_D}]
set_property IOSTANDARD LVCMOS12 [get_ports {SHIFT_REG_D}]

# MC1-54
set_property PACKAGE_PIN W1 [get_ports {COL_SHIFT_REG_CLK}]
set_property IOSTANDARD LVCMOS12 [get_ports {COL_SHIFT_REG_CLK}]

# MC1-52
set_property PACKAGE_PIN V3 [get_ports {ROW_SHIFT_REG_CLK}]
set_property IOSTANDARD LVCMOS12 [get_ports {ROW_SHIFT_REG_CLK}]

# MC2-16
set_property PACKAGE_PIN P6 [get_ports {ASYNC_RST}]
set_property IOSTANDARD LVCMOS12 [get_ports {ASYNC_RST}]

# MC2-18
set_property PACKAGE_PIN N5 [get_ports {SHIFT_REG_SET}]
set_property IOSTANDARD LVCMOS12 [get_ports {SHIFT_REG_SET}]

# MC2-20
set_property PACKAGE_PIN P2 [get_ports {ARRAY_SHIFT_REG_CLK}]
set_property IOSTANDARD LVCMOS12 [get_ports {ARRAY_SHIFT_REG_CLK}]

# MC2-48
set_property PACKAGE_PIN G2 [get_ports {OUTPUT_DATA_ACK}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA_ACK}]

# MC2-46
set_property PACKAGE_PIN H2 [get_ports {PULSE_GEN_RST}]
set_property IOSTANDARD LVCMOS12 [get_ports {PULSE_GEN_RST}]

# MC2-44
set_property PACKAGE_PIN H5 [get_ports {_setLFSR}]
set_property IOSTANDARD LVCMOS12 [get_ports {_setLFSR}]

# MC2-42
set_property PACKAGE_PIN J5 [get_ports {resetIFAT}]
set_property IOSTANDARD LVCMOS12 [get_ports {resetIFAT}]

# Inputs
# MC1-60
set_property PACKAGE_PIN AB3 [get_ports {INPUT_DATA_ACK}]
set_property IOSTANDARD LVCMOS12 [get_ports {INPUT_DATA_ACK}]

# MC2-52
set_property PACKAGE_PIN F1 [get_ports {OUTPUT_DATA0}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA0}]

# MC2-54
set_property PACKAGE_PIN E1 [get_ports {OUTPUT_DATA1}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA1}]

# MC2-58
set_property PACKAGE_PIN D1 [get_ports {OUTPUT_DATA2}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA2}]

# MC2-60
set_property PACKAGE_PIN C2 [get_ports {OUTPUT_DATA3}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA3}]

# MC2-62
set_property PACKAGE_PIN B2 [get_ports {OUTPUT_DATA4}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA4}]

# MC2-40
set_property PACKAGE_PIN K3 [get_ports {OUTPUT_DATA5}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA5}]

# MC2-38
set_property PACKAGE_PIN L3 [get_ports {OUTPUT_DATA6}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA6}]

# MC2-34
set_property PACKAGE_PIN J6 [get_ports {OUTPUT_DATA7}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA7}]

# MC2-32
set_property PACKAGE_PIN K6 [get_ports {OUTPUT_DATA8}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA8}]

# MC2-30
set_property PACKAGE_PIN M2 [get_ports {OUTPUT_DATA9}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA9}]

# MC2-28
set_property PACKAGE_PIN M3 [get_ports {OUTPUT_DATA10}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA10}]

# MC2-26
set_property PACKAGE_PIN P1 [get_ports {OUTPUT_DATA11}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA11}]

# MC2-24
set_property PACKAGE_PIN R1 [get_ports {OUTPUT_DATA12}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA12}]

# MC2-22
set_property PACKAGE_PIN N2 [get_ports {OUTPUT_DATA13}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA13}]

# MC2-50
set_property PACKAGE_PIN G1 [get_ports {OUTPUT_DATA_REQ}]
set_property IOSTANDARD LVCMOS12 [get_ports {OUTPUT_DATA_REQ}]

####################### 
## Clocks
####################### 

# MC1-27
set_property PACKAGE_PIN T5 [get_ports {PROBE_CLK_ADC}]
set_property IOSTANDARD LVCMOS12 [get_ports {PROBE_CLK_ADC}]

# MC1-29
set_property PACKAGE_PIN U5 [get_ports {PROBE_CLK_DAC}]
set_property IOSTANDARD LVCMOS12 [get_ports {PROBE_CLK_DAC}]

# MC1-32
set_property PACKAGE_PIN R4 [get_ports {PROBE_CLK_300M}]
set_property IOSTANDARD LVCMOS12 [get_ports {PROBE_CLK_300M}]

####################### 
## ADC
####################### 

# MC2-71
set_property PACKAGE_PIN V13 [get_ports {ADC_CSb}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_CSb}]

# MC2-69
set_property PACKAGE_PIN U16 [get_ports {ADC_SCLK}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_SCLK}]

# MC2-67
set_property PACKAGE_PIN T16 [get_ports {ADC_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_SDI}]

# MC1-48
set_property PACKAGE_PIN AB8 [get_ports {ADC_SDO}]
set_property IOSTANDARD LVCMOS12 [get_ports {ADC_SDO}]

####################### 
## DAC1
####################### 

# MC2-73
set_property PACKAGE_PIN V14 [get_ports {DAC1_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC1_SDI}]

# MC2-74
set_property PACKAGE_PIN Y14 [get_ports {DAC1_SYNCB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC1_SYNCB}]

# MC1-66
set_property PACKAGE_PIN AA14 [get_ports {DAC_SCLK}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC_SCLK}]

# MC2-76
set_property PACKAGE_PIN Y12 [get_ports {DAC1_LDACB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC1_LDACB}]

# MC2-75
set_property PACKAGE_PIN Y11 [get_ports {DAC1_CLRB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC1_CLRB}]

####################### 
## DAC2
####################### 

# MC1-68
set_property PACKAGE_PIN AA13 [get_ports {DAC2_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC2_SDI}]

# MC1-64
set_property PACKAGE_PIN Y13 [get_ports {DAC2_SYNCB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC2_SYNCB}]

# MC1-75
set_property PACKAGE_PIN Y16 [get_ports {DAC2_LDACB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC2_LDACB}]

# MC1-70
set_property PACKAGE_PIN AB13 [get_ports {DAC2_CLRB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC2_CLRB}]

####################### 
## DAC3
####################### 

# MC1-71
set_property PACKAGE_PIN AA15 [get_ports {DAC3_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC3_SDI}]

# MC1-69
set_property PACKAGE_PIN AB17 [get_ports {DAC3_SYNCB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC3_SYNCB}]

# MC1-67
set_property PACKAGE_PIN AB16 [get_ports {DAC3_LDACB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC3_LDACB}]

# MC1-73
set_property PACKAGE_PIN AB15 [get_ports {DAC3_CLRB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC3_CLRB}]

####################### 
## DAC4
####################### 

# MC2-70
set_property PACKAGE_PIN T15 [get_ports {DAC4_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC4_SDI}]

# MC2-68
set_property PACKAGE_PIN T14 [get_ports {DAC4_SYNCB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC4_SYNCB}]

# MC2-66
set_property PACKAGE_PIN V15 [get_ports {DAC4_LDACB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC4_LDACB}]

# MC2-72
set_property PACKAGE_PIN W14 [get_ports {DAC4_CLRB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC4_CLRB}]

####################### 
## DAC5
####################### 

# MC1-76
set_property PACKAGE_PIN AA16 [get_ports {DAC5_SDI}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC5_SDI}]

# MC2-64
set_property PACKAGE_PIN U15 [get_ports {DAC5_SYNCB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC5_SYNCB}]

# MC1-74
set_property PACKAGE_PIN W16 [get_ports {DAC5_LDACB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC5_LDACB}]

# MC1-72
set_property PACKAGE_PIN W15 [get_ports {DAC5_CLRB}]
set_property IOSTANDARD LVCMOS33 [get_ports {DAC5_CLRB}]
