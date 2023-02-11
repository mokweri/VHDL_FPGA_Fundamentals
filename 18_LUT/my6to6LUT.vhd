---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my6to6LUT is
	generic (data5: std_logic_vector(63 downto 0):=x"FEAB97CA003E19CC";  -- column 5
	         data4: std_logic_vector(63 downto 0):=x"AABBCCFFEE99098A";  -- column 4
	         data3: std_logic_vector(63 downto 0):=x"E595BEBECAFEDADA";  -- column 3
	         data2: std_logic_vector(63 downto 0):=x"FACE09093E3EECAB";  -- column 2
	         data1: std_logic_vector(63 downto 0):=x"DECAFFFF09EA3200";  -- column 1
	         data0: std_logic_vector(63 downto 0):=x"ACADE412BAFE125E"); -- column 0
	port ( ILUT: in std_logic_vector (5 downto 0);
	       OLUT: out std_logic_vector (5 downto 0));
end my6to6LUT;

architecture Behavioral of my6to6LUT is

	component my6to1LUT
		generic (data: std_logic_vector(63 downto 0):=x"ACCABEBEFACEFEAB");
		port ( 
			ILUT: in std_logic_vector (5 downto 0);
			OLUT: out std_logic);
	end component;
	
	signal OLUT_l, OLUT_h: std_logic;
		
begin
	
	-- 6-to-1 LUT holding contents of column 5:
	r5: my6to1LUT generic map (data => data5)
	    port map (ILUT => ILUT, OLUT => OLUT(5));
	-- 6-to-1 LUT holding contents of column 4:
	r4: my6to1LUT generic map (data => data4)
	    port map (ILUT => ILUT, OLUT => OLUT(4));
	-- 6-to-1 LUT holding contents of column 3:
	r3: my6to1LUT generic map (data => data3)
	    port map (ILUT => ILUT, OLUT => OLUT(3));
	-- 6-to-1 LUT holding contents of column 2:
	r2: my6to1LUT generic map (data => data2)
	    port map (ILUT => ILUT, OLUT => OLUT(2));
	-- 6-to-1 LUT holding contents of column 1:
	r1: my6to1LUT generic map (data => data1)
	    port map (ILUT => ILUT, OLUT => OLUT(1));
	-- 6-to-1 LUT holding contents of column 0:
	r0: my6to1LUT generic map (data => data0)
	    port map (ILUT => ILUT, OLUT => OLUT(0));

end Behavioral;

