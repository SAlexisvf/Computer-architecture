--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:13:47 09/18/2019
-- Design Name:   
-- Module Name:   /home/eskr/Documents/practica4/reg_file_testbench.vhd
-- Project Name:  practica4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or unsigned values
--USE ieee.numeric_std.all;
 
ENTITY register_file_testbench IS
end register_file_testbench;
 
ARCHITECTURE behavior OF register_file_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    port(
         clk : in  std_logic;
         write_reg : in  std_logic_vector(4 downto 0);
         read_reg_1 : in  std_logic_vector(4 downto 0);
         read_reg_2 : in  std_logic_vector(4 downto 0);
         reg_write : in  std_logic;
         write_data : in  std_logic_vector(31 downto 0);
         read_data_1 : out  std_logic_vector(31 downto 0);
         read_data_2 : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;

   --inputs
   signal clk : std_logic := '0';
   signal write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal read_reg_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_reg_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal reg_write : std_logic := '0';
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal read_data_1 : std_logic_vector(31 downto 0);
   signal read_data_2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: register_file port map (
          clk => clk,
          write_reg => write_reg,
          read_reg_1 => read_reg_1,
          read_reg_2 => read_reg_2,
          reg_write => reg_write,
          write_data => write_data,
          read_data_1 => read_data_1,
          read_data_2 => read_data_2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		read_reg_1 <= "00001";
		read_reg_2 <= "00011";
		
		wait for 25 ns;
		
		write_reg <= "00001";
		write_data <= x"0000_1111";
		reg_write <= '1';
		
		wait for 25 ns;
		
		reg_write <= '0';
		
		wait for 10 ns;
		
		write_reg <= "00011";
		write_data <= x"1111_0000";
		reg_write <= '1';

      wait;
   end process;

end;
