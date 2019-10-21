--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:09 08/29/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/Practica1/mux32_testBench.vhd
-- Project Name:  Practica1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux32
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
 
ENTITY mux32_testBench IS
end mux32_testBench;
 
ARCHITECTURE behavior OF mux32_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux32
    port(
         selector : in  std_logic;
         input_1 : in  std_logic_vector(31 downto 0);
         input_2 : in  std_logic_vector(31 downto 0);
         output : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;
    

   --inputs
   signal selector : std_logic := '0';
   signal input_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal input_2 : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: mux32 port map (
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
		input_1 <= X"0000_0005";
		input_2 <= X"0000_0003";

      -- insert stimulus here 
		selector <= '0';
		
		wait for 20 ns;
		
		selector <= '1';
		
		wait for 20 ns;
		
		input_2 <= X"0000_0007";
		
		wait for 20 ns;
		
		selector <= '0';
		
		wait for 20 ns;
		
		input_1 <= X"0000_0010";
		

      wait;
   end process;

end;
