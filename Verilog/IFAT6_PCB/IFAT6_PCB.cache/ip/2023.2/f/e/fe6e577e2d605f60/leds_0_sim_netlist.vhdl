-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Apr 30 17:31:33 2024
-- Host        : Soumil-Surface running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ leds_0_sim_netlist.vhdl
-- Design      : leds_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led is
  port (
    led_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_out_tristate : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led is
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
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    led_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    led_out_tristate : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of led_out_tristate : signal is "opalkelly.com:interface:led_tristate:1.0 led_out_tristate LED_OUT_TRISTATE";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led
     port map (
      led_in(7 downto 0) => led_in(7 downto 0),
      led_out_tristate(7 downto 0) => led_out_tristate(7 downto 0)
    );
end STRUCTURE;
