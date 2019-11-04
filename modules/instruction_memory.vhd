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
	"10001100000000010000000000000000",
	"00000000000000000000000000000000",
	"10001100000000100000000000000100",
	"00000000000000000000000000000000",
	"00000000001000100001100000100000",
	"00000000000000000000000000000000",
OTHERS => (OTHERS => '0') 
);

begin
	dato <= ROM_MEMORY(to_integer(unsigned(direccion(6 downto 2))));
end process;

end Behavioral;

