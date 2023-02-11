---------------------------------------------------------------------------
-- This VHDL file
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bidport is
	port (WDAT: in std_logic_vector (7 downto 0);
		  RDAT: out std_logic_vector (7 downto 0);
		  OE: in std_logic;
	      DATA: inout std_logic_vector (7 downto 0));
end bidport;

architecture struct of bidport is
   
begin

-- Pin D as an output:
	DATA <= WDAT when OE = '0' else (others => 'Z');
-- Pin D as an input:
   RDAT <= DATA when OE = '1' else (others => 'Z');
	
end struct;

