library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity decoder is
  port (WriteReg : in std_logic_vector(4 downto 0);
        RegWrite : in std_logic;
		  Enabler : out std_logic_vector(31 downto 0));
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
