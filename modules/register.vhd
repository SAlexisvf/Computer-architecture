library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.SLV.all;

entity reg is
	port (
		clk : in std_logic;
		write_data : in std_logic_vector(31 downto 0);
        Enabler : in std_logic_vector(31 downto 0);
		Registers : out SLV_ARRAY
	);
end reg;

architecture Behavioral of reg is
begin
process(clk, Enabler, write_data)
begin
	Registers(0) <= x"0000_0000";
	if clk'event and clk = '0' then
		for i in 1 to 31 loop
			if Enabler(i) = '1' then
				Registers(i) <= write_data;
			end if;
		end loop;
	end if;
end process;
end Behavioral;

