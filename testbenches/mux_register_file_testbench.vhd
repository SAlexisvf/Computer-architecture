LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY mux_register_file_testbench IS
end mux_register_file_testbench;
 
ARCHITECTURE behavior OF mux_register_file_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_register_file
    port(
         ReadReg : in  std_logic_vector(4 downto 0);
         inRegs : in  SLV_ARRAY;
         ReadData : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;
    

   --inputs
   signal ReadReg : std_logic_vector(4 downto 0) := (others => '0');
   signal inRegs : SLV_ARRAY;

 	--outputs
   signal ReadData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: mux_register_file port map (
          ReadReg => ReadReg,
          inRegs => inRegs,
          ReadData => ReadData
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		ReadReg <= "00001";
		inRegs(1) <= x"1111_0000";
		
		wait for 25 ns;
		
		ReadReg <= "00011";
		inRegs(3) <= x"1111_1111";
		
		wait for 25 ns;
		
		ReadReg <= "00010";
		inRegs(2) <= x"0000_0000";

      wait;
   end process;

end;
