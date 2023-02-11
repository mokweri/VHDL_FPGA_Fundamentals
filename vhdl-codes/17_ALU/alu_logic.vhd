---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_logic is
   generic (N: INTEGER:= 8);
	port ( 
		A, B: in std_logic_vector (N-1 downto 0);
		sel: in std_logic_vector (2 downto 0);
	    y: out std_logic_vector (N-1 downto 0));
end alu_logic;

architecture structure of alu_logic is

begin

	with sel select
			y <= not (A)   when "000",
			    not (B)   when "001",
				A and B   when "010",
				A or  B   when "011",
				A nand B  when "100",
				A nor B   when "101",
				A xor B   when "110",
				A xnor B  when "111",
				(others => '0') when others;

end structure;

