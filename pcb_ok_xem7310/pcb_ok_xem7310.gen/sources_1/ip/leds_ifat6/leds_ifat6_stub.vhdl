-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Mon Oct  3 21:32:11 2022
-- Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/leds_ifat6/leds_ifat6_stub.vhdl
-- Design      : leds_ifat6
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity leds_ifat6 is
  Port ( 
    led_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_out_tristate : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end leds_ifat6;

architecture stub of leds_ifat6 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "led_in[7:0],led_out_tristate[7:0]";
begin
end;
