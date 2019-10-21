library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.ALL;

entity RAM is
	PORT(
		READ_ENABLE: IN std_logic;
		WRITE_ENABLE: IN std_logic;
		ENABLE: IN std_logic;
		CLK: IN std_logic;
		ADDRESS: IN std_logic_vector(31 DOWNTO 0);
		WRITE_DATA: IN std_logic_vector(31 DOWNTO 0);
		READ_DATA: OUT std_logic_vector(31 DOWNTO 0));
end RAM;

architecture Behavioral of RAM is

begin

PROCESS(CLK)


	x"0001_0004",
	x"1111_1111",

begin
if CLK'event AND CLK = '0' THEN
	if ENABLE = '0' then
		if READ_ENABLE = '1' THEN
			READ_DATA <= RAM_MEMORY(TO_INTEGER(UNSIGNED(ADDRESS(6 DOWNTO 2))));
		elsif WRITE_ENABLE = '1' then 
			RAM_MEMORY(TO_INTEGER(UNSIGNED(ADDRESS(6 DOWNTO 2)))) := WRITE_DATA;
			READ_DATA <= (OTHERS => '0');
		end if;
	end if;
end if;
end process;
end Behavioral;
