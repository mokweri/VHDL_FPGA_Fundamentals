---------------------------------------------------------------------------
-- This VHDL file was developed b
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_johnson_counter IS
    generic (N: INTEGER:= 8);
END tb_johnson_counter;
 
ARCHITECTURE behavior OF tb_johnson_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT johnson_counter
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E : IN  std_logic;
         Q : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant T: time := 10 ns;
 	constant DUTY_CYCLE: real:= 0.5;
	constant OFFSET: time:= 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: johnson_counter PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		wait for OFFSET;
		clock_loop: loop
			clock <= '0'; wait for (T - (T*DUTY_CYCLE));
			clock <= '1'; wait for (T*DUTY_CYCLE);
		end loop clock_loop;
   end process; 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for OFFSET;
      wait for T*5;
      -- insert stimulus here 
		resetn <= '0'; wait for T*2;
		resetn <= '1'; E <= '1'; wait for T*20;
		E <= '0'; wait for T*2;
		E <= '1'; wait for T*16;
		resetn <= '0'; wait for T;
		resetn <= '1';

      wait;
   end process;

END;
