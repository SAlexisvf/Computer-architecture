library ieee;
use ieee.std_logic_1164.ALL;

entity sign_extender is
    port (
		num : in  std_logic_vector (15 downto 0);
		signed_num : out  std_logic_vector (31 downto 0)
	);
end sign_extender;

architecture Behavioral of sign_extender is

begin
	process (num)
	begin
		if num(15) = '1' then
			signed_num <= x"FFFF" & num;
		else
			signed_num <= x"0000" & num;
		end if;
	end process;
end Behavioral;

