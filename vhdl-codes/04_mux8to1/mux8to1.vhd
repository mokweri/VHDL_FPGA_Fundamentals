---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka Obed (2023).  
-- Open SOurce
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2 styles for a mux 8-to-1
entity mux8to1 is
	port (a,b,c,d,e,f,g,h: in std_logic;
	      s: in std_logic_vector (2 downto 0);
	      y_r, y_t: out std_logic);
end mux8to1;

architecture structure of mux8to1 is

begin

	with s select
		y_r <= a when "000",
		       b when "001",
			   c when "010",
			   d when "011",
			   e when "100",
			   f when "101",
			   g when "110",
			   h when others;

	y_t <= a when s = "000" else
		b when s = "001" else
		c when s = "010" else
		d when s = "010" else
		e when s = "110" else
		f when s = "110" else
		g when s = "110" else
		h;
			 
end structure;

