---------------------------------------------------------------------------
-- This VHDL file w
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_arbiter IS
END tb_arbiter;
 
ARCHITECTURE behavior OF tb_arbiter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component arbiter
        port (clock, resetn: in std_logic;
              r1, r2, r3: in std_logic;
              g1, g2, g3: out std_logic);
    end component;    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal r1,r2,r3 : std_logic := '0';

 	--Outputs
   signal g1,g2,g3 : std_logic;

   -- Clock period definitions
   constant T : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arbiter PORT MAP (clock => clock, resetn => resetn, r1 => r1, r2 => r2, r3 => r3, g1 => g1, g2 => g2, g3 => g3);

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
      resetn <= '0';  wait for T*2;
	  resetn <= '1';
	  
	  r1 <= '1'; wait for T;
	  r2 <= '1'; r3 <= '1'; wait for 2*T;
	  r1 <= '0'; wait for T;

	  r2 <= '1'; wait for T;
	  r1 <= '1'; r3 <= '1'; wait for 2*T;
	  r2 <= '0'; wait for T;

      r1 <= '0'; r2 <= '0'; r3 <= '1'; wait for T;
	  r1 <= '1'; r2 <= '1'; wait for 2*T;
	  r3 <= '0'; wait for T;

      r1 <= '0'; r2 <= '0'; r3 <= '0';
      wait;
   end process;

END;
