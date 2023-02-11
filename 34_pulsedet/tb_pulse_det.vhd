---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_pulse_det IS
END tb_pulse_det;
 
ARCHITECTURE behavior OF tb_pulse_det IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component pulse_det
        port (clock, resetn: in std_logic;
              x: in std_logic;
              z: out std_logic);
    end component; 

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant T : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_det PORT MAP (clock => clock, resetn => resetn, x => x, z => z);

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
	  
	  x <= '0'; wait for 2*T;
	  x <= '1'; wait for 10*T;
	  x <= '0'; wait for 2*T;
	  
	  resetn <= '0'; wait for T;
	  resetn <= '1';
	  
	  x <= '1'; wait for 5*T;
	  x <= '0'; wait for T;
	  x <= '1'; wait for T;
	  x <= '0';
	  wait;
   end process;

END;
