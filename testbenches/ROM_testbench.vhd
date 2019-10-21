--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:42:03 09/11/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/Practica3/ROM_Testbench.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
 
ENTITY ROM_Testbench IS
END ROM_Testbench;
 
ARCHITECTURE behavior OF ROM_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         DIRECCION : IN  std_logic_vector(31 downto 0);
         DATO : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DIRECCION : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATO : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          DIRECCION => DIRECCION,
          DATO => DATO
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		DIRECCION <= x"0000_0000";
		
		wait for 30 ns;
		
		DIRECCION <= x"0000_0004";
		
		wait for 30 ns;
		
		DIRECCION <= x"0000_0008";
		
		wait for 30 ns;
		
		DIRECCION <= x"0000_000C";
		
		wait for 30 ns;
		
		DIRECCION <= x"0000_0010";
		
		wait for 30 ns;
		
		DIRECCION <= x"0000_0014";
		
		wait for 30 ns;
		

      wait;
   end process;

END;
