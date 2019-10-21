-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY adder IS
  PORT (a : IN std_logic_vector(31 DOWNTO 0);
        b : IN std_logic_vector(31 DOWNTO 0);
        c : OUT std_logic_vector(31 DOWNTO 0));
END adder;

ARCHITECTURE adder_impl OF adder IS
BEGIN
	c <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
END adder_impl;