---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2013).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sec_comb is
	port ( SW: in std_logic_vector (7 downto 0);
	       LED: out std_logic_vector (7 downto 0)
			 );
end sec_comb;

architecture Behavioral of sec_comb is

	signal f: std_logic;
	
begin

--     SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0
-- Key: 0   1   1   0   1   0   1   1

   f <= not(SW(7)) and SW(6) and SW(5) and not(SW(4)) and SW(3) and not(SW(2)) and SW(1) and SW(0);

	LED(7) <= f;
	LED(6) <= f;
	LED(5) <= f;
	LED(4) <= f;
	LED(3) <= f;
	LED(2) <= f;
	LED(1) <= f;
	LED(0) <= f;
	
end Behavioral;

