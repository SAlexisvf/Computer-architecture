
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity alu is
  PORT (a : IN std_logic_vector(31 DOWNTO 0);
        b : IN std_logic_vector(31 DOWNTO 0);
		  cntrl : IN std_logic_vector(2 DOWNTO 0);
		  zero : OUT std_logic;
        result : BUFFER std_logic_vector(31 DOWNTO 0));
end alu;
--- usar result temporal en vez del buffer pq luego no va  ajalar en el spartan puto
architecture Behavioral of alu is
begin
process(a, b, cntrl, result)
begin
	case cntrl is
		when "000" =>
		-- AND
			result <= A and b;
		when "001" =>
		-- OR
			result <= A or b;
		when "010" =>
		-- ADD
			result <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
		when "011" =>
		-- MOV
			result <= a;
		when "100" =>
		-- B UPPER
			result <= b(15 DOWNTO 0) & x"0000";
		when "110" => null;
		-- SUBSTRACT
			result <= std_logic_vector(UNSIGNED(a) - UNSIGNED(b));
		when "111" => null;
		-- SET LESS THAN
			if a < b then
				result <= x"00000001";
			else
				result <= x"00000000";
			end if;
		when others => null;
	end case;
	if result = x"00000000" then
		zero <= '1';
	else
		zero <= '0';
	end if;
end process;
end Behavioral;

