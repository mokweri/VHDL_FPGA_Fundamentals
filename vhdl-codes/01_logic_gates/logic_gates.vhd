---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka obed(2023)
--- OpenSource
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_gates is
	port (a,b,c: in std_logic;
	      f: out std_logic);

end logic_gates;

architecture struct of logic_gates is
   signal x,y: std_logic;
begin

x <= C nor B;
y <= A and not(B);
f <= not (x xor y);

end struct;