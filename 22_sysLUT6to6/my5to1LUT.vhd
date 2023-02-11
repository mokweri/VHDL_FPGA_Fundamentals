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

entity my5to1LUT is
	generic (data: std_logic_vector(31 downto 0):=x"FACEFEAB");
	port ( ILUT: in std_logic_vector (4 downto 0);
	       OLUT: out std_logic);
end my5to1LUT;

architecture Behavioral of my5to1LUT is

	component my4to1LUT
		generic (data: std_logic_vector(15 downto 0):=x"FEAB");
		port ( ILUT: in std_logic_vector (3 downto 0);
				 OLUT: out std_logic);
	end component;

	signal OLUT_l, OLUT_h: std_logic;
	
begin
	
	-- 4-to-1 LUT holding contents: data(15 downto 0)
	rl: my4to1LUT generic map (data => data(15 downto 0))
	    port map (ILUT => ILUT(3 downto 0), OLUT => OLUT_l);
		 
	-- 4-to-1 LUT holding contents: data(31 downto 16)
	rh: my4to1LUT generic map (data => data (31 downto 16))
	    port map (ILUT => ILUT(3 downto 0), OLUT => OLUT_h);
		 
	with ILUT(4) select
			OLUT <= OLUT_l when '0',
					  OLUT_h when others;
end Behavioral;

