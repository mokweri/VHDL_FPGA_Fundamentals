LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_tristate IS
END tb_tristate;
 
ARCHITECTURE behavior OF tb_tristate IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tristate
    PORT(
         A : IN  std_logic;
         OE : IN  std_logic;
         F : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal OE : std_logic := '0';

 	--Outputs
   signal F : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tristate PORT MAP (
          A => A,
          OE => OE,
          F => F
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		-- insert stimulus here 
        A <= '0'; OE <= '0'; wait for 20 ns;
		A <= '0'; OE <= '1'; wait for 20 ns;
		A <= '1'; OE <= '1'; wait for 20 ns;
		A <= '1'; OE <= '0';		
      wait;
   end process;

END;
