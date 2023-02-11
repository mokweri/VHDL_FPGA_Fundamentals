---------------------------------------------------------------------------
-- This VHDL fil
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Triple Modular Redundancy:
-- We have 3 identical systems, providing the same 3 outputs.
-- We expect those outputs to be identical. However, that might not be the case.
-- So, we implement a voting system: if at least 2 outputs are identical, we pick
-- that output to be correct. If all 3 outputs are different, we have an error (y_err = '1')
entity maj_gate is
	generic (N: INTEGER:= 8);
	port (A,B,C: in std_logic_vector (N-1 downto 0);
	      f: out std_logic_vector (N-1 downto 0);
	      y_err: out std_logic);
end maj_gate;

architecture Behavioral of maj_gate is

begin

	process (A,B,C)
	begin
		
		y_err <= '0';
		if (A = B) then
			f <= A;
		end if;
		if (A = C) then
			f <= A;
		end if;
		if (B = C) then
			f <= B;
		end if;
		
		if (A /= B) and (B /= C) and (A /= C) then
			f <= (others => '0');
			y_err <= '1';
		end if;
			
	end process;


end Behavioral;