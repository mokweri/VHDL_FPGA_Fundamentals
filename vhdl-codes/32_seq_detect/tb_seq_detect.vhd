---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_seq_detect IS
END tb_seq_detect;
 
ARCHITECTURE behavior OF tb_seq_detect IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq_detect
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         x : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant T : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq_detect PORT MAP (
          clock => clock,
          resetn => resetn,
          x => x,
          z => z
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for T/2;
		clock <= '1';
		wait for T/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		resetn <= '0'; wait for T*10;
		resetn <= '1'; wait for T*2;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '1'; wait for T;
		x <= '0'; wait for T;
		x <= '0'; resetn <= '0';
      wait;
   end process;

END;
