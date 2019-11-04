library ieee;
use ieee.std_logic_1164.all;

entity mux_32bits is 
	port (
		selector: in std_logic; -- selector line
		input_1: in std_logic_vector (31 downto 0); -- input 1
		input_2: in std_logic_vector (31 downto 0); -- input 2
		output: out std_logic_vector (31 downto 0) 	-- output
	);
end mux_32bits;

architecture Behavioral of mux_32bits is
begin 
	output <= input_1 when (selector = '0') else input_2;
end Behavioral;


