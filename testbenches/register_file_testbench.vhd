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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_testbench IS
END register_file_testbench;
 
ARCHITECTURE behavior OF register_file_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         clk : IN  std_logic;
         WriteReg : IN  std_logic_vector(4 downto 0);
         ReadReg1 : IN  std_logic_vector(4 downto 0);
         ReadReg2 : IN  std_logic_vector(4 downto 0);
         RegWrite : IN  std_logic;
         WriteData : IN  std_logic_vector(31 downto 0);
         ReadReg1Output : OUT  std_logic_vector(31 downto 0);
         ReadReg2Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadReg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ReadReg1Output : std_logic_vector(31 downto 0);
   signal ReadReg2Output : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          clk => clk,
          WriteReg => WriteReg,
          ReadReg1 => ReadReg1,
          ReadReg2 => ReadReg2,
          RegWrite => RegWrite,
          WriteData => WriteData,
          ReadReg1Output => ReadReg1Output,
          ReadReg2Output => ReadReg2Output
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
		
		ReadReg1 <= "00001";
		ReadReg2 <= "00011";
		
		wait for 25 ns;
		
		WriteReg <= "00001";
		WriteData <= x"0000_1111";
		RegWrite <= '1';
		
		wait for 25 ns;
		
		RegWrite <= '0';
		
		wait for 10 ns;
		
		WriteReg <= "00011";
		WriteData <= x"1111_0000";
		RegWrite <= '1';

      wait;
   end process;

END;
