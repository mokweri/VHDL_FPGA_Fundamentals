---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dffe is
    Port ( d : in  STD_LOGIC;
	        clrn: in std_logic:= '1';
			  prn: in std_logic:= '1';
           clk : in  STD_LOGIC;
			  ena: in std_logic;
           q : out  STD_LOGIC);
end dffe;

architecture behaviour of dffe is

begin
	process (clk, ena, prn, clrn)
	begin
		if clrn = '0' then
			q <= '0';
		elsif prn = '0' then
			q <= '1';
		elsif (clk'event and clk='1') then
			if ena = '1' then
				q <= d;
			end if;
		end if;
	end process;

end behaviour;