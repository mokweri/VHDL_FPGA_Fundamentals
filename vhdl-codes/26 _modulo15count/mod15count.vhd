---------------------------------------------------------------------------
-- This VHDL file was d
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity mod15count is
	port ( 
		clock, resetn, E: in std_logic;
		Q: out std_logic_vector (3 downto 0);
		z: out std_logic);
end mod15count;

architecture Behavioral of mod15count is
	signal Qt: integer range 0 to 14;
begin

	process (resetn, clock, E)
	begin
		if resetn = '0' then
			Qt <= 0;
		elsif (clock'event and clock = '1') then
			if E = '1' then
				if Qt = 14 then
					Qt <= 0;
				else
					Qt <= Qt + 1;
				end if;
			end if;
		end if;
	end process;
	Q <= conv_std_logic_vector(Qt,4);

	z <= '1' when Qt = 14 else '0';
end Behavioral;
