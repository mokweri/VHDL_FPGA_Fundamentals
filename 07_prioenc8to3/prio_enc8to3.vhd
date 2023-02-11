---------------------------------------------------------------------------
-- This VHDL 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prio_enc8to3 is
	port ( w: in std_logic_vector (7 downto 0);
	       y: out std_logic_vector (2 downto 0);
		   z: out std_logic);
end prio_enc8to3;

architecture structure of prio_enc8to3 is

begin

	y <= "111" when w(7) = '1' else
	     "110" when w(6) = '1' else
	     "101" when w(5) = '1' else
	     "100" when w(4) = '1' else
	     "011" when w(3) = '1' else
	     "010" when w(2) = '1' else
		 "001" when w(1) = '1' else
		  "000";
		  
   z <= '0' when w = "00000000" else '1';

end structure;

