-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Sep 12 15:26:50 2024
-- Host        : b670 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/asus/Documents/cva6/corev_apu/fpga/xilinx/xlnx_clk_gen/xlnx_clk_gen.srcs/sources_1/ip/xlnx_clk_gen/xlnx_clk_gen_stub.vhdl
-- Design      : xlnx_clk_gen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xlnx_clk_gen is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end xlnx_clk_gen;

architecture stub of xlnx_clk_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,clk_out3,clk_out4,reset,locked,clk_in1";
begin
end;
