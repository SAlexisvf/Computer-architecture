library ieee;
use ieee.STD_LOGIC_1164.all;
	
entity mux5 is 
	port (selector: in std_logic; -- selector line
	input_1: in std_logic_vector (4 downto 0); -- input 1
	input_2: in std_logic_vector (4 downto 0); -- input 2
	output: out std_logic_vector (4 downto 0)); -- output
end mux5;

architecture mux5_impl of mux5 is
begin 
	process(selector, input_1, input_2)
	begin
	if selector = '0' THEN
		output <= input_1;
	else
		output <= input_2;
	end if;
	end process;
end mux5_impl;

