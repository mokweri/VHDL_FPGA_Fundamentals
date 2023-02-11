---------------------------------------------------------------------------
-- This VHDL file
--------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Flip flop with asynchronous inputs clrn and prn (both active low)
--  as well as synchronous enable and clear (both active high)
-- E = '1', sclr = '0' --> Input data 'D' is copied on Q
-- E = '1', sclr = '1' --> Q is cleared (0)
entity dffes is
    Port ( d : in  STD_LOGIC;
	        clrn: in std_logic:= '1';
			  prn: in std_logic:= '1';
           clk : in  STD_LOGIC;
			  ena: in std_logic;
			  sclr: in std_logic;
           q : out  STD_LOGIC);
end dffes;

architecture behaviour of dffes is

begin
	process (clk, ena, prn, clrn)
	begin
		if clrn = '0' then
			q <= '0';
		elsif prn = '0' then
			q <= '1';
		elsif (clk'event and clk='1') then
			if ena = '1' then
			    if sclr = '1' then
			         q <= '0';
			    else
			         q <= d;
			    end if;
			end if;
		end if;
	end process;

end behaviour;