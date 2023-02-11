---------------------------------------------------------------------------
-- This VHDL.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

-- ud = 0 --> Q <= Q - 1
-- ud = 1 --> Q <= Q + 1
entity bcd_udcount is
	port ( clock, resetn, E, ud: in std_logic;
		   Q: out std_logic_vector (3 downto 0));
end bcd_udcount;

architecture Behavioral of bcd_udcount is
	signal Qt: integer range 0 to 15;
begin

	process (resetn, clock, E, ud)
	begin
		if resetn = '0' then
			Qt <= 0;
		elsif (clock'event and clock = '1') then
			if E = '1' then
				if ud = '0' then
					if Qt = 0 then
						Qt <= 9;
					else
						Qt <= Qt -1;
					end if;
				else
					if Qt = 9 then
						Qt <= 0;
					else
						Qt <= Qt + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	Q <= conv_std_logic_vector(Qt,4);

end Behavioral;

