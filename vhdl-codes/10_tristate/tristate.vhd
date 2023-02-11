
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate is
	port (A, OE: in std_logic;
	      F : out std_logic);
end my_tristate;

architecture struct of tristate is

begin

	F <= A when OE = '1' else 'Z';

end struct;
