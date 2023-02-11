---------------------------------------------------------------------------
-- This VHDL file w
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ledseq IS
END tb_ledseq;
 
ARCHITECTURE behavior OF tb_ledseq IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ledseq
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E : IN  std_logic;
         DO : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal DO : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ledseq PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E,
          DO => DO
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
		E <= '1'; wait for clock_period*3;
		E <= '0'; wait for clock_period*2;
		E <= '1'; wait for clock_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
