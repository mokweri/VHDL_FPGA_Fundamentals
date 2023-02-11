---------------------------------------------------------------------------
-- This VHDL file w
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_zeros_ones_detector IS
	generic (N: INTEGER:= 8);
END tb_zeros_ones_detector;
 
ARCHITECTURE behavior OF tb_zeros_ones_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zeros_ones_detector
    PORT(
         in_data : IN  std_logic_vector(N-1 downto 0);
         all_zeros : OUT  std_logic;
         all_ones : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal in_data : std_logic_vector(N-1 downto 0) := (others => '0');

 	--Outputs
   signal all_zeros : std_logic;
   signal all_ones : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zeros_ones_detector PORT MAP (
          in_data => in_data,
          all_zeros => all_zeros,
          all_ones => all_ones
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		in_data <= x"FA"; wait for 20 ns;
		in_data <= x"FF"; wait for 20 ns;
		in_data <= x"00"; wait for 20 ns;
		in_data <= x"AB"; wait for 20 ns;
		in_data <= x"CD"; wait for 20 ns;
		in_data <= x"BE"; wait for 20 ns;
		in_data <= x"CA"; wait for 20 ns;

      wait;
   end process;

END;
