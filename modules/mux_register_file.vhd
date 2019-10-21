LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.SLV.ALL;

entity mux_register_file is
  PORT (ReadReg : IN std_logic_vector(4 DOWNTO 0);
        InRegs : IN SLV_ARRAY;
		  ReadData : OUT std_logic_vector(31 DOWNTO 0));
end mux_register_file;

architecture Behavioral of mux_register_file is
begin
process (ReadReg, InRegs)
begin
	ReadData <= InRegs(TO_INTEGER(UNSIGNED(ReadReg)));
end process;
end Behavioral;

