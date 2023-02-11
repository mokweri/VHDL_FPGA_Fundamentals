---------------------------------------------------------------------------
-- This VHDL file was
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_bcd_count IS
END tb_bcd_count;
 
ARCHITECTURE behavior OF tb_bcd_count IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd_count
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         stop : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal stop : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant T: time := 20 ns;
	constant DUTY_CYCLE: real:= 0.5;
	constant OFFSET: time:= 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd_count PORT MAP (
          clock => clock,
          resetn => resetn,
          stop => stop,
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

      -- insert stimulus here 
		resetn <= '0'; wait for T*5;
		resetn <= '1'; wait for T*8;
		stop <= '1'; wait for T*4;
		stop <= '0'; wait for T*10;
		resetn <='0';
      wait;
   end process;

END;
