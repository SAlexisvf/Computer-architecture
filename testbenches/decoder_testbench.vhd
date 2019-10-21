--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:55:58 09/25/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/practica4/decoder_testbench.vhd
-- Project Name:  practica4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder
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
 
ENTITY decoder_testbench IS
end decoder_testbench;
 
ARCHITECTURE behavior OF decoder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    port(
         WriteReg : in  std_logic_vector(4 downto 0);
         RegWrite : in  std_logic;
         Enabler : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;
    

   --inputs
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';

 	--outputs
   signal Enabler : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: decoder port map (
          WriteReg => WriteReg,
          RegWrite => RegWrite,
          Enabler => Enabler
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		RegWrite <= '1';
		WriteReg <= "00010";
		
		wait for 25 ns;
		
		WriteReg <= "00011";
		
		wait for 25 ns;
		
		RegWrite <= '0';
		
		wait for 25 ns;
		
		WriteReg <= "01011";
		RegWrite <= '1';
		

      wait;
   end process;

end;
