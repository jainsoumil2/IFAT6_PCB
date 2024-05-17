set_property IOSTANDARD LVDS_25 [get_ports sys_clkp]
set_property IOSTANDARD LVDS_25 [get_ports sys_clkn]
set_property PACKAGE_PIN W11 [get_ports sys_clkp]
set_property PACKAGE_PIN W12 [get_ports sys_clkn]
set_clock_groups -name async-groups -asynchronous -group [get_clocks -include_generated_clocks -of_objects [get_ports {okUH[0]}]] -group [get_clocks -include_generated_clocks -of_objects [get_ports sys_clkp]]

# set_property PACKAGE_PIN Y18 [get_ports {reset}]
# set_property IOSTANDARD LVCMOS18 [get_ports {reset}]
# set_property SLEW FAST [get_ports {reset}]
# MC1-1
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-2
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-3
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-4
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-5
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-6
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-7
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-8
# set_property PACKAGE_PIN AB11 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-9
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-10
# set_property PACKAGE_PIN M9 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-11
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-12
# set_property PACKAGE_PIN L10 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-13
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-14
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-15
# set_property PACKAGE_PIN W9 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-16
# set_property PACKAGE_PIN V9 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-17
# set_property PACKAGE_PIN Y9 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-18
# set_property PACKAGE_PIN V8 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-19
# set_property PACKAGE_PIN R6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-20
# set_property PACKAGE_PIN V7 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-21
# set_property PACKAGE_PIN T6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-22
# set_property PACKAGE_PIN W7 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-23
# set_property PACKAGE_PIN U6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-24
# set_property PACKAGE_PIN Y8 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-25
# set_property PACKAGE_PIN V5 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-26
# set_property PACKAGE_PIN Y7 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-27
set_property PACKAGE_PIN T5 [get_ports PROBE_CLK_ADC]
set_property IOSTANDARD LVCMOS33 [get_ports PROBE_CLK_ADC]
set_property SLEW SLOW [get_ports PROBE_CLK_ADC]
set_property DRIVE 4 [get_ports PROBE_CLK_ADC]
# MC1-28
# set_property PACKAGE_PIN W6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-29
set_property PACKAGE_PIN U5 [get_ports PROBE_CLK_DAC]
set_property IOSTANDARD LVCMOS33 [get_ports PROBE_CLK_DAC]
set_property SLEW SLOW [get_ports PROBE_CLK_DAC]
set_property DRIVE 4 [get_ports PROBE_CLK_DAC]
# MC1-30
# set_property PACKAGE_PIN W5 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-31
# set_property PACKAGE_PIN AA5 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-32
set_property PACKAGE_PIN R4 [get_ports PROBE_CLK_300M]
set_property IOSTANDARD LVCMOS33 [get_ports PROBE_CLK_300M]
set_property SLEW SLOW [get_ports PROBE_CLK_300M]
set_property DRIVE 4 [get_ports PROBE_CLK_300M]
# MC1-33
# set_property PACKAGE_PIN AB5 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-34
# set_property PACKAGE_PIN T4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-35
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-36
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-37
# set_property PACKAGE_PIN AB7 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-38
# set_property PACKAGE_PIN Y4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-39
# set_property PACKAGE_PIN AB6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-40
# set_property PACKAGE_PIN AA4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-41
# set_property PACKAGE_PIN R3 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-42
# set_property PACKAGE_PIN Y6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-43
# set_property PACKAGE_PIN R2 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-44
# set_property PACKAGE_PIN AA6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-45
# set_property PACKAGE_PIN Y3 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-46
# set_property PACKAGE_PIN AA8 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-47
# set_property PACKAGE_PIN AA3 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-48
set_property PACKAGE_PIN AB8 [get_ports ADC_SDO]
set_property IOSTANDARD LVCMOS33 [get_ports ADC_SDO]
# MC1-49
# set_property PACKAGE_PIN U2 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-50
# set_property PACKAGE_PIN U3 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-51
# set_property PACKAGE_PIN V2 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-52
set_property PACKAGE_PIN V3 [get_ports ROW_SHIFT_REG_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports ROW_SHIFT_REG_CLK]
set_property SLEW SLOW [get_ports ROW_SHIFT_REG_CLK]
set_property DRIVE 4 [get_ports ROW_SHIFT_REG_CLK]
# MC1-53
# set_property PACKAGE_PIN W2 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-54
set_property PACKAGE_PIN W1 [get_ports COL_SHIFT_REG_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports COL_SHIFT_REG_CLK]
set_property SLEW SLOW [get_ports COL_SHIFT_REG_CLK]
set_property DRIVE 4 [get_ports COL_SHIFT_REG_CLK]
# MC1-55
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-56
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-57
# set_property PACKAGE_PIN Y2 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-58
set_property PACKAGE_PIN Y1 [get_ports SHIFT_REG_D]
set_property IOSTANDARD LVCMOS33 [get_ports SHIFT_REG_D]
set_property SLEW SLOW [get_ports SHIFT_REG_D]
set_property DRIVE 4 [get_ports SHIFT_REG_D]
# MC1-59
# set_property PACKAGE_PIN T1 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-60
set_property PACKAGE_PIN AB3 [get_ports INPUT_DATA_ACK]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA_ACK]
# MC1-61
# set_property PACKAGE_PIN U1 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-62
set_property PACKAGE_PIN AB2 [get_ports INPUT_DATA_REQ]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA_REQ]
set_property SLEW SLOW [get_ports INPUT_DATA_REQ]
set_property DRIVE 4 [get_ports INPUT_DATA_REQ]
# MC1-63
# set_property PACKAGE_PIN AA1 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-64
set_property PACKAGE_PIN Y13 [get_ports DAC2_SYNCb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC2_SYNCb]
set_property SLEW SLOW [get_ports DAC2_SYNCb]
set_property DRIVE 4 [get_ports DAC2_SYNCb]
# MC1-65
# set_property PACKAGE_PIN AB1 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-66
set_property PACKAGE_PIN AA14 [get_ports DAC_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_SCLK]
set_property SLEW SLOW [get_ports DAC_SCLK]
set_property DRIVE 4 [get_ports DAC_SCLK]
# MC1-67
set_property PACKAGE_PIN AB16 [get_ports DAC3_LDACb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC3_LDACb]
set_property SLEW SLOW [get_ports DAC3_LDACb]
set_property DRIVE 4 [get_ports DAC3_LDACb]
# MC1-68
set_property PACKAGE_PIN AA13 [get_ports DAC2_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC2_SDI]
set_property SLEW SLOW [get_ports DAC2_SDI]
set_property DRIVE 4 [get_ports DAC2_SDI]
# MC1-69
set_property PACKAGE_PIN AB17 [get_ports DAC3_SYNCb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC3_SYNCb]
set_property SLEW SLOW [get_ports DAC3_SYNCb]
set_property DRIVE 4 [get_ports DAC3_SYNCb]
# MC1-70
set_property PACKAGE_PIN AB13 [get_ports DAC2_CLRb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC2_CLRb]
set_property SLEW SLOW [get_ports DAC2_CLRb]
set_property DRIVE 4 [get_ports DAC2_CLRb]
# MC1-71
set_property PACKAGE_PIN AA15 [get_ports DAC3_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC3_SDI]
set_property SLEW SLOW [get_ports DAC3_SDI]
set_property DRIVE 4 [get_ports DAC3_SDI]
# MC1-72
set_property PACKAGE_PIN W15 [get_ports DAC5_CLRb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC5_CLRb]
set_property SLEW SLOW [get_ports DAC5_CLRb]
set_property DRIVE 4 [get_ports DAC5_CLRb]
# MC1-73
set_property PACKAGE_PIN AB15 [get_ports DAC3_CLRb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC3_CLRb]
set_property SLEW SLOW [get_ports DAC3_CLRb]
set_property DRIVE 4 [get_ports DAC3_CLRb]
# MC1-74
set_property PACKAGE_PIN W16 [get_ports DAC5_LDACb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC5_LDACb]
set_property SLEW SLOW [get_ports DAC5_LDACb]
set_property DRIVE 4 [get_ports DAC5_LDACb]
# MC1-75
set_property PACKAGE_PIN Y16 [get_ports DAC2_LDACb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC2_LDACb]
set_property SLEW SLOW [get_ports DAC2_LDACb]
set_property DRIVE 4 [get_ports DAC2_LDACb]
# MC1-76
set_property PACKAGE_PIN AA16 [get_ports DAC5_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC5_SDI]
set_property SLEW SLOW [get_ports DAC5_SDI]
set_property DRIVE 4 [get_ports DAC5_SDI]
# MC1-77
# set_property PACKAGE_PIN V4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-78
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC1-79
# set_property PACKAGE_PIN W4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC1-80
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-1
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-2
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-3
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-4
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-5
# set_property PACKAGE_PIN V12 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-6
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-7
# set_property PACKAGE_PIN T13 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-8
# set_property PACKAGE_PIN U13 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-9
# set_property PACKAGE_PIN R13 [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-10
# set_property PACKAGE_PIN F4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC2-11
# set_property PACKAGE_PIN AB12 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC2-12
# set_property PACKAGE_PIN L6 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC2-13
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-14
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-15
set_property PACKAGE_PIN P5 [get_ports INPUT_DATA0]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA0]
set_property SLEW SLOW [get_ports INPUT_DATA0]
set_property DRIVE 4 [get_ports INPUT_DATA0]
# MC2-16
set_property PACKAGE_PIN P6 [get_ports ASYNC_RST]
set_property IOSTANDARD LVCMOS33 [get_ports ASYNC_RST]
set_property SLEW SLOW [get_ports ASYNC_RST]
set_property DRIVE 4 [get_ports ASYNC_RST]
# MC2-17
set_property PACKAGE_PIN P4 [get_ports INPUT_DATA1]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA1]
set_property SLEW SLOW [get_ports INPUT_DATA1]
set_property DRIVE 4 [get_ports INPUT_DATA1]
# MC2-18
set_property PACKAGE_PIN N5 [get_ports SHIFT_REG_SET]
set_property IOSTANDARD LVCMOS33 [get_ports SHIFT_REG_SET]
set_property SLEW SLOW [get_ports SHIFT_REG_SET]
set_property DRIVE 4 [get_ports SHIFT_REG_SET]
# MC2-19
set_property PACKAGE_PIN N4 [get_ports INPUT_DATA2]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA2]
set_property SLEW SLOW [get_ports INPUT_DATA2]
set_property DRIVE 4 [get_ports INPUT_DATA2]
# MC2-20
set_property PACKAGE_PIN P2 [get_ports ARRAY_SHIFT_REG_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports ARRAY_SHIFT_REG_CLK]
set_property SLEW SLOW [get_ports ARRAY_SHIFT_REG_CLK]
set_property DRIVE 4 [get_ports ARRAY_SHIFT_REG_CLK]
# MC2-21
set_property PACKAGE_PIN N3 [get_ports INPUT_DATA3]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA3]
set_property SLEW SLOW [get_ports INPUT_DATA3]
set_property DRIVE 4 [get_ports INPUT_DATA3]
# MC2-22
set_property PACKAGE_PIN N2 [get_ports OUTPUT_DATA13]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA13]
# MC2-23
set_property PACKAGE_PIN L5 [get_ports INPUT_DATA4]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA4]
set_property SLEW SLOW [get_ports INPUT_DATA4]
set_property DRIVE 4 [get_ports INPUT_DATA4]
# MC2-24
set_property PACKAGE_PIN R1 [get_ports OUTPUT_DATA12]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA12]
# MC2-25
set_property PACKAGE_PIN L4 [get_ports INPUT_DATA5]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA5]
set_property SLEW SLOW [get_ports INPUT_DATA5]
set_property DRIVE 4 [get_ports INPUT_DATA5]
# MC2-26
set_property PACKAGE_PIN P1 [get_ports OUTPUT_DATA11]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA11]
# MC2-27
set_property PACKAGE_PIN M6 [get_ports INPUT_DATA6]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA6]
set_property SLEW SLOW [get_ports INPUT_DATA6]
set_property DRIVE 4 [get_ports INPUT_DATA6]
# MC2-28
set_property PACKAGE_PIN M3 [get_ports OUTPUT_DATA10]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA10]
# MC2-29
set_property PACKAGE_PIN M5 [get_ports INPUT_DATA7]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA7]
set_property SLEW SLOW [get_ports INPUT_DATA7]
set_property DRIVE 4 [get_ports INPUT_DATA7]
# MC2-30
set_property PACKAGE_PIN M2 [get_ports OUTPUT_DATA9]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA9]
# MC2-31
set_property PACKAGE_PIN M1 [get_ports INPUT_DATA8]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA8]
set_property SLEW SLOW [get_ports INPUT_DATA8]
set_property DRIVE 4 [get_ports INPUT_DATA8]
# MC2-32
set_property PACKAGE_PIN K6 [get_ports OUTPUT_DATA8]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA8]
# MC2-33
set_property PACKAGE_PIN L1 [get_ports INPUT_DATA9]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA9]
set_property SLEW SLOW [get_ports INPUT_DATA9]
set_property DRIVE 4 [get_ports INPUT_DATA9]
# MC2-34
set_property PACKAGE_PIN J6 [get_ports OUTPUT_DATA7]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA7]
# MC2-35
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-36
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-37
set_property PACKAGE_PIN K2 [get_ports INPUT_DATA10]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA10]
set_property SLEW SLOW [get_ports INPUT_DATA10]
set_property DRIVE 4 [get_ports INPUT_DATA10]
# MC2-38
set_property PACKAGE_PIN L3 [get_ports OUTPUT_DATA6]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA6]
# MC2-39
set_property PACKAGE_PIN J2 [get_ports INPUT_DATA11]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA11]
set_property SLEW SLOW [get_ports INPUT_DATA11]
set_property DRIVE 4 [get_ports INPUT_DATA11]
# MC2-40
set_property PACKAGE_PIN K3 [get_ports OUTPUT_DATA5]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA5]
# MC2-41
set_property PACKAGE_PIN K1 [get_ports INPUT_DATA12]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA12]
set_property SLEW SLOW [get_ports INPUT_DATA12]
set_property DRIVE 4 [get_ports INPUT_DATA12]
# MC2-42
set_property PACKAGE_PIN J5 [get_ports resetIFAT]
set_property IOSTANDARD LVCMOS33 [get_ports resetIFAT]
set_property SLEW SLOW [get_ports resetIFAT]
set_property DRIVE 4 [get_ports resetIFAT]
# MC2-43
set_property PACKAGE_PIN J1 [get_ports INPUT_DATA13]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA13]
set_property SLEW SLOW [get_ports INPUT_DATA13]
set_property DRIVE 4 [get_ports INPUT_DATA13]
# MC2-44
set_property PACKAGE_PIN H5 [get_ports _setLFSR]
set_property IOSTANDARD LVCMOS33 [get_ports _setLFSR]
set_property SLEW SLOW [get_ports _setLFSR]
set_property DRIVE 4 [get_ports _setLFSR]
# MC2-45
set_property PACKAGE_PIN H3 [get_ports INPUT_DATA14]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA14]
set_property SLEW SLOW [get_ports INPUT_DATA14]
set_property DRIVE 4 [get_ports INPUT_DATA14]
# MC2-46
set_property PACKAGE_PIN H2 [get_ports PULSE_GEN_RST]
set_property IOSTANDARD LVCMOS33 [get_ports PULSE_GEN_RST]
set_property SLEW SLOW [get_ports PULSE_GEN_RST]
set_property DRIVE 4 [get_ports PULSE_GEN_RST]
# MC2-47
set_property PACKAGE_PIN G3 [get_ports INPUT_DATA15]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA15]
set_property SLEW SLOW [get_ports INPUT_DATA15]
set_property DRIVE 4 [get_ports INPUT_DATA15]
# MC2-48
set_property PACKAGE_PIN G2 [get_ports OUTPUT_DATA_ACK]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA_ACK]
set_property SLEW SLOW [get_ports OUTPUT_DATA_ACK]
set_property DRIVE 4 [get_ports OUTPUT_DATA_ACK]
# MC2-49
set_property PACKAGE_PIN E2 [get_ports INPUT_DATA16]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA16]
set_property SLEW SLOW [get_ports INPUT_DATA16]
set_property DRIVE 4 [get_ports INPUT_DATA16]
# MC2-50
set_property PACKAGE_PIN G1 [get_ports OUTPUT_DATA_REQ]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA_REQ]
# MC2-51
set_property PACKAGE_PIN D2 [get_ports INPUT_DATA17]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA17]
set_property SLEW SLOW [get_ports INPUT_DATA17]
set_property DRIVE 4 [get_ports INPUT_DATA17]
# MC2-52
set_property PACKAGE_PIN F1 [get_ports OUTPUT_DATA0]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA0]
# MC2-53
set_property PACKAGE_PIN F3 [get_ports INPUT_DATA18]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA18]
set_property SLEW SLOW [get_ports INPUT_DATA18]
set_property DRIVE 4 [get_ports INPUT_DATA18]
# MC2-54
set_property PACKAGE_PIN E1 [get_ports OUTPUT_DATA1]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA1]
# MC2-55
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-56
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-57
set_property PACKAGE_PIN E3 [get_ports INPUT_DATA19]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA19]
set_property SLEW SLOW [get_ports INPUT_DATA19]
set_property DRIVE 4 [get_ports INPUT_DATA19]
# MC2-58
set_property PACKAGE_PIN D1 [get_ports OUTPUT_DATA2]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA2]
# MC2-59
set_property PACKAGE_PIN B1 [get_ports INPUT_DATA20]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA20]
set_property SLEW SLOW [get_ports INPUT_DATA20]
set_property DRIVE 4 [get_ports INPUT_DATA20]
# MC2-60
set_property PACKAGE_PIN C2 [get_ports OUTPUT_DATA3]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA3]
# MC2-61
set_property PACKAGE_PIN A1 [get_ports INPUT_DATA21]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA21]
set_property SLEW SLOW [get_ports INPUT_DATA21]
set_property DRIVE 4 [get_ports INPUT_DATA21]
# MC2-62
set_property PACKAGE_PIN B2 [get_ports OUTPUT_DATA4]
set_property IOSTANDARD LVCMOS33 [get_ports OUTPUT_DATA4]
# MC2-63
set_property PACKAGE_PIN K4 [get_ports INPUT_DATA22]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA22]
set_property SLEW SLOW [get_ports INPUT_DATA22]
set_property DRIVE 4 [get_ports INPUT_DATA22]
# MC2-64
set_property PACKAGE_PIN U15 [get_ports DAC5_SYNCb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC5_SYNCb]
set_property SLEW SLOW [get_ports DAC5_SYNCb]
set_property DRIVE 4 [get_ports DAC5_SYNCb]
# MC2-65
set_property PACKAGE_PIN J4 [get_ports INPUT_DATA23]
set_property IOSTANDARD LVCMOS33 [get_ports INPUT_DATA23]
set_property SLEW SLOW [get_ports INPUT_DATA23]
set_property DRIVE 4 [get_ports INPUT_DATA23]
# MC2-66
set_property PACKAGE_PIN V15 [get_ports DAC4_LDACb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC4_LDACb]
set_property SLEW SLOW [get_ports DAC4_LDACb]
set_property DRIVE 4 [get_ports DAC4_LDACb]
# MC2-67
set_property PACKAGE_PIN T16 [get_ports ADC_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports ADC_SDI]
set_property SLEW SLOW [get_ports ADC_SDI]
set_property DRIVE 4 [get_ports ADC_SDI]
# MC2-68
set_property PACKAGE_PIN T14 [get_ports DAC4_SYNCb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC4_SYNCb]
set_property SLEW SLOW [get_ports DAC4_SYNCb]
set_property DRIVE 4 [get_ports DAC4_SYNCb]
# MC2-69
set_property PACKAGE_PIN U16 [get_ports ADC_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports ADC_SCLK]
set_property SLEW SLOW [get_ports ADC_SCLK]
set_property DRIVE 4 [get_ports ADC_SCLK]
# MC2-70
set_property PACKAGE_PIN T15 [get_ports DAC4_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC4_SDI]
set_property SLEW SLOW [get_ports DAC4_SDI]
set_property DRIVE 4 [get_ports DAC4_SDI]
# MC2-71
set_property PACKAGE_PIN V13 [get_ports ADC_CSb]
set_property IOSTANDARD LVCMOS33 [get_ports ADC_CSb]
set_property SLEW SLOW [get_ports ADC_CSb]
set_property DRIVE 4 [get_ports ADC_CSb]
# MC2-72
set_property PACKAGE_PIN W14 [get_ports DAC4_CLRb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC4_CLRb]
set_property SLEW SLOW [get_ports DAC4_CLRb]
set_property DRIVE 4 [get_ports DAC4_CLRb]
# MC2-73
set_property PACKAGE_PIN V14 [get_ports DAC1_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC1_SDI]
set_property SLEW SLOW [get_ports DAC1_SDI]
set_property DRIVE 4 [get_ports DAC1_SDI]
# MC2-74
set_property PACKAGE_PIN Y14 [get_ports DAC1_SYNCb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC1_SYNCb]
set_property SLEW SLOW [get_ports DAC1_SYNCb]
set_property DRIVE 4 [get_ports DAC1_SYNCb]
# MC2-75
set_property PACKAGE_PIN Y11 [get_ports DAC1_CLRb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC1_CLRb]
set_property SLEW SLOW [get_ports DAC1_CLRb]
set_property DRIVE 4 [get_ports DAC1_CLRb]
# MC2-76
set_property PACKAGE_PIN Y12 [get_ports DAC1_LDACb]
set_property IOSTANDARD LVCMOS33 [get_ports DAC1_LDACb]
set_property SLEW SLOW [get_ports DAC1_LDACb]
set_property DRIVE 4 [get_ports DAC1_LDACb]
# MC2-77
# set_property PACKAGE_PIN H4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC2-78
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]
# MC2-79
# set_property PACKAGE_PIN G4 [get_ports {}]
# set_property IOSTANDARD LVCMOS33 [get_ports {}]
# MC2-80
# set_property PACKAGE_PIN  [get_ports {}]
# set_property IOSTANDARD  [get_ports {}]

## LEDs #####################################################################
# set_property PACKAGE_PIN A13 [get_ports {led_out_tristate[0]}]
# set_property PACKAGE_PIN B13 [get_ports {led_out_tristate[1]}]
# set_property PACKAGE_PIN A14 [get_ports {led_out_tristate[2]}]
# set_property PACKAGE_PIN A15 [get_ports {led_out_tristate[3]}]
# set_property PACKAGE_PIN B15 [get_ports {led_out_tristate[4]}]
# set_property PACKAGE_PIN A16 [get_ports {led_out_tristate[5]}]
# set_property PACKAGE_PIN B16 [get_ports {led_out_tristate[6]}]
# set_property PACKAGE_PIN B17 [get_ports {led_out_tristate[7]}]
# set_property IOSTANDARD LVCMOS15 [get_ports {led_out_tristate[*]}]

## Flash ####################################################################
# set_property PACKAGE_PIN AA9 [get_ports {spi_dq0}]
# set_property PACKAGE_PIN V10 [get_ports {spi_c}]
# set_property PACKAGE_PIN W10 [get_ports {spi_s}]
# set_property PACKAGE_PIN AB10 [get_ports {spi_dq1}]
# set_property PACKAGE_PIN AA10 [get_ports {spi_w_dq2}]
# set_property PACKAGE_PIN AA11 [get_ports {spi_hold_dq3}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_dq0}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_c}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_s}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_dq1}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_w_dq2}]
# set_property IOSTANDARD LVCMOS33 [get_ports {spi_hold_dq3}]

## DRAM #####################################################################
# set_property PACKAGE_PIN N18 [get_ports {ddr3_dq[0]}]
# set_property PACKAGE_PIN L20 [get_ports {ddr3_dq[1]}]
# set_property PACKAGE_PIN N20 [get_ports {ddr3_dq[2]}]
# set_property PACKAGE_PIN K18 [get_ports {ddr3_dq[3]}]
# set_property PACKAGE_PIN M18 [get_ports {ddr3_dq[4]}]
# set_property PACKAGE_PIN K19 [get_ports {ddr3_dq[5]}]
# set_property PACKAGE_PIN N19 [get_ports {ddr3_dq[6]}]
# set_property PACKAGE_PIN L18 [get_ports {ddr3_dq[7]}]
# set_property PACKAGE_PIN L16 [get_ports {ddr3_dq[8]}]
# set_property PACKAGE_PIN L14 [get_ports {ddr3_dq[9]}]
# set_property PACKAGE_PIN K14 [get_ports {ddr3_dq[10]}]
# set_property PACKAGE_PIN M15 [get_ports {ddr3_dq[11]}]
# set_property PACKAGE_PIN K16 [get_ports {ddr3_dq[12]}]
# set_property PACKAGE_PIN M13 [get_ports {ddr3_dq[13]}]
# set_property PACKAGE_PIN K13 [get_ports {ddr3_dq[14]}]
# set_property PACKAGE_PIN L13 [get_ports {ddr3_dq[15]}]
# set_property PACKAGE_PIN D22 [get_ports {ddr3_dq[16]}]
# set_property PACKAGE_PIN C20 [get_ports {ddr3_dq[17]}]
# set_property PACKAGE_PIN E21 [get_ports {ddr3_dq[18]}]
# set_property PACKAGE_PIN D21 [get_ports {ddr3_dq[19]}]
# set_property PACKAGE_PIN G21 [get_ports {ddr3_dq[20]}]
#  set_property PACKAGE_PIN C22 [get_ports {ddr3_dq[21]}]
# set_property PACKAGE_PIN E22 [get_ports {ddr3_dq[22]}]
# set_property PACKAGE_PIN B22 [get_ports {ddr3_dq[23]}]
# set_property PACKAGE_PIN A20 [get_ports {ddr3_dq[24]}]
# set_property PACKAGE_PIN D19 [get_ports {ddr3_dq[25]}]
# set_property PACKAGE_PIN A19 [get_ports {ddr3_dq[26]}]
# set_property PACKAGE_PIN F19 [get_ports {ddr3_dq[27]}]
# set_property PACKAGE_PIN C18 [get_ports {ddr3_dq[28]}]
# set_property PACKAGE_PIN E19 [get_ports {ddr3_dq[29]}]
# set_property PACKAGE_PIN A18 [get_ports {ddr3_dq[30]}]
# set_property PACKAGE_PIN C19 [get_ports {ddr3_dq[31]}]
# set_property SLEW FAST [get_ports {ddr3_dq[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[*]}]

# set_property PACKAGE_PIN J21 [get_ports {ddr3_addr[0]}]
# set_property PACKAGE_PIN J22 [get_ports {ddr3_addr[1]}]
# set_property PACKAGE_PIN K21 [get_ports {ddr3_addr[2]}]
# set_property PACKAGE_PIN H22 [get_ports {ddr3_addr[3]}]
# set_property PACKAGE_PIN G13 [get_ports {ddr3_addr[4]}]
# set_property PACKAGE_PIN G17 [get_ports {ddr3_addr[5]}]
# set_property PACKAGE_PIN H15 [get_ports {ddr3_addr[6]}]
# set_property PACKAGE_PIN G16 [get_ports {ddr3_addr[7]}]
# set_property PACKAGE_PIN G20 [get_ports {ddr3_addr[8]}]
# set_property PACKAGE_PIN M21 [get_ports {ddr3_addr[9]}]
# set_property PACKAGE_PIN J15 [get_ports {ddr3_addr[10]}]
# set_property PACKAGE_PIN G15 [get_ports {ddr3_addr[11]}]
# set_property PACKAGE_PIN H13 [get_ports {ddr3_addr[12]}]
# set_property PACKAGE_PIN K22 [get_ports {ddr3_addr[13]}]
# set_property PACKAGE_PIN L21 [get_ports {ddr3_addr[14]}]
# set_property SLEW FAST [get_ports {ddr3_addr[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[*]}]

# set_property PACKAGE_PIN H18 [get_ports {ddr3_ba[0]}]
# set_property PACKAGE_PIN J19 [get_ports {ddr3_ba[1]}]
# set_property PACKAGE_PIN H19 [get_ports {ddr3_ba[2]}]
# set_property SLEW FAST [get_ports {ddr3_ba[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[*]}]

# set_property PACKAGE_PIN J16 [get_ports {ddr3_ras_n}]
# set_property SLEW FAST [get_ports {ddr3_ras_n}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_ras_n}]

# set_property PACKAGE_PIN H17 [get_ports {ddr3_cas_n}]
# set_property SLEW FAST [get_ports {ddr3_cas_n}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_cas_n}]

# set_property PACKAGE_PIN J20 [get_ports {ddr3_we_n}]
# set_property SLEW FAST [get_ports {ddr3_we_n}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_we_n}]

# set_property PACKAGE_PIN F21 [get_ports {ddr3_reset_n}]
# set_property SLEW FAST [get_ports {ddr3_reset_n}]
# set_property IOSTANDARD LVCMOS15 [get_ports {ddr3_reset_n}]

# set_property PACKAGE_PIN G18 [get_ports {ddr3_cke[0]}]
# set_property SLEW FAST [get_ports {ddr3_cke[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[*]}]

# set_property PACKAGE_PIN H20 [get_ports {ddr3_odt[0]}]
# set_property SLEW FAST [get_ports {ddr3_odt[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[*]}]

# set_property PACKAGE_PIN L19 [get_ports {ddr3_dm[0]}]
# set_property PACKAGE_PIN L15 [get_ports {ddr3_dm[1]}]
# set_property PACKAGE_PIN D20 [get_ports {ddr3_dm[2]}]
# set_property PACKAGE_PIN B20 [get_ports {ddr3_dm[3]}]
# set_property SLEW FAST [get_ports {ddr3_dm[*]}]
# set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[*]}]

# set_property PACKAGE_PIN N22 [get_ports {ddr3_dqs_p[0]}]
# set_property PACKAGE_PIN M22 [get_ports {ddr3_dqs_n[0]}]
# set_property PACKAGE_PIN K17 [get_ports {ddr3_dqs_p[1]}]
# set_property PACKAGE_PIN J17 [get_ports {ddr3_dqs_n[1]}]
# set_property PACKAGE_PIN B21 [get_ports {ddr3_dqs_p[2]}]
# set_property PACKAGE_PIN A21 [get_ports {ddr3_dqs_n[2]}]
# set_property PACKAGE_PIN F18 [get_ports {ddr3_dqs_p[3]}]
# set_property PACKAGE_PIN E18 [get_ports {ddr3_dqs_n[3]}]
# set_property SLEW FAST [get_ports {ddr3_dqs*}]
# set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs*}]

# set_property PACKAGE_PIN J14 [get_ports {ddr3_ck_p[0]}]
# set_property PACKAGE_PIN H14 [get_ports {ddr3_ck_n[0]}]
# set_property SLEW FAST [get_ports {ddr3_ck*}]
# set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_*}]

set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports COL_SHIFT_REG_CLK]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports COL_SHIFT_REG_CLK]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC1_CLRb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC1_CLRb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC1_LDACb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC1_LDACb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC2_CLRb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC2_CLRb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC2_LDACb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC2_LDACb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC3_CLRb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC3_CLRb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC3_LDACb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC3_LDACb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC4_CLRb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC4_CLRb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC4_LDACb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC4_LDACb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC5_CLRb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC5_CLRb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports DAC5_LDACb]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports DAC5_LDACb]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports INPUT_DATA0]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports INPUT_DATA0]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports INPUT_DATA1]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports INPUT_DATA1]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports INPUT_DATA2]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports INPUT_DATA2]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports INPUT_DATA3]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports INPUT_DATA3]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.100 [get_ports ROW_SHIFT_REG_CLK]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.300 [get_ports ROW_SHIFT_REG_CLK]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -0.500 [get_ports okAA]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 2.000 [get_ports okAA]

create_clock -period 9.920 -name VIRTUAL_mmcm0_clk0 -waveform {0.000 4.960}
set_input_delay -clock [get_clocks VIRTUAL_mmcm0_clk0] -min -add_delay 2.000 [get_ports okAA]
set_input_delay -clock [get_clocks VIRTUAL_mmcm0_clk0] -max -add_delay 8.000 [get_ports okAA]

set_max_delay -from [get_ports okAA] -to [get_pins OK_IFAT6/inst/okHI/core0/core0/a0/c0/la64fa2d1faaafafc73d47ae32e7cfc88_reg/D] 12.500

create_clock -period 20.000 -name VIRTUAL_clk_out1_clk_wiz_0 -waveform {0.000 10.000}
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins OK_IFAT6/inst/okHI/mmcm0/CLKOUT0]] -group [get_clocks VIRTUAL_clk_out1_clk_wiz_0]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC1_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC1_SDI]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -3.500 [get_ports DAC1_SDI]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 7.500 [get_ports DAC1_SDI]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC1_SYNCb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC1_SYNCb]
set_max_delay -from [get_pins Data_Converter_Clocks/inst/mmcm_adv_inst/CLKOUT0] -to [get_ports DAC1_SYNCb] 16.000

set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[2]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[3]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[6]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[7]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[8]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[10]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[11]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[13]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[14]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[15]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[16]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[17]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[19]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[20]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[21]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[24]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[25]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[28]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[29]/C}] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]_replica/C}]] -to [get_ports DAC1_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[31]/C}] -to [get_ports DAC1_SDI] 20.000

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC2_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC2_SDI]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -3.500 [get_ports DAC2_SDI]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 7.500 [get_ports DAC2_SDI]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC2_SYNCb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC2_SYNCb]
set_max_delay -from [get_pins Data_Converter_Clocks/inst/mmcm_adv_inst/CLKOUT0] -to [get_ports DAC2_SYNCb] 16.000

set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]_replica/C}]] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[2]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[3]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]_replica/C}]] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[6]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[7]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[8]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[10]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[11]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[13]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[14]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[15]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[16]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[17]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[19]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[20]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[21]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[24]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[25]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[28]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[29]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]/C}] -to [get_ports DAC2_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[31]/C}] -to [get_ports DAC2_SDI] 20.000

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC3_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC3_SDI]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -3.500 [get_ports DAC3_SDI]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 7.500 [get_ports DAC3_SDI]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC3_SYNCb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC3_SYNCb]
set_max_delay -from [get_pins Data_Converter_Clocks/inst/mmcm_adv_inst/CLKOUT0] -to [get_ports DAC3_SYNCb] 16.000

set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]_replica/C}]] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[2]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[3]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[6]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[7]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[8]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[10]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[11]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[13]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[14]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[15]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[16]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[17]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[19]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[20]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[21]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]_replica/C}]] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[24]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[25]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[28]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[29]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]/C}] -to [get_ports DAC3_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[31]/C}] -to [get_ports DAC3_SDI] 20.000

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC4_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC4_SDI]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -3.500 [get_ports DAC4_SDI]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 7.500 [get_ports DAC4_SDI]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC4_SYNCb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC4_SYNCb]
set_max_delay -from [get_pins Data_Converter_Clocks/inst/mmcm_adv_inst/CLKOUT0] -to [get_ports DAC4_SYNCb] 16.000

set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]_replica/C}]] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[2]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[3]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[6]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[7]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[8]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[10]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[11]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[13]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[14]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[15]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[16]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[17]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[19]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[20]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[21]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]_replica/C}]] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]_replica/C}]] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[24]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[25]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [list [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]/C}] [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]_replica/C}]] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[28]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[29]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]/C}] -to [get_ports DAC4_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[31]/C}] -to [get_ports DAC4_SDI] 20.000

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC5_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC5_SDI]
set_output_delay -clock [get_clocks okUH0] -min -add_delay -3.500 [get_ports DAC5_SDI]
set_output_delay -clock [get_clocks okUH0] -max -add_delay 7.500 [get_ports DAC5_SDI]

set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay -3.500 [get_ports DAC5_SYNCb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 7.500 [get_ports DAC5_SYNCb]
set_max_delay -from [get_pins Data_Converter_Clocks/inst/mmcm_adv_inst/CLKOUT0] -to [get_ports DAC5_SYNCb] 16.000

set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[0]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[1]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[2]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[3]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[4]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[5]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[6]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[7]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[8]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[9]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[10]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[11]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[12]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[13]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[14]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[15]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[16]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[17]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[18]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[19]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[20]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[21]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[22]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[23]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[24]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[25]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[26]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[27]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[28]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[29]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[30]/C}] -to [get_ports DAC5_SDI] 20.000
set_max_delay -from [get_pins {OK_IFAT6/inst/wi01/ep_dataout_reg[31]/C}] -to [get_ports DAC5_SDI] 20.000

create_clock -period 10.000 -name VIRTUAL_clk_out2_clk_wiz_0 -waveform {0.000 5.000}
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -min -add_delay 2.000 [get_ports ADC_SDO]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -max -add_delay 8.000 [get_ports ADC_SDO]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -min -add_delay -3.500 [get_ports ADC_CSb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -max -add_delay 7.500 [get_ports ADC_CSb]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -min -add_delay -3.500 [get_ports ADC_SCLK]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -max -add_delay 7.500 [get_ports ADC_SCLK]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -min -add_delay -3.500 [get_ports ADC_SDI]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_wiz_0] -max -add_delay 7.500 [get_ports ADC_SDI]
