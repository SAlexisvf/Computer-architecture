-- Code your design here
library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

ENTITY adder IS
  port (a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        c : out std_logic_vector(31 downto 0));
end adder;

ARCHITECTURE adder_impl OF adder IS
begin
	c <= std_logic_vector(unsigned(a) + unsigned(b));
end adder_impl;