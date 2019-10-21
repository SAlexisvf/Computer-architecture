LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.SLV.all;

entity mux_register_file is
  port (ReadReg : in std_logic_vector(4 downto 0);
        inRegs : in SLV_ARRAY;
		  ReadData : out std_logic_vector(31 downto 0));
end mux_register_file;

architecture Behavioral of mux_register_file is
begin
process (ReadReg, inRegs)
begin
	ReadData <= inRegs(TO_inTEGER(unsigned(ReadReg)));
end process;
end Behavioral;

