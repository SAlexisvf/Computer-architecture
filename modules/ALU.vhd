
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port (
		a : in std_logic_vector(31 downto 0);
      b : in std_logic_vector(31 downto 0);
		cntrl : in std_logic_vector(2 downto 0);
		zero : out std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end alu;

architecture Behavioral of alu is
signal result_temp: std_logic_vector(31 downto 0);

begin

	result_temp <= a and b when cntrl="000"
						else a or b when cntrl = "001"
						else std_logic_vector(unsigned(a) + unsigned(b)) when cntrl = "010"
						else a when cntrl = "011"
						else b(15 downto 0)& x"0000" when cntrl = "100"
						else std_logic_vector(unsigned(a) - unsigned(b)) when cntrl = "110"
						else x"00000001" when a < b and cntrl = "111"
						else x"00000000" when a >= b and cntrl = "111";
						
	zero <= '1' when result_temp = x"00000000"
	else '0';
	
	result<=result_temp;

end Behavioral;

