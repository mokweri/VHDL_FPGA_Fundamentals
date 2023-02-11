---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka Obed (2023).
-- Open Source
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity light_ctrl is
	port (SW2, SW1, SW0: in std_logic;
	      LED1, LED0: out std_logic);
end light_ctrl;

architecture struct of light_ctrl is

   signal A, B, C: std_logic;
	signal x,y,f: std_logic;

begin
   A <= SW2; B <= SW1; C <= SW0;
	
	x <= not(A) and (B xor C);
	y <= A and (not(B) and not(C));
	LED1 <= x or y;
	LED0 <= not(A) or not(B) or not(C);
	
end struct;

