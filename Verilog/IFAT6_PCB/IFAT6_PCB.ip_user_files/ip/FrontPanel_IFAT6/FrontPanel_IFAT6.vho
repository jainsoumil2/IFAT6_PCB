-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: opalkelly.com:ip:frontpanel:1.0
-- IP Revision: 5

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT FrontPanel_IFAT6
  PORT (
    okUH : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    okHU : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    okUHU : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    okAA : INOUT STD_LOGIC;
    okClk : OUT STD_LOGIC;
    wi00_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi01_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi02_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi03_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi04_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi05_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi06_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi07_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi08_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi09_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi0a_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi0b_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wi0c_ep_dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wo20_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wo21_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wo22_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wo23_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wo24_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ti40_ep_trigger : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ti40_ep_clk : IN STD_LOGIC;
    ti41_ep_trigger : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ti41_ep_clk : IN STD_LOGIC;
    ti42_ep_trigger : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ti42_ep_clk : IN STD_LOGIC;
    poa0_ep_datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    poa0_ep_read : OUT STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : FrontPanel_IFAT6
  PORT MAP (
    okUH => okUH,
    okHU => okHU,
    okUHU => okUHU,
    okAA => okAA,
    okClk => okClk,
    wi00_ep_dataout => wi00_ep_dataout,
    wi01_ep_dataout => wi01_ep_dataout,
    wi02_ep_dataout => wi02_ep_dataout,
    wi03_ep_dataout => wi03_ep_dataout,
    wi04_ep_dataout => wi04_ep_dataout,
    wi05_ep_dataout => wi05_ep_dataout,
    wi06_ep_dataout => wi06_ep_dataout,
    wi07_ep_dataout => wi07_ep_dataout,
    wi08_ep_dataout => wi08_ep_dataout,
    wi09_ep_dataout => wi09_ep_dataout,
    wi0a_ep_dataout => wi0a_ep_dataout,
    wi0b_ep_dataout => wi0b_ep_dataout,
    wi0c_ep_dataout => wi0c_ep_dataout,
    wo20_ep_datain => wo20_ep_datain,
    wo21_ep_datain => wo21_ep_datain,
    wo22_ep_datain => wo22_ep_datain,
    wo23_ep_datain => wo23_ep_datain,
    wo24_ep_datain => wo24_ep_datain,
    ti40_ep_trigger => ti40_ep_trigger,
    ti40_ep_clk => ti40_ep_clk,
    ti41_ep_trigger => ti41_ep_trigger,
    ti41_ep_clk => ti41_ep_clk,
    ti42_ep_trigger => ti42_ep_trigger,
    ti42_ep_clk => ti42_ep_clk,
    poa0_ep_datain => poa0_ep_datain,
    poa0_ep_read => poa0_ep_read
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file FrontPanel_IFAT6.vhd when simulating
-- the core, FrontPanel_IFAT6. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



