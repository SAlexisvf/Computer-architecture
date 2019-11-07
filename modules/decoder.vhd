library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity decoder is
  port (write_reg : in std_logic_vector(4 downto 0);
        reg_write : in std_logic;
		  enabler : out std_logic_vector(31 downto 0));
end decoder;

architecture Behavioral of decoder is
begin
process(write_reg, reg_write)
begin
	enabler <= (others => '0');
	if (reg_write = '1') then
		enabler(to_integer(unsigned(write_reg))) <= '1';
	end if;
end process;
end Behavioral;
