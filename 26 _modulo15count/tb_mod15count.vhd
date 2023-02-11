---------------------------------------------------------------------------
-- This VHDL file w
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_mod15count IS
END tb_mod15count;
 
ARCHITECTURE behavior OF tb_mod15count IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod15count
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal z : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod15count PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E,
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
		resetn <= '0';  wait for clock_period*2;
		resetn <= '1';
		E <= '1'; wait for clock_period*5;
		E <= '0';  wait for clock_period*2;
		E <= '1'; wait for clock_period*8;
		E <= '0';  wait for clock_period*5;
		E <= '1'; wait for clock_period*5;
      -- insert stimulus here 

      wait;
   end process;

END;