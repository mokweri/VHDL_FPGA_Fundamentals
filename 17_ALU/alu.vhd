---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
	generic (N: INTEGER:= 8);
	port (A, B: in std_logic_vector (N-1 downto 0);
			sel: in std_logic_vector (3 downto 0);
			y: out std_logic_vector (N-1 downto 0));
end alu;

architecture structure of alu is

	component alu_arith
		generic (N: INTEGER:= 8);
		port (A, B: in std_logic_vector (N-1 downto 0);
					sel: in std_logic_vector (2 downto 0);
					y: out std_logic_vector (N-1 downto 0));
	end component;
	
	component alu_logic
		generic (N: INTEGER:= 8);
		port ( A, B: in std_logic_vector (N-1 downto 0);
				  sel: in std_logic_vector (2 downto 0);
					 y: out std_logic_vector (N-1 downto 0));
	end component;

	signal ya, yb: std_logic_vector (N-1 downto 0);
begin


f1: alu_arith generic map (N => N)
    port map (A => A, B => B, sel => sel (2 downto 0), y => ya);
	 
f2: alu_logic generic map (N => N)
    port map (A => A, B => B, sel => sel (2 downto 0), y => yb);
	 
	 with sel(3) select
			y <= ya when '0',
			     yb when others;

end structure;

