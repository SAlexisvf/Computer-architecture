library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.SLV.ALL;

entity register_file is
  PORT (clk : IN std_logic;
		  WriteReg, ReadReg1, ReadReg2 : IN std_logic_vector(4 DOWNTO 0);
        RegWrite : IN std_logic;
		  WriteData : IN std_logic_vector(31 DOWNTO 0);
		  ReadReg1Output, ReadReg2Output : OUT std_logic_vector(31 DOWNTO 0));
end register_file;

architecture Behavioral of register_file is
component decoder
  PORT (WriteReg : IN std_logic_vector(4 DOWNTO 0);
        RegWrite : IN std_logic;
		  Enabler : OUT std_logic_vector(31 DOWNTO 0));
end component;

component mux_register_file is
  PORT (ReadReg : IN std_logic_vector(4 DOWNTO 0);
        InRegs : IN SLV_ARRAY;
		  ReadData : OUT std_logic_vector(31 DOWNTO 0));
end component;

component reg is
  PORT (clk : IN std_logic;
		  WriteData : IN std_logic_vector(31 DOWNTO 0);
        Enabler : IN std_logic_vector(31 DOWNTO 0);
		  Registers : OUT SLV_ARRAY);
end component;

signal DECODER_ENABLERS : std_logic_vector(31 downto 0);
signal INTERNAL_REGISTERS : SLV_ARRAY;
begin
	REG_FILE_DECODER : decoder PORT MAP (WriteReg, RegWrite, DECODER_ENABLERS);
	REG_FILE_REGISTERS : reg PORT MAP (clk, WriteData, DECODER_ENABLERS, INTERNAL_REGISTERS);
	REG_FILE_MUX_1 : mux_register_file PORT MAP (ReadReg1, INTERNAL_REGISTERS, ReadReg1Output);
	REG_FILE_MUX_2 : mux_register_file PORT MAP (ReadReg2, INTERNAL_REGISTERS, ReadReg2Output);
end Behavioral;
