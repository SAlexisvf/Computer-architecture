library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity alu_control is
	port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(2 downto 0);
		alu_ctrl: out std_logic_vector(2 downto 0);
		JR: out std_logic
	);
end alu_control;

architecture Behavioral of alu_control is
begin

	alu_ctrl <= "010" when (alu_op ="000") or (alu_op="001" and funct="100000")
	else "101" when (alu_op ="001" and funct = "000000")
	else "110" when (alu_op ="001" and funct ="100010") or (alu_op = "010")
	else "000" when alu_op ="001" and funct ="100100"
	else "001" when (alu_op="001" and funct="100101") or (alu_op ="011")
	else "111" when alu_op="001" and funct ="101010"
	else "000" when alu_op="001" and funct ="001000"
	else "100" when alu_op ="100";
	
	JR <= '1' when (alu_op = "001" and funct="001000")
	else '0';

end Behavioral;
