---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_2bitcounter IS
END tb_2bitcounter;
 
ARCHITECTURE behavior OF tb_2bitcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT bitcounter_2bit
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         q : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant T : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bitcounter_2bit PORT MAP (
          clock => clock,
          resetn => resetn,
          q => q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0'; wait for T/2;
		clock <= '1'; wait for T/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      resetn <= '0'; wait for T*10;
		
      -- insert stimulus here 
		resetn <= '1'; wait for T*18;
		resetn <= '0';

      wait;
   end process;

END;
