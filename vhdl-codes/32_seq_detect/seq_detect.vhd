---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------

-- This hardware detects the serial input "11010" within a string of input bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_detect is
	port (clock, resetn: std_logic;
	      x: in std_logic;
			z: out std_logic);
end seq_detect;

architecture Behavioral of seq_detect is
	type state is (S1, S2, S3, S4, S5);
	signal y: state;
begin

	Transitions: process (resetn, clock,x)
	begin
		if resetn = '0' then
			y <= S1;
		elsif (clock'event and clock = '1') then
			case y is
				when S1 =>
					if x = '1' then y <= S2; else y <= S1; end if;
				when S2 =>
					if x = '1' then y <= S3; else y <= S1; end if;
				when S3 =>
					if x = '1' then y <= S3; else y <= S4; end if;
				when S4 =>
					if x = '1' then y <= S5; else y <= S1; end if;
				when S5 =>
					if x = '1' then y <= S3; else y <= S1; end if;
			end case;
		end if;
		
	end process;
	
	Outputs: process (x,y)
	begin
		z <= '0';
		case y is			
			when S1 =>
			when S2 =>
			when S3 =>
			when S4 =>
			when S5 => if x = '0' then z <= '1'; end if;
		end case;
	end process;

end Behavioral;

