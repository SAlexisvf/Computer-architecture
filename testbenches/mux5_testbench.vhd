--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:29 08/29/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/Practica1/mux5_testBench.vhd
-- Project Name:  Practica1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux5
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
 
ENTITY mux5_testBench IS
END mux5_testBench;
 
ARCHITECTURE behavior OF mux5_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux5
    PORT(
         selector : IN  std_logic;
         input_1 : IN  std_logic_vector(4 downto 0);
         input_2 : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal selector : std_logic := '0';
   signal input_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal input_2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux5 PORT MAP (
          selector => selector,
          input_1 => input_1,
          input_2 => input_2,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		input_1 <= "00001";
		input_2 <= "00010";

      -- insert stimulus here 
		selector <= '0';
		
		wait for 20 ns;
		
		selector <= '1';
		
		wait for 20 ns;
		
		input_2 <= "00011";
		
		wait for 20 ns;
		
		selector <= '0';
		
		wait for 20 ns;
		
		input_1 <= "00100"; 

      wait;
   end process;

END;
