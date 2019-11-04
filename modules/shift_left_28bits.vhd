library ieee;
use ieee.std_logic_1164.ALL;

entity shift_left_28bits is
    port (
        input : in  std_logic_vector (25 downto 0);
        output : out  std_logic_vector (27 downto 0)
    );
end shift_left_28bits;

architecture Behavioral of shift_left_28bits is

begin
    output <= input(25 downto 0) & "00";
end Behavioral;