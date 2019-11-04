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
begin

--	signals			  				add								sub								and								or								slt								lw								sw								beq								j								addi							ori								jr
	reg_dest 	<= '1' 	when opcode = "100000" else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	jump		<=	'0' when opcode = "100000" else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '1' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '1' when opcode = "001000" else '0';
	branch 		<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '1' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	mem_read 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '1' when opcode = "001000" else '0';
	mem_to_reg 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	mem_write 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '1' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	alu_src 		<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '1' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';
	reg_write 	<=	'1' when opcode = "100000"	else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';
	-- aqui abajo nomas hice copy paste, pero alu_op debe ser de 3 bits
	alu_op 		<= '1' 	when opcode = "100000"	else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';

end Behavioral;

