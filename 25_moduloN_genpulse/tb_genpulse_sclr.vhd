---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.math_real.log2;
use ieee.math_real.ceil;
  
ENTITY tb_genpulse_sclr IS
	generic (COUNT: INTEGER:= (10**2)/2); -- (10**2)/2 cycles of T = 10 ns --> 0.5 us
END tb_genpulse_sclr;
 
ARCHITECTURE behavior OF tb_genpulse_sclr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT genpulse_sclr
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E, sclr : IN  std_logic;
         Q: out std_logic_vector ( integer(ceil(log2(real(COUNT)))) - 1 downto 0);
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E, sclr : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector ( integer(ceil(log2(real(COUNT)))) - 1 downto 0);
   signal z : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: genpulse_sclr PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E, sclr => sclr,
          Q => Q,
          z => z
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here
		resetn <= '1'; E <= '1';
		wait for 20*clock_period; E <= '0';
		wait for clock_period; E <= '1';
		
		wait for 20*clock_period;
		sclr <= '1'; wait for clock_period;
		sclr <= '0';

      wait;
   end process;

END;
