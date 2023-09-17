-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Dec 23 18:02:33 2022
-- Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/frontpanel_ifat6/frontpanel_ifat6_stub.vhdl
-- Design      : frontpanel_ifat6
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frontpanel_ifat6 is
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
    wi0d_ep_dataout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wo20_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo21_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo22_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo23_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo24_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wo25_ep_datain : in STD_LOGIC_VECTOR ( 31 downto 0 );
    okUH : in STD_LOGIC_VECTOR ( 4 downto 0 );
    okHU : out STD_LOGIC_VECTOR ( 2 downto 0 );
    okUHU : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    okAA : inout STD_LOGIC;
    okClk : out STD_LOGIC
  );

end frontpanel_ifat6;

architecture stub of frontpanel_ifat6 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "wi00_ep_dataout[31:0],wi01_ep_dataout[31:0],wi02_ep_dataout[31:0],wi03_ep_dataout[31:0],wi04_ep_dataout[31:0],wi05_ep_dataout[31:0],wi06_ep_dataout[31:0],wi07_ep_dataout[31:0],wi08_ep_dataout[31:0],wi09_ep_dataout[31:0],wi0a_ep_dataout[31:0],wi0b_ep_dataout[31:0],wi0c_ep_dataout[31:0],wi0d_ep_dataout[31:0],wo20_ep_datain[31:0],wo21_ep_datain[31:0],wo22_ep_datain[31:0],wo23_ep_datain[31:0],wo24_ep_datain[31:0],wo25_ep_datain[31:0],okUH[4:0],okHU[2:0],okUHU[31:0],okAA,okClk";
begin
end;
