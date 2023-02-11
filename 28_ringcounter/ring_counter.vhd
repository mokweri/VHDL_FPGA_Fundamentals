---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ring_counter is
	generic (N: INTEGER:= 8);
	port (
		clock, startn: in std_logic;
		E: in std_logic;
	    Q: out std_logic_vector (N-1 downto 0));
end ring_counter;

architecture Behavioral of ring_counter is

	component dffe is
		 Port ( d : in  STD_LOGIC;
				clrn: in std_logic:= '1';
				prn: in std_logic:= '1';
				clk : in  STD_LOGIC;
				ena: in std_logic;
				q : out  STD_LOGIC);
	end component;

	signal Qt: std_logic_vector (N-1 downto 0);
	
begin

	fa: dffe port map (d => Qt(0), clrn => '1', prn => startn, clk => clock, ena => E, q => Qt(N-1));
	
	gi: for i in N-2 downto 0 generate
				fi: dffe port map (d => Qt(i+1), clrn => startn, prn => '1', clk => clock, ena => E, q => Qt(i));
		 end generate;
	Q <= Qt;
end Behavioral;

