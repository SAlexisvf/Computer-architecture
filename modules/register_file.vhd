library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.SLV.all;

entity register_file is
  port (
	  	clk : in std_logic;
		write_reg, read_reg_1, read_reg_2 : in std_logic_vector(4 downto 0);
        reg_write : in std_logic;
		write_data : in std_logic_vector(31 downto 0);
		read_data_1, read_data_2 : out std_logic_vector(31 downto 0)
	);
end register_file;

architecture Behavioral of register_file is
component decoder
  port (write_reg : in std_logic_vector(4 downto 0);
        reg_write : in std_logic;
		Enabler : out std_logic_vector(31 downto 0));
end component;

component mux_register_file is
  port (ReadReg : in std_logic_vector(4 downto 0);
        inRegs : in SLV_ARRAY;
		ReadData : out std_logic_vector(31 downto 0));
end component;

component reg is
  port (clk : in std_logic;
		write_data : in std_logic_vector(31 downto 0);
        Enabler : in std_logic_vector(31 downto 0);
		Registers : out SLV_ARRAY);
end component;

signal DECODER_ENABLERS : std_logic_vector(31 downto 0);
signal inTERNAL_REGISTERS : SLV_ARRAY;
begin
	REG_FILE_DECODER : decoder port map (write_reg, reg_write, DECODER_ENABLERS);
	REG_FILE_REGISTERS : reg port map (clk, write_data, DECODER_ENABLERS, inTERNAL_REGISTERS);
	REG_FILE_MUX_1 : mux_register_file port map (read_reg_1, inTERNAL_REGISTERS, read_data_1);
	REG_FILE_MUX_2 : mux_register_file port map (read_reg_2, inTERNAL_REGISTERS, read_data_2);
end Behavioral;
