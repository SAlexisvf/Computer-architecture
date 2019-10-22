library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ALU_control is
	port (
		funct: in std_logic_vector(5 downto 0);
		ALUop: in std_logic_vector(2 downto 0);
		ALUctrl: out std_logic_vector(2 downto 0);
		JR: out std_logic
	);
end ALU_control;

architecture Behavioral of ALU_control is

signal iOp: std_logic_vector(2 downto 0) := "000";
signal rOp: std_logic_vector(2 downto 0) := "001";
	
begin

ALUctrl <= "010" when (ALUop = "000") else null;
ALUctrl <= "101" when (ALUop = "001" and funct = "000000") else null;
ALUctrl <= "010" when (ALUop = "001" and funct = "100000") else null;
ALUctrl <= "110" when (ALUop = "001" and funct = "100010") else null;
ALUctrl <= "000" when (ALUop = "001" and funct = "100100") else null;
ALUctrl <= "001" when (ALUop = "001" and funct = "100101") else null;
ALUctrl <= "111" when (ALUop = "001" and funct = "101010") else null;
JR <= '1' when (ALUop = "001" and funct = "001000") else null;
ALUctrl <= "110" when (ALUop = "010") else null;
ALUctrl <= "001" when (ALUop = "011") else null;
ALUctrl <= "100" when (ALUop = "100") else null;

end Behavioral;
