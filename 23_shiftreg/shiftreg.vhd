---------------------------------------------------------------------------
-- This VHDL file wa
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- N-bit Shift register:
-- DIR = "LEFT" --> Shift to the left: from LSB to MSB
-- DIR = "RIGHT" --> Shift to the right: from MSB to LSB
entity shiftreg is
   generic (N: INTEGER:= 8;
	        DIR: STRING:= "RIGHT"); -- only "LEFT", "RIGHT" are supported
	port ( 
		clock, resetn: in std_logic;
	    shiftin, E: in std_logic;
	    Q: out std_logic_vector (N-1 downto 0);
        shiftout: out std_logic);
end shiftreg;

architecture Behavioral of shiftreg is

	signal Qt: std_logic_vector (N-1 downto 0);
	
begin

a0: assert (DIR = "LEFT" or DIR = "RIGHT")
    report "DIR can only be LEFT or RIGHT"
	 severity error;
	 
	process (resetn, clock)
	begin
		if resetn = '0' then
			Qt <= (others => '0');
		elsif (clock'event and clock = '1') then
			if E = '1' then
				if DIR = "LEFT" then
					Qt(0) <= shiftin;
					for i in 1 to N-1 loop
						Qt(i) <= Qt(i-1);
					end loop;
				elsif DIR = "RIGHT" then
					Qt(N-1) <= shiftin;
					for i in 0 to N-2 loop
						Qt(i) <= Qt(i+1);
					end loop;
				end if;
			end if;
		end if;
		
	end process;

	Q <= Qt;
	
	gl: if DIR = "LEFT" generate
			 shiftout <= Qt(N-1);
		 end generate;
	gr: if DIR = "RIGHT" generate
			 shiftout <= Qt(0);
		 end generate;
		 
end Behavioral;
