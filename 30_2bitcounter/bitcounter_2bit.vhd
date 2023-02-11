---------------------------------------------------------------------------
-- This VHDL file was
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitcounter_2bit is
	port (clock, resetn: in std_logic;
	      q: out std_logic_vector (1 downto 0));
end bitcounter_2bit;

architecture behaviour of bitcounter_2bit is
	type state is (S1,S2,S3,S4);
	signal y: state;
	
begin

	Transitions: process (resetn, clock)
	begin
		if resetn = '0' then -- asynchronous signal
			y <= S1; -- if resetn asserted, go to initial state: S1			
		elsif (clock'event and clock = '1') then
			case y is
				when S1 => y <= S2;
				when S2 => y <= S3;
				when S3 => y <= S4;
				when S4 => y <= S1;
			end case;
		end if;		
	end process;
	
	Outputs: process (y)
	begin
		case y is
			when S1 => q <= "00";
			when S2 => q <= "01";
			when S3 => q <= "10";
			when S4 => q <= "11";
		end case;
	end process;

end behaviour;