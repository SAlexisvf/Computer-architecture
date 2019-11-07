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

-- Assembly code to test the MIPS processor (check registers on simulation)
VARIABLE ROM_MEMORY : REG_BANK := ( 
	"00000000000000000100000000100000", -- add r8, r0, r0
	"10001100000000010000000000000000", -- lw r1, 0x0(r0) 
	"10001100000000100000000000000100", -- lw r2, 0x4(r0)
	"10001100000000110000000000001000", -- lw r3, 0x8(r0)
	"00000000010000010001100000100000", -- add r3, r2, r1
	"00000000010000010010000000100101", -- or r4, r2, r1
	"00000000010000010010100000100010", -- sub r5, r2, r1
	"00000000010000010011000000100100", -- and r6, r2, r1
	"00001000000000000000000000001010", -- j L1
	"00100001000010000000000000000001", -- L2: addi r8, r8, 0x01
	"00000000000010000011100000101010", -- L1: slt r7, r0, r8
	"00010000111010001111111111111101", -- beq r7, r8, L2
	"00111100000010010010000000000000", -- lui r9, 0x2000
	"00110101001010010000000000010100", -- ori r9, r9, 0x14
	"10101101001010000000000000000000", -- sw r8, 0x0(r9)
	"10001101001010100000000000000000", -- lw r10, 0x0(r9)
	"00000000000000000000000000001000", -- jr r0
OTHERS => (OTHERS => '0') 
);

begin
	dato <= ROM_MEMORY(to_integer(unsigned(direccion(6 downto 2))));
end process;

end Behavioral;

