---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prienc8to3 is
	port ( w: in std_logic_vector (7 downto 0);
	       y: out std_logic_vector (2 downto 0);
		   z: out std_logic);
end prienc8to3;

architecture structure of prienc8to3 is

begin

    process (w)
    begin
        if w(7) = '1' then y <= "111";
        elsif w(6) = '1' then y <= "110";
        elsif w(5) = '1' then y <= "101";
        elsif w(4) = '1' then y <= "100";
        elsif w(3) = '1' then y <= "011";
        elsif w(2) = '1' then y <= "010";
        elsif w(1) = '1' then y <= "001";
        else y <= "000";
        end if;
        if w = "00000000" then
            z <= '0';
        else
            z <= '1';
        end if;
    end process;
    
end structure;

