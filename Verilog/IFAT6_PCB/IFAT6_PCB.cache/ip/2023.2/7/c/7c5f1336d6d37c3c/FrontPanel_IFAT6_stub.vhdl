-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Apr 30 17:25:23 2024
-- Host        : Soumil-Surface running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ FrontPanel_IFAT6_stub.vhdl
-- Design      : FrontPanel_IFAT6
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    wi00_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi01_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi02_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi03_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi04_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi05_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi06_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi07_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi08_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi09_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi0a_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi0b_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wi0c_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wo20_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo21_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ti40_ep_trigger : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ti40_ep_clk : in STD_LOGIC;
    okUH : in STD_LOGIC_VECTOR ( 4 downto 0 );
    okHU : out STD_LOGIC_VECTOR ( 2 downto 0 );
    okUHU : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    okAA : inout STD_LOGIC;
    okClk : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "wi00_ep_dataout[31:0],wi01_ep_dataout[31:0],wi02_ep_dataout[31:0],wi03_ep_dataout[31:0],wi04_ep_dataout[31:0],wi05_ep_dataout[31:0],wi06_ep_dataout[31:0],wi07_ep_dataout[31:0],wi08_ep_dataout[31:0],wi09_ep_dataout[31:0],wi0a_ep_dataout[31:0],wi0b_ep_dataout[31:0],wi0c_ep_dataout[31:0],wo20_ep_datain[31:0],wo21_ep_datain[31:0],ti40_ep_trigger[31:0],ti40_ep_clk,okUH[4:0],okHU[2:0],okUHU[31:0],okAA,okClk";
begin
end;
