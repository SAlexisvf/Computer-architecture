library ieee;
use ieee.std_logic_1164.all;

entity MIPS_processor is
    port (
        clk : in std_logic;
        reset : in std_logic
    );
end MIPS_processor;

architecture Behavioral of MIPS_processor is
    
    component pc is
        port (
            d : in std_logic_vector (31 downto 0);
            q : out std_logic_vector (31 downto 0);
            reset : in std_logic;
            clk : in std_logic
        );
    end component;

    component adder is
        port (
            a : in std_logic_vector(31 downto 0);
            b : in std_logic_vector(31 downto 0);
            c : out std_logic_vector(31 downto 0)
        );
    end component;

    component alu is
        port (
            a : in std_logic_vector(31 downto 0);
            b : in std_logic_vector(31 downto 0);
            cntrl : in std_logic_vector(2 downto 0);
            zero : out std_logic;
            result : out std_logic_vector(31 downto 0)
        );
    end component;

    component data_memory is
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

    component instruction_memory is
        port (
            direccion : in std_logic_vector(31 downto 0);
            dato : out std_logic_vector(31 downto 0)
        );
    end component;

    component mux_5bits is
        port (
            selector: in std_logic; -- selector line
            input_1: in std_logic_vector (4 downto 0); -- input 1
            input_2: in std_logic_vector (4 downto 0); -- input 2
            output: out std_logic_vector (4 downto 0)  -- output
        );
    end component;

    component mux_32bits is
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
            write_reg, read_reg_1, read_reg_2 : in std_logic_vector(4 downto 0);
            reg_write : in std_logic;
            write_data : in std_logic_vector(31 downto 0);
            read_data_1, read_data_2 : out std_logic_vector(31 downto 0)
        );
    end component;

    component control_unit is
        port (
            opcode: in std_logic_vector(5 downto 0);
            reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
            alu_op: out std_logic_vector(2 downto 0)
        );
    end component;

    component alu_control is
        port (
            funct: in std_logic_vector(5 downto 0);
            alu_op: in std_logic_vector(2 downto 0);
            alu_ctrl: out std_logic_vector(2 downto 0);
            JR: out std_logic
        );
    end component;

    component shift_left_32bits is
        port ( 
            input : in  std_logic_vector (31 downto 0);
            output : out  std_logic_vector (31 downto 0)
        );
    end component;

    component shift_left_28bits is
        port (
            input : in  std_logic_vector (25 downto 0);
            output : out  std_logic_vector (27 downto 0)
        );
    end component;

    component sign_extender is
        port (
            num : in  std_logic_vector (15 downto 0);
            signed_num : out  std_logic_vector (31 downto 0)
        );
    end component;

    signal instruction_address: std_logic_vector(31 downto 0);
    signal next_address: std_logic_vector(31 downto 0);
    signal instruction: std_logic_vector(31 downto 0);
    signal read_data_1, read_data_2, write_data, next_pc, extended_immediate, shifted_immediate, add_pc_immediate: std_logic_vector(31 downto 0);
    signal mux_registers_out, alu_result, mux_add_1_res, mux_add_2_res, mem_read_data, jump_and_pc: std_logic_vector(31 downto 0);
    signal shifted_jump_address: std_logic_vector(27 downto 0);
    signal jump_address: std_logic_vector(25 downto 0);
    signal immediate: std_logic_vector(15 downto 0);
    signal opcode, funct: std_logic_vector(5 downto 0);
    signal rs, rt, rd, write_reg, mux_registers: std_logic_vector(4 downto 0);
    signal alu_ctrl: std_logic_vector(2 downto 0);
    signal reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, alu_zero, branch_and_alu_zero, JR: std_logic;
    signal alu_op: std_logic_vector(2 downto 0);

    begin

        opcode <= instruction(31 downto 26);
        rs <= instruction(25 downto 21);
        rt <= instruction(20 downto 16);
        rd <= instruction(15 downto 11);
        funct <= instruction(5 downto 0);
        immediate <= instruction(15 downto 0);
        jump_address <= instruction(25 downto 0);
        branch_and_alu_zero <= branch and alu_zero;
        jump_and_pc <= next_pc (31 downto 28) & shifted_jump_address;

        ProgramCounter: pc port map (next_address, instruction_address, reset, clk);
        InstructionMemory: instruction_memory port map (instruction_address, instruction);
        AddPC4: adder port map (instruction_address, "00000000000000000000000000000100", next_pc);
        Shift28: shift_left_28bits port map (jump_address, shifted_jump_address);
        ControlUnit: control_unit port map (opcode, reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, alu_op);
        MuxRegisters: mux_5bits port map (reg_dest, rt, rd, mux_registers);
        RegisterFile: register_file port map (clk, mux_registers, rs, rt, reg_write, write_data, read_data_1, read_data_2);
        SignExtend: sign_extender port map (immediate, extended_immediate);
        Shift32: shift_left_32bits port map (extended_immediate, shifted_immediate);
        AddImmediatePC: adder port map (next_pc, shifted_immediate, add_pc_immediate);
        MuxRegistersOut: mux_32bits port map (alu_src, read_data_2, extended_immediate, mux_registers_out);
        ALUControl: alu_control port map (funct, alu_op, alu_ctrl, JR);
        ALUModule: alu port map (read_data_1, mux_registers_out, alu_ctrl, alu_zero, alu_result);
        MuxAdd1: mux_32bits port map (branch_and_alu_zero, next_pc, add_pc_immediate, mux_add_1_res);
        MuxAdd2: mux_32bits port map (jump, mux_add_1_res, jump_and_pc, mux_add_2_res);
        MuxAdd3: mux_32bits port map (JR, mux_add_2_res, read_data_2, next_address);
        DataMemory: data_memory port map (mem_read, mem_write, '0', clk, alu_result, read_data_2, mem_read_data);
        MuxDataMemory: mux_32bits port map (mem_to_reg, alu_result, mem_read_data, write_data);

    end Behavioral;

