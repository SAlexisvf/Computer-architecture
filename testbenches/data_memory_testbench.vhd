
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or unsigned values
--USE ieee.numeric_std.all;
 
ENTITY data_memory_testbench IS
end data_memory_testbench;
 
ARCHITECTURE behavior OF data_memory_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_memory
    port(
         read_enable : in  std_logic;
         write_enable : in  std_logic;
         enable : in  std_logic;
         CLK : in  std_logic;
         address : in  std_logic_vector(31 downto 0);
         write_data : in  std_logic_vector(31 downto 0);
         read_data : out  std_logic_vector(31 downto 0)
        );
    end COMPONENT;
    

   --inputs
   signal read_enable : std_logic := '0';
   signal write_enable : std_logic := '0';
   signal enable : std_logic := '0';
   signal CLK : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--outputs
   signal read_data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
begin
 
	-- instantiate the Unit Under Test (UUT)
   uut: data_memory port map (
          read_enable => read_enable,
          write_enable => write_enable,
          enable => enable,
          CLK => CLK,
          address => address,
          write_data => write_data,
          read_data => read_data
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
		read_enable <= '1';
		write_enable <= '0';
		enable <= '0';
		address <= x"0000_0000";
		write_data <= x"0000_0000";
		
		wait for 100 ns;
		
		address <= x"0000_0004";
		
		wait for 100 ns;
		
		read_enable <= '0';
		write_enable <= '1';
		write_data <= x"0000_1111";
		
		wait for 100 ns;
		
		write_enable <= '0';
		read_enable <= '1';
		write_data <= x"0000_0000";

      wait;
   end process;

end;
