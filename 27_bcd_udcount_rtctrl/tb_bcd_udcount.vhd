---------------------------------------------------------------------------
-- This VHDL file was 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_bcd_udcount IS
END tb_bcd_udcount;
 
ARCHITECTURE behavior OF tb_bcd_udcount IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd_udcount
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E : IN  std_logic;
         ud : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E : std_logic := '0';
   signal ud : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant T: time := 20 ns;
 	constant DUTY_CYCLE: real:= 0.5;
	constant OFFSET: time:= 100 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd_udcount PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E,
          ud => ud,
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

      resetn <= '0'; wait for T*5;
      -- insert stimulus here 
		resetn <= '1';
		E <= '1'; ud <= '1'; wait for T*20;
		E <= '1'; ud <= '0'; wait for T*20;
		E <= '1'; ud <= '1'; wait for T*5;
		E <= '0'; wait for T*2;
		E <= '1'; ud <= '1';

      wait;
   end process;

END;
