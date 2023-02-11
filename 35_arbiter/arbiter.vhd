---------------------------------------------------------------------------
-- This VHDL file was
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arbiter is
	port (clock, resetn: in std_logic;
	      r1, r2, r3: in std_logic;
		  g1, g2, g3: out std_logic);
end arbiter;

architecture behaviour of arbiter is
	type state is (S1, S2, S3, S4);
	signal y: state;
begin

	Transitions: process (resetn, clock, r1, r2, r3)
	begin
		if resetn = '0' then
			y <= S1;
		elsif (clock'event and clock = '1') then
			case y is
				when S1 =>
				    if r1 = '1' then
				        y <= S2;
				    elsif r2 = '1' then
				        y <= S3;
				    elsif r3 = '1' then
				        y <= S4;
				    else
				        y <= S1;
				    end if;

				when S2 =>
					if r1 ='1' then y <= S2; else y <= S1; end if;
					
				when S3 =>
					if r2 ='1' then y <= S3; else y <= S1; end if;
                                    
				when S4 =>
                    if r3 ='1' then y <= S4; else y <= S1; end if;
                end case;
		end if;
		
	end process;
	
	Outputs: process (y, r1, r2, r3)
	begin		
	    g1 <= '0'; g2 <= '0'; g3 <= '0'; -- Default values
		case y is			
			when S1 =>  -- g1 <= '0'; g2 <= '0'; g3 <= '0'; because of the default values
			when S2 => g1 <= '1'; -- g2 <= '0'; g3 <= '0'; because of the default values
			when S3 => g2 <= '1'; -- g1 <= '0'; g3 <= '0'; because of the default values
			when S4 => g3 <= '1'; -- g1 <= '0'; g2 <= '0'; because of the default values
		end case;
	end process;

end behaviour;