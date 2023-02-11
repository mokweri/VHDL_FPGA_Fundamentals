---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ledseq is
	port (clock, resetn: std_logic;
	      E: in std_logic;
			DO: out std_logic_vector (7 downto 0));
end ledseq;

architecture Behavioral of ledseq is
	type state is (S1, S2, S3, S4, S5, S6);
	signal y: state;
begin

	Transitions: process (resetn, clock, E)
	begin
		if resetn = '0' then
			y <= S1;
		elsif (clock'event and clock = '1') then
			case y is
				when S1 =>
					if E = '1' then y <= S2; else y <= S1; end if;
				when S2 =>
					if E = '1' then y <= S3; else y <= S2; end if;
				when S3 =>
					if E = '1' then y <= S4; else y <= S3; end if;
				when S4 =>
					if E = '1' then y <= S5; else y <= S4; end if;
				when S5 =>
					if E = '1' then y <= S6; else y <= S5; end if;
				when S6 =>
					if E = '1' then y <= S1; else y <= S6; end if;
				end case;
		end if;
		
	end process;
	
	Outputs: process (y)
	begin		
		case y is			
			when S1 => DO <= "00011000";
			when S2 => DO <= "00111100";
			when S3 => DO <= "01111110";
			when S4 => DO <= "11100111";
			when S5 => DO <= "11000011";
			when S6 => DO <= "10000001";
		end case;
	end process;

end Behavioral;