library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity control_unit is
	port (
		opcode: in std_logic_vector(5 downto 0);
		regDest, jump, branch, memRead, memToReg, memWrite, ALUsrc, regWrite: out std_logic;
		ALUop: out std_logic_vector(2 downto 0)
	);
end control_unit;

architecture Behavioral of control_unit is
begin

--	signals			  		add										sub									and										or											slt									lw											sw										beq										j											addi										ori										jr
	regDest 	<= '1' when opcode = "100000" else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	jump		<=	'0' when opcode = "100000" else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '1' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '1' when opcode = "001000" else '0';
	branch 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '0' when opcode = "101011" else '1' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	memRead 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '1' when opcode = "001000" else '0';
	memToReg <=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	memWrite <=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '0' when opcode = "100011" else '1' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '0' when opcode = "001000" else '0' when opcode = "001101" else '0' when opcode = "001000" else '0';
	ALUsrc 	<=	'0' when opcode = "100000"	else '0' when opcode = "100010" else '0' when opcode = "100100" else '0' when opcode = "100101" else '0' when opcode = "101010" else '1' when opcode = "100011" else '1' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';
	regWrite <=	'1' when opcode = "100000"	else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';
	-- aqui abajo nomas hice copy paste, pero ALUop debe ser de 3 bits
	ALUop 	<= '1' when opcode = "100000"	else '1' when opcode = "100010" else '1' when opcode = "100100" else '1' when opcode = "100101" else '1' when opcode = "101010" else '1' when opcode = "100011" else '0' when opcode = "101011" else '0' when opcode = "000100" else '0' when opcode = "000010" else '1' when opcode = "001000" else '1' when opcode = "001101" else '0' when opcode = "001000" else '0';

end Behavioral;

