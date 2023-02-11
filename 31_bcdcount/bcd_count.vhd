---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_count is
	port (clock, resetn: in std_logic;
	      stop: in std_logic;
			Q: out std_logic_vector (3 downto 0));
end bcd_count;

architecture Behavioral of bcd_count is
	type state is (S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
	signal y: state;	
begin

	Transitions: process (resetn, clock, stop)
	begin
		if resetn = '0' then
			y <= S1;
		elsif (clock'event and clock = '1') then
			case y is
				when S1 =>
					if stop = '1' then y <= S1; else y <= S2; end if;
				when S2 =>
					if stop = '1' then y <= S2; else y <= S3; end if;
				when S3 =>
					if stop = '1' then y <= S3; else y <= S4; end if;
				when S4 =>
					if stop = '1' then y <= S4; else y <= S5; end if;
				when S5 =>
					if stop = '1' then y <= S5; else y <= S6; end if;
				when S6 =>
					if stop = '1' then y <= S6; else y <= S7; end if;
				when S7 =>
					if stop = '1' then y <= S7; else y <= S8; end if;
				when S8 =>
					if stop = '1' then y <= S8; else y <= S9; end if;
				when S9 =>
					if stop = '1' then y <= S9; else y <= S10; end if;
				when S10 =>				
					if stop = '1' then y <= S10; else y <= S1; end if;
			end case;
		end if;
	end process;
	
	Outputs: process (y)
	begin
		case y is
			when S1 => Q <= "0000";
			when S2 => Q <= "0001";
			when S3 => Q <= "0010";
			when S4 => Q <= "0011";
			when S5 => Q <= "0100";
			when S6 => Q <= "0101";
			when S7 => Q <= "0110";
			when S8 => Q <= "0111";
			when S9 => Q <= "1000";
			when S10 => Q <= "1001";	
      end case;			
	end process;

end Behavioral;

