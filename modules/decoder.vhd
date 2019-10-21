library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder is
  PORT (WriteReg : IN std_logic_vector(4 DOWNTO 0);
        RegWrite : IN std_logic;
		  Enabler : OUT std_logic_vector(31 DOWNTO 0));
end decoder;

architecture Behavioral of decoder is
begin
process(WriteReg, RegWrite)
begin
	Enabler <= (others => '0');
	if (RegWrite = '1') then
		Enabler(to_integer(unsigned(WriteReg))) <= '1';
	end if;
end process;
end Behavioral;
