
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

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
signal aux_result: std_logic_vector(31 DOWNTO 0);
begin
process(a, b, Ctrl)
begin 
	case Ctrl is
		when "000" => aux_result<= (a AND b); --And operation
		when "001" => aux_result<= (a OR b);  --Or operation
		when "010" => aux_result<= (a + b);	 --Add operator
		when "011" => aux_result<= (a);		 --equal
		when "100" => aux_result<= (b(15 downto 0)&"0000000000000000"); --Concatenate Operation
		when "101" => null;						--null
		when "110" => aux_result<= (a - b);	--subtraction operation
		when "111" => 
			if a < b then	--If (a<b), then equal to 1
				aux_result<= ("00000000000000000000000000000001");
			else				--else, equal to 0
				aux_result<= ("00000000000000000000000000000000");
			end if;
		when others => null;
	end case;
end process;
	
process(aux_result)
begin
	if (aux_result="00000000000000000000000000000000") then
		zero <= '1';
	else
		zero <= '0';
	end if;
	result <= aux_result;
end process;
end Behavioral;

