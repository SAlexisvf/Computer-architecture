library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity pc is
	port (
        d : in std_logic_vector (31 downto 0);
        q : out std_logic_vector (31 downto 0);
        reset : in std_logic;
        clk : in std_logic
    );
end pc;

architecture Behavioral of pc is
signal q_aux : std_logic_vector (31 downto 0) :="00000000000000000000000000000000";
begin

	process(clk, reset)
	begin
		if(reset ='0') then
			if(rising_edge(clk)) then
				q_aux<=d;
			else
				q_aux<=q_aux;
			end if;			
		elsif(reset='1') then
			q_aux<="00000000000000000000000000000000";
		end if;
	end process;
	q<=q_aux;
end Behavioral;
