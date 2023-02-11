---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_counter is
	generic (N: INTEGER:= 8);
	port (clock, resetn: in std_logic;
		  E: in std_logic;
	      Q: out std_logic_vector (N-1 downto 0));
end johnson_counter;

architecture Behavioral of johnson_counter is

	component dffe is
		 Port ( d : in  STD_LOGIC;
				  clrn: in std_logic:= '1';
				  prn: in std_logic:= '1';
				  clk : in  STD_LOGIC;
				  ena: in std_logic;
				  q : out  STD_LOGIC);
	end component;

	signal Qt: std_logic_vector (N-1 downto 0);
	signal nQLSB: std_logic;
	
begin

	fa: dffe port map (d => nQLSB, clrn => resetn, prn => '1', clk => clock, ena => E, q => Qt(N-1));
	nQLSB <= not (Qt(0));
	
	gi: for i in N-2 downto 0 generate
				fi: dffe port map (d => Qt(i+1), clrn => resetn, prn => '1', clk => clock, ena => E, q => Qt(i));
		 end generate;
	Q <= Qt;
end Behavioral;

