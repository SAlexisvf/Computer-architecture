
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAM_TestBench IS
END RAM_TestBench;
 
ARCHITECTURE behavior OF RAM_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         READ_ENABLE : IN  std_logic;
         WRITE_ENABLE : IN  std_logic;
         ENABLE : IN  std_logic;
         CLK : IN  std_logic;
         ADDRESS : IN  std_logic_vector(31 downto 0);
         WRITE_DATA : IN  std_logic_vector(31 downto 0);
         READ_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal READ_ENABLE : std_logic := '0';
   signal WRITE_ENABLE : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal ADDRESS : std_logic_vector(31 downto 0) := (others => '0');
   signal WRITE_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal READ_DATA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          READ_ENABLE => READ_ENABLE,
          WRITE_ENABLE => WRITE_ENABLE,
          ENABLE => ENABLE,
          CLK => CLK,
          ADDRESS => ADDRESS,
          WRITE_DATA => WRITE_DATA,
          READ_DATA => READ_DATA
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
		
		READ_ENABLE <= '1';
		WRITE_ENABLE <= '0';
		ENABLE <= '0';
		ADDRESS <= x"0000_0000";
		WRITE_DATA <= x"0000_0000";
		
		wait for 100 ns;
		
		ADDRESS <= x"0000_0004";
		
		wait for 100 ns;
		
		READ_ENABLE <= '0';
		WRITE_ENABLE <= '1';
		WRITE_DATA <= x"0000_1111";
		
		wait for 100 ns;
		
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"0000_0000";

      wait;
   end process;

END;
