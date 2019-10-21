--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:07:51 09/25/2019
-- Design Name:   
-- Module Name:   C:/Users/salex/Desktop/LabArqui/practica4/registers_testbench.vhd
-- Project Name:  practica4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg
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
USE work.SLV.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or unsigned values
--USE ieee.numeric_std.all;
 
ENTITY registers_testbench IS
end registers_testbench;
 
ARCHITECTURE behavior OF registers_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg
    port(
         clk : in  std_logic;
         WriteData : in  std_logic_vector(31 downto 0);
         Enabler : in  std_logic_vector(31 downto 0);
         Registers : out  SLV_ARRAY
        );
    end COMPONENT;
    

   --inputs
   signal clk : std_logic := '0';
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal Enabler : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal Registers : SLV_ARRAY;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: reg port map (
          clk => clk,
          WriteData => WriteData,
          Enabler => Enabler,
          Registers => Registers
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		Enabler(1) <= '1';
		WriteData <= x"0000_1111";
		
		wait for 25 ns;
		
		Enabler(1) <= '0';
		Enabler(2) <= '1';
		WriteData <= x"1111_1111";
		

      wait;
   end process;

end;
