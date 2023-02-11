---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_det is
	port (clock, resetn: in std_logic;
	      x: in std_logic;
		  z: out std_logic);
end pulse_det;

architecture behaviour of pulse_det is
	type state is (S1, S2, S3);
	signal y: state;
begin

	Transitions: process (resetn, clock, x)
	begin
		if resetn = '0' then
			y <= S1;
		elsif (clock'event and clock = '1') then
			case y is
				when S1 =>
				    if x = '0' then y <= S2; else y <= S1; end if;

				when S2 =>
				    if x = '1' then y <= S3; else y <= S2; end if;
				    
				when S3 =>
				    if x = '1' then y <= S3; else y <= S2; end if;
                                    
                end case;
		end if;
		
	end process;
	
	Outputs: process (y, x)
	begin		
	    z <= '0'; -- Default value
		case y is			
			when S1 => -- z <= '0' because of default value. 
			when S2 => -- z <= '0'; because of the default value
			when S3 => if x = '0' then z <= '1'; end if;
		end case;
	end process;

end behaviour;