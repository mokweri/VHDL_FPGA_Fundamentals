---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka obed(2023)
--- OpenSource
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_example IS
END tb_example;
 
ARCHITECTURE behavior OF tb_example IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_gates
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         f : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';

 	--Outputs
   signal f : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_gates PORT MAP (
          a => a,
          b => b,
          c => c,
          f => f
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		A <= '0'; B <= '0'; C <= '0'; wait for 20 ns;
		A <= '0'; B <= '0'; C <= '1'; wait for 20 ns;
		A <= '0'; B <= '1'; C <= '0'; wait for 20 ns;
		A <= '0'; B <= '1'; C <= '1'; wait for 20 ns;
		A <= '1'; B <= '0'; C <= '0'; wait for 20 ns;
		A <= '1'; B <= '0'; C <= '1'; wait for 20 ns;
		A <= '1'; B <= '1'; C <= '0'; wait for 20 ns;
		A <= '1'; B <= '1'; C <= '1'; wait for 20 ns;
		A <= '0'; B <= '0'; C <= '0'; 
      wait;
   end process;

END;
