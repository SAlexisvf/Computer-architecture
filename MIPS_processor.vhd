library ieee;
use ieee.std_logic_1164.all;

entity MIPS_processor is
    port (
        clk : in std_logic;
        reset : in std_logic
    );
end MIPS_processor;

architecture Behavioral of MIPS_processor is

component adder
    port (
        a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        c : out std_logic_vector(31 downto 0)
    );
end component;

component ALU
    port (
        a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        cntrl : in std_logic_vector(2 downto 0);
        zero : out std_logic;
        result : buffer std_logic_vector(31 downto 0)
    );
end component;

component data_memory
    port (
        read_enable: in std_logic;
		write_enable: in std_logic;
		enable: in std_logic;
		CLK: in std_logic;
		address: in std_logic_vector(31 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data: out std_logic_vector(31 downto 0)
    );
end component;

component instruction_memory
    port (
        direccion : in std_logic_vector(31 downto 0);
		dato : out std_logic_vector(31 downto 0)
    );
end component;

component mux_5bits
    port (
		selector: in std_logic; -- selector line
		input_1: in std_logic_vector (4 downto 0); -- input 1
		input_2: in std_logic_vector (4 downto 0); -- input 2
		output: out std_logic_vector (4 downto 0)  -- output
    );
end component;

component mux_32bits
    port (
        selector: in std_logic; -- selector line
		input_1: in std_logic_vector (31 downto 0); -- input 1
		input_2: in std_logic_vector (31 downto 0); -- input 2
		output: out std_logic_vector (31 downto 0) 	-- output
    );
end component;

component register_file is
    port (
        clk : in std_logic;
		WriteReg, ReadReg1, ReadReg2 : in std_logic_vector(4 downto 0);
        RegWrite : in std_logic;
		WriteData : in std_logic_vector(31 downto 0);
		ReadReg1output, ReadReg2output : out std_logic_vector(31 downto 0)
    );
end component;

component control_unit is
    port (
		opcode: in std_logic_vector(5 downto 0);
		regDest, jump, branch, memRead, memToReg, memWrite, ALUsrc, regWrite: out std_logic;
		ALUop: out std_logic_vector(2 downto 0)
    );
end component;

component ALU_control is
    port (
        funct: in std_logic_vector(5 downto 0);
		ALUop: in std_logic_vector(2 downto 0);
		ALUctrl: out std_logic_vector(2 downto 0);
		JR: out std_logic
    );
end component;

-- falta component y modulo de shiftleft y signextender

begin


end Behavioral;

