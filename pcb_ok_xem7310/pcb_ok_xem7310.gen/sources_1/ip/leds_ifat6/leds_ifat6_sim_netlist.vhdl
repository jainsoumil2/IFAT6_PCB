-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Mon Oct  3 21:32:12 2022
-- Host        : moderna.ucsd.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /Volumes/export/isn/soumil/Xilinx/ifat6/pcb_ok_xem7310/pcb_ok_xem7310.gen/sources_1/ip/leds_ifat6/leds_ifat6_sim_netlist.vhdl
-- Design      : leds_ifat6
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity leds_ifat6_led is
  port (
    led_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_out_tristate : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of leds_ifat6_led : entity is "led";
end leds_ifat6_led;

architecture STRUCTURE of leds_ifat6_led is
  signal T0 : STD_LOGIC;
  signal \genblk1[0].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[1].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[2].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[3].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[4].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[5].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \genblk1[6].IOBUF_i_i_1_n_0\ : STD_LOGIC;
  signal \NLW_genblk1[0].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[1].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[2].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[3].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[4].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[5].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[6].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk1[7].IOBUF_i_O_UNCONNECTED\ : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \genblk1[0].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[1].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[2].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[3].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[4].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[5].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[6].IOBUF_i\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \genblk1[7].IOBUF_i\ : label is "PRIMITIVE";
begin
\genblk1[0].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(0),
      O => \NLW_genblk1[0].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[0].IOBUF_i_i_1_n_0\
    );
\genblk1[0].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(0),
      O => \genblk1[0].IOBUF_i_i_1_n_0\
    );
\genblk1[1].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(1),
      O => \NLW_genblk1[1].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[1].IOBUF_i_i_1_n_0\
    );
\genblk1[1].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(1),
      O => \genblk1[1].IOBUF_i_i_1_n_0\
    );
\genblk1[2].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(2),
      O => \NLW_genblk1[2].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[2].IOBUF_i_i_1_n_0\
    );
\genblk1[2].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(2),
      O => \genblk1[2].IOBUF_i_i_1_n_0\
    );
\genblk1[3].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(3),
      O => \NLW_genblk1[3].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[3].IOBUF_i_i_1_n_0\
    );
\genblk1[3].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(3),
      O => \genblk1[3].IOBUF_i_i_1_n_0\
    );
\genblk1[4].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(4),
      O => \NLW_genblk1[4].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[4].IOBUF_i_i_1_n_0\
    );
\genblk1[4].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(4),
      O => \genblk1[4].IOBUF_i_i_1_n_0\
    );
\genblk1[5].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(5),
      O => \NLW_genblk1[5].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[5].IOBUF_i_i_1_n_0\
    );
\genblk1[5].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(5),
      O => \genblk1[5].IOBUF_i_i_1_n_0\
    );
\genblk1[6].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(6),
      O => \NLW_genblk1[6].IOBUF_i_O_UNCONNECTED\,
      T => \genblk1[6].IOBUF_i_i_1_n_0\
    );
\genblk1[6].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(6),
      O => \genblk1[6].IOBUF_i_i_1_n_0\
    );
\genblk1[7].IOBUF_i\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => led_out_tristate(7),
      O => \NLW_genblk1[7].IOBUF_i_O_UNCONNECTED\,
      T => T0
    );
\genblk1[7].IOBUF_i_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => led_in(7),
      O => T0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity leds_ifat6 is
  port (
    led_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_out_tristate : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of leds_ifat6 : entity is true;
end leds_ifat6;

architecture STRUCTURE of leds_ifat6 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of led_out_tristate : signal is "opalkelly.com:interface:led_tristate:1.0 led_out_tristate LED_OUT_TRISTATE";
begin
inst: entity work.leds_ifat6_led
     port map (
      led_in(7 downto 0) => led_in(7 downto 0),
      led_out_tristate(7 downto 0) => led_out_tristate(7 downto 0)
    );
end STRUCTURE;
