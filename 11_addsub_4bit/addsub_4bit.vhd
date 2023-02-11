---------------------------------------------------------------------------
-- This VHDL fi
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;

entity addsub_4bit is
	port ( a,b: in std_logic_vector (3 downto 0);
	       s: in std_logic;
		   f: out std_logic_vector (3 downto 0));
end addsub_4bit;

architecture struct of addsub_4bit is
       
begin
	-- Note that the result of a+b (or a-b) will be of the same size as 'a' and 'b' .
	-- This means that overflow is not accounted by the operator '+' or '-'
	
	-- a+b/a-b: If we use this, we must specify the representation: using ieee.std_logic_unsigned (or ieee_std_logic_signed).
	with s select
	   f <= a + b when '0',
	        a - b when others;

   -- unsigned(a) +/- unsigned (b): To use this, we must use ieee.std_logic_arith.all
--	with s select
--	   f <= unsigned(a) + unsigned(b) when '0',
--	        unsigned(a) - unsigned(b) when others;

end struct;