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

entity sysLUT6to6 is
	generic (data5: std_logic_vector(63 downto 0):=x"ffffffc000000000";  -- column 5
				data4: std_logic_vector(63 downto 0):=x"fc00003ffffc0000";  -- column 4
				data3: std_logic_vector(63 downto 0):=x"03ff003ff003ff00";  -- column 3
				data2: std_logic_vector(63 downto 0):=x"83e0f83e0f83e0f0";  -- column 2
				data1: std_logic_vector(63 downto 0):=x"639ce739ce7398cc";  -- column 1
				data0: std_logic_vector(63 downto 0):=x"5a5296b5ad6a56aa"); -- column 0
	port (clk, resetn, OE: in std_logic;
			data: inout std_logic_vector (5 downto 0));
end sysLUT6to6;

architecture structure of sysLUT6to6 is

	component my_rege
		generic (N: INTEGER:= 4);
		port ( clock, resetn: in std_logic;
				 E, sclr: in std_logic; -- sclr: Synchronous clear
				 D: in std_logic_vector (N-1 downto 0);
				 Q: out std_logic_vector (N-1 downto 0));
	end component;

	component my6to6LUT
		generic (data5: std_logic_vector(63 downto 0):=x"FEAB97CA003E19CC";  -- column 5
					data4: std_logic_vector(63 downto 0):=x"AABBCCFFEE99098A";  -- column 4
					data3: std_logic_vector(63 downto 0):=x"E595BEBECAFEDADA";  -- column 3
					data2: std_logic_vector(63 downto 0):=x"FACE09093E3EECAB";  -- column 2
					data1: std_logic_vector(63 downto 0):=x"DECAFFFF09EA3200";  -- column 1
					data0: std_logic_vector(63 downto 0):=x"ACADE412BAFE125E"); -- column 0
		port ( ILUT: in std_logic_vector (5 downto 0);
				 OLUT: out std_logic_vector (5 downto 0));
	end component;

	signal DI, DO, QR: std_logic_vector (5 downto 0);
	
begin

ri: my_rege generic map (N => 6)
	 port map (clock => clk, resetn => resetn, E => OE, sclr => '0', D => DI, Q => QR);

LUT6to6: my6to6LUT generic map (data5 => data5, data4 => data4, data3 => data3, data2 => data2, data1 => data1, data0 => data0)
         port map (ILUT => QR, OLUT => DO);
			
DATA <= DO when OE = '0' else (others => 'Z');
DI <= DATA when OE = '1' else (others => 'Z');			

end structure;
