library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

entity data_memory is
	port(
		read_enable: in std_logic;
		write_enable: in std_logic;
		enable: in std_logic;
		CLK: in std_logic;
		address: in std_logic_vector(31 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data: out std_logic_vector(31 downto 0)
	);
end data_memory;

architecture Behavioral of data_memory is

begin

process(CLK, read_enable, address)

SUBTYPE REGISTRO IS std_logic_vector(31 downto 0);
TYPE REG_BANK IS ARRAY(0 TO 31) OF REGISTRO; 

VARIABLE RAM_MEMORY : REG_BANK := ( 
	x"0000_0004",
	x"0000_0003",
	x"0000_0002",
	x"0000_0001",
OTHERS => (OTHERS => '0') 
);

begin
	if (falling_edge(clk)) THEN
		if write_enable = '1' then 
			RAM_MEMORY(TO_inTEGER(unsigned(address(6 downto 2)))) := write_data;
			read_data <= (OTHERS => '0');
		end if;
	end if;

	if read_enable = '1' THEN
		read_data <= RAM_MEMORY(TO_inTEGER(unsigned(address(6 downto 2))));
	end if;
end process;
end Behavioral;

