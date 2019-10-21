
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY adder_testBench IS
end adder_testBench;
 
ARCHITECTURE behavior OF adder_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    port(
         a : in  std_logic_vector(31 downto 0);
         b : in  std_logic_vector(31 downto 0);
         c : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;

   --inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal c : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: adder port map (
          a => a,
          b => b,
          c => c
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= X"0000_0001";
		b <= X"0000_0005";
		
		wait for 30 ns;
		
		a <= X"FFFF_FFFF";
		b <= X"0000_0001";
		
		wait for 30 ns;
		
		a <= X"0000_0002";
		b <= X"0000_0002";
		
		wait for 30 ns;
		
		a <= X"0000_0000";
		b <= X"0000_0000";
		
      wait;
   end process;

end;
