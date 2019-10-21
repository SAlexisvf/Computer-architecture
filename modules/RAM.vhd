library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

entity RAM is
	PORT(
		read_enable: in std_logic;
		write_enable: in std_logic;
		enable: in std_logic;
		CLK: in std_logic;
		address: in std_logic_vector(31 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data: out std_logic_vector(31 downto 0));
end RAM;

architecture Behavioral of RAM is

begin

PROCESS(CLK)

SUBTYPE REGISTRO IS std_logic_vector(31 downto 0);
TYPE REG_BANK IS ARRAY(0 TO 31) OF REGISTRO; 

VARIABLE RAM_MEMORY : REG_BANK := ( 
	x"0001_0004",
	x"0002_0003",
	x"0003_0002",
	x"0004_0001",
	x"1111_1111",
OTHERS => (OTHERS => '0') 
);

begin
if CLK'event AND CLK = '0' THEN
	if enable = '0' then
		if read_enable = '1' THEN
			read_data <= RAM_MEMORY(TO_inTEGER(UNSIGNED(address(6 downto 2))));
		elsif write_enable = '1' then 
			RAM_MEMORY(TO_inTEGER(UNSIGNED(address(6 downto 2)))) := write_data;
			read_data <= (OTHERS => '0');
		end if;
	end if;
end if;
end process;
end Behavioral;

