---------------------------------------------------------------------------
-- This VHDL file
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6to1LUT is
	generic (data: std_logic_vector(63 downto 0):=x"ACCABEBEFACEFEAB");
	port ( 
		ILUT: in std_logic_vector (5 downto 0);
	    OLUT: out std_logic);
end my6to1LUT;

architecture Behavioral of my6to1LUT is

	component my5to1LUT
		generic (data: std_logic_vector(31 downto 0):=x"FACEFEAB");
		port ( 
			ILUT: in std_logic_vector (4 downto 0);
			OLUT: out std_logic);
	end component;
	
	signal OLUT_l, OLUT_h: std_logic;
		
begin
	
	-- 5-to-1 LUT holding contents: data(31 downto 0)
	rl: my5to1LUT generic map (data => data(31 downto 0))
	    port map (ILUT => ILUT(4 downto 0), OLUT => OLUT_l);
		 
	-- 5-to-1 LUT holding contents: data(63 downto 32)
	rh: my5to1LUT generic map (data => data (63 downto 32))
	    port map (ILUT => ILUT(4 downto 0), OLUT => OLUT_h);
		 
	with ILUT(5) select
			OLUT <= OLUT_l when '0',
					OLUT_h when others;
end Behavioral;

