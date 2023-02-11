---------------------------------------------------------------------------
-- This VHDL file was de.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;
use ieee.math_real.ceil;

-- ud = 0 --> Q <= Q - 1
-- ud = 1 --> Q <= Q + 1
entity bcd_udcount_top is
	port ( clock, resetn, E, ud: in std_logic;
		   Q: out std_logic_vector (3 downto 0));
end bcd_udcount_top;

architecture Behavioral of bcd_udcount_top is
    component genpulse_sclr
        --generic (COUNT: INTEGER:= (10**8)/2); -- (10**8)/2 cycles of T = 10 ns --> 0.5 s
        generic (COUNT: INTEGER:= (10**2)/2); -- (10**2)/2 cycles of T = 10 ns --> 0.5us
        port (clock, resetn, E, sclr: in std_logic;
                Q: out std_logic_vector ( integer(ceil(log2(real(COUNT)))) - 1 downto 0);
                z: out std_logic);
    end component;
    
    component bcd_udcount
        port ( clock, resetn, E, ud: in std_logic;
               Q: out std_logic_vector (3 downto 0));
    end component;
    
    signal z: std_logic;
    
begin

-- a1: my_genpulse_sclr generic map (COUNT => 10) -- For simulation purposes
   a1: genpulse_sclr generic map (COUNT => (10**8)/2) -- For actual testing: 0.5 seconds
       port map (clock => clock, resetn => resetn, E => E, sclr => '0', z => z);
   a2: bcd_udcount port map (clock =>  clock, resetn => resetn, E => z , ud => ud, Q => Q);

end Behavioral;

