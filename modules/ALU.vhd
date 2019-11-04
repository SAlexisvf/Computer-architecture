
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
	case cntrl is
		when "000" =>
		-- AND
			result_temp <= a and b;
		when "001" =>
		-- OR
			result_temp <= b or b;
		when "010" =>
		-- ADD
			result_temp <= std_logic_vector(unsigned(a) + unsigned(b));
		when "011" =>
		-- MOV
			result_temp <= a;
		when "100" =>
		-- B UPPER
			result_temp <= b(15 downto 0) & x"0000";
		when "110" => null;
		-- SUBSTRACT
			result_temp <= std_logic_vector(unsigned(a) - unsigned(b));
		when "111" => null;
		-- SET LESS THAN
			if a < b then
				result_temp <= x"00000001";
			else
				result_temp <= x"00000000";
			end if;
		when others => null;
	end case;
	if result_temp = x"00000000" then
		zero <= '1';
	else
		zero <= '0';
	end if;

	result <= result_temp;

end Behavioral;

