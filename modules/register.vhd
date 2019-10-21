library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.SLV.ALL;

entity reg is
  PORT (clk : IN std_logic;
		  WriteData : IN std_logic_vector(31 DOWNTO 0);
        Enabler : IN std_logic_vector(31 DOWNTO 0);
		  Registers : OUT SLV_ARRAY);
end reg;

architecture Behavioral of reg is
begin
process(clk)
begin
	if clk'event and clk = '0' then
		for i in 0 to 31 loop
			if Enabler(i) = '1' and i /= 0 then
				Registers(i) <= WriteData;
			end if;
		end loop;
	end if;
end process;
end Behavioral;

