library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32 is 
	Port (selector: in std_logic; -- selector line
	input_1: in STD_LOGIC_VECTOR (31 downto 0); -- input 1
	input_2: in STD_LOGIC_VECTOR (31 downto 0); -- input 2
	output: out STD_LOGIC_VECTOR (31 downto 0)); -- output
end mux32;

architecture mux32_impl of mux32 is
begin 
	PROCESS(selector, input_1, input_2)
	BEGIN
	if selector = '0' THEN
		output <= input_1;
	ELSE
		output <= input_2;
	END IF;
	END PROCESS;
end mux32_impl;


