library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
use work.SLV.all;

entity register_file is
  port (
	  	clk : in std_logic;
		WriteReg, ReadReg1, ReadReg2 : in std_logic_vector(4 downto 0);
        RegWrite : in std_logic;
		WriteData : in std_logic_vector(31 downto 0);
		ReadReg1output, ReadReg2output : out std_logic_vector(31 downto 0)
	);
end register_file;

architecture Behavioral of register_file is
component decoder
  port (WriteReg : in std_logic_vector(4 downto 0);
        RegWrite : in std_logic;
		Enabler : out std_logic_vector(31 downto 0));
end component;

component mux_register_file is
  port (ReadReg : in std_logic_vector(4 downto 0);
        inRegs : in SLV_ARRAY;
		ReadData : out std_logic_vector(31 downto 0));
end component;

component reg is
  port (clk : in std_logic;
		WriteData : in std_logic_vector(31 downto 0);
        Enabler : in std_logic_vector(31 downto 0);
		Registers : out SLV_ARRAY);
end component;

signal DECODER_ENABLERS : std_logic_vector(31 downto 0);
signal inTERNAL_REGISTERS : SLV_ARRAY;
begin
	REG_FILE_DECODER : decoder port map (WriteReg, RegWrite, DECODER_ENABLERS);
	REG_FILE_REGISTERS : reg port map (clk, WriteData, DECODER_ENABLERS, inTERNAL_REGISTERS);
	REG_FILE_MUX_1 : mux_register_file port map (ReadReg1, inTERNAL_REGISTERS, ReadReg1output);
	REG_FILE_MUX_2 : mux_register_file port map (ReadReg2, inTERNAL_REGISTERS, ReadReg2output);
end Behavioral;
