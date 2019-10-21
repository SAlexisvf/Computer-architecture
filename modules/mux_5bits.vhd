library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
	
entity mux5 is 
	Port (selector: in std_logic; -- selector line
	input_1: in STD_LOGIC_VECTOR (4 downto 0); -- input 1
	input_2: in STD_LOGIC_VECTOR (4 downto 0); -- input 2
	output: out STD_LOGIC_VECTOR (4 downto 0)); -- output
end mux5;

architecture mux5_impl of mux5 is
begin 
	PROCESS(selector, input_1, input_2)
	BEGIN
	if selector = '0' THEN
		output <= input_1;
	ELSE
		output <= input_2;
	END IF;
	END PROCESS;
end mux5_impl;

