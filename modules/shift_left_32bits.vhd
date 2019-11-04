library ieee;
use ieee.std_logic_1164.ALL;

entity shift_left_32bits is
    port (
        input : in  std_logic_vector (31 downto 0);
        output : out  std_logic_vector (31 downto 0)
    );
end shift_left_32bits;

architecture Behavioral of shift_left_32bits is

begin
    output <= input(29 downto 0) & "00";
end Behavioral;
