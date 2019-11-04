library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity control_unit is
	port (
		opcode: in std_logic_vector(5 downto 0);
		reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
		alu_op: out std_logic_vector(2 downto 0)
	);
end control_unit;

architecture Behavioral of control_unit is
	signal aux: std_logic_vector (10 downto 0) := (others => '0');
	begin
		with opCode select 
			aux	<=	"10000001001" when "000000", -- R format, jr
					"01000000000" when "000010", -- jump
					"00100000010" when "000100", -- beq
					"00000011000" when "001000", -- addi
					"00000011011" when "001101", -- ori
					"00000011100" when "001111", -- lui
					"00011011000" when "100011", -- lw
					"00000110000" when "101011", -- sw
					"00000000000" when others ;
			reg_dest <= aux(10);
			jump <= aux(9);
			Branch <= aux(8);
			mem_read <= aux(7);
			mem_to_reg <= aux(6);
			mem_write <= aux(5);
			alu_src <= aux(4);
			reg_write <= aux(3);
			alu_op <= aux(2 downto 0);
end Behavioral;

