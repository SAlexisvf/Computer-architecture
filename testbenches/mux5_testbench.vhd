LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY mux5_testBench IS
end mux5_testBench;
 
ARCHITECTURE behavior OF mux5_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux5
    port(
         selector : in  std_logic;
         input_1 : in  std_logic_vector(4 downto 0);
         input_2 : in  std_logic_vector(4 downto 0);
         output : out  std_logic_vector(4 downto 0)
        );
    end COMPONENT;
    

   --inputs
   signal selector : std_logic := '0';
   signal input_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal input_2 : std_logic_vector(4 downto 0) := (others => '0');

 	--outputs
   signal output : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: mux5 port map (
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

end;
