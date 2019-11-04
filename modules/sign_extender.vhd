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
	signed_num <= B"0000000000000000" & num when num(15) = '0' else B"1111111111111111" & num;
end Behavioral;

