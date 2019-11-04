LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

package SLV is
	TYPE SLV_ARRAY IS ARRAY (0 to 31) of std_logic_vector(31 downto 0);
end package;