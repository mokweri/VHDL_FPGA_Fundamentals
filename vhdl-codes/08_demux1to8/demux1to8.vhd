---------------------------------------------------------------------------
-- This VHDL file
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1to8 is
	port ( s: in std_logic_vector (2 downto 0);
	       x: in std_logic;
		   y: out std_logic_vector (7 downto 0));
end demux1to8;

architecture struct of demux1to8 is

begin

	with s select
		y <= "0000000"&x    when "000",
		     "000000"&x&"0" when "001",
		     "00000"&x&"00" when "010",
		     "0000"&x&"000" when "011",
			 "000"&x&"0000" when "100",
			 "00"&x&"00000" when "101",
			 "0"&x&"000000" when "110",
			 x&"0000000"    when others;	
end struct;

