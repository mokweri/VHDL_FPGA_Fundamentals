---------------------------------------------------------------------------
-- This VHDL fi
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This circuit detects whether an N-bit signal is made of ones or zeros.
entity zeros_ones_detector is
	generic (N: INTEGER:= 8);
		port ( in_data: in std_logic_vector(N-1 downto 0);
				 all_zeros, all_ones: out std_logic);
end zeros_ones_detector;

architecture behaviour of zeros_ones_detector is
		
begin

	process(in_data)
		variable result_and, result_or: std_logic;
	begin
		result_and:= '1'; result_or := '0';
		for i in in_data'range loop -- 'range: iterates through all the bits in 'in_data'.
			result_and:= result_and and in_data(i);
			result_or:= result_or or in_data(i);
		end loop;
	
		all_zeros <= not(result_or);
		all_ones <= result_and;
	end process;
	
end behaviour;
