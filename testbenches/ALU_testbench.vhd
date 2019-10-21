--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:28:05 09/11/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/Practica2/alu_testbench.vhd
-- Project Name:  Practica2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
 
ENTITY alu_testbench IS
END alu_testbench;
 
ARCHITECTURE behavior OF alu_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         cntrl : IN  std_logic_vector(2 downto 0);
         zero : OUT  std_logic;
         result : BUFFER  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal cntrl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          a => a,
          b => b,
          cntrl => cntrl,
          zero => zero,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		cntrl <= "000";
		a <= x"0000_0003";
		b <= x"0000_0002";
		
		wait for 40 ns;
		
		cntrl <= "001";
		
		wait for 40 ns;
		
		cntrl <= "010";
		
		wait for 40 ns;
		
		cntrl <= "011";
		
		wait for 40 ns;
		
		cntrl <= "100";
		
		wait for 40 ns;
		
		cntrl <= "110";

		wait for 40 ns;
		
		cntrl <= "111";
		
		wait for 40 ns;
		
      wait;
   end process;

END;
