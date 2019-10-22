library ieee;
use ieee.STD_LOGIC_1164.all;

entity mux32 is 
	port (
		selector: in std_logic; -- selector line
		input_1: in std_logic_vector (31 downto 0); -- input 1
		input_2: in std_logic_vector (31 downto 0); -- input 2
		output: out std_logic_vector (31 downto 0) 	-- output
	);
end mux32;

architecture mux32_impl of mux32 is
begin 
	process(selector, input_1, input_2)
	begin
	if selector = '0' THEN
		output <= input_1;
	else
		output <= input_2;
	end if;
	end process;
end mux32_impl;


