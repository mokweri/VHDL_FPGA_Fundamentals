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

entity my4to1LUT is
	generic (data: std_logic_vector(15 downto 0):=x"FEAB");
	port ( ILUT: in std_logic_vector (3 downto 0);
	       OLUT: out std_logic);
end my4to1LUT;

architecture Behavioral of my4to1LUT is

begin
	
	with ILUT select
			OLUT <= data(0) when "0000",
					  data(1) when "0001",
					  data(2) when "0010",
					  data(3) when "0011",
					  data(4) when "0100",
					  data(5) when "0101",
					  data(6) when "0110",
					  data(7) when "0111",
					  data(8) when "1000",
					  data(9) when "1001",
					  data(10) when "1010",
  					  data(11) when "1011",
					  data(12) when "1100",
					  data(13) when "1101",
					  data(14) when "1110",
					  data(15) when "1111",
					  '0' when others;

end Behavioral;

