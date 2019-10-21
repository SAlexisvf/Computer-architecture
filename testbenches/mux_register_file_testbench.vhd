--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:18:34 09/25/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/practica4/mux_testbench.vhd
-- Project Name:  practica4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
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
USE work.SLV.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_register_file_testbench IS
END mux_register_file_testbench;
 
ARCHITECTURE behavior OF mux_register_file_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_register_file
    PORT(
         ReadReg : IN  std_logic_vector(4 downto 0);
         InRegs : IN  SLV_ARRAY;
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ReadReg : std_logic_vector(4 downto 0) := (others => '0');
   signal InRegs : SLV_ARRAY;

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_register_file PORT MAP (
          ReadReg => ReadReg,
          InRegs => InRegs,
          ReadData => ReadData
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		ReadReg <= "00001";
		InRegs(1) <= x"1111_0000";
		
		wait for 25 ns;
		
		ReadReg <= "00011";
		InRegs(3) <= x"1111_1111";
		
		wait for 25 ns;
		
		ReadReg <= "00010";
		InRegs(2) <= x"0000_0000";

      wait;
   end process;

END;
