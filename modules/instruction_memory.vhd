library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

entity instruction_memory is
	port(
		direccion : in std_logic_vector(31 downto 0);
		dato : out std_logic_vector(31 downto 0)
	);
end instruction_memory;

architecture Behavioral of instruction_memory is
begin

process(direccion)

SUBTYPE REGISTRO IS std_logic_vector(31 downto 0);
TYPE REG_BANK IS ARRAY(0 TO 31) OF REGISTRO; 

VARIABLE ROM_MEMORY : REG_BANK := ( 
	x"0001_0004",
	x"0002_0003",
	x"0003_0002",
	x"0004_0001",
	x"1111_1111",
OTHERS => (OTHERS => '0') 
);

begin
	dato <= ROM_MEMORY(to_integer(unsigned(direccion(6 downto 2))));
end process;

end Behavioral;

