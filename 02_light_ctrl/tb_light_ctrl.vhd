---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka Obed (2023).
-- Open Source
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_light_ctrl IS
END tb_light_ctrl;
 
ARCHITECTURE behavior OF tb_light_ctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT light_ctrl
    PORT(
         SW2 : IN  std_logic;
         SW1 : IN  std_logic;
         SW0 : IN  std_logic;
         LED1 : OUT  std_logic;
         LED0 : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal SW2 : std_logic := '0';
   signal SW1 : std_logic := '0';
   signal SW0 : std_logic := '0';

 	--Outputs
   signal LED1 : std_logic;
   signal LED0 : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: light_ctrl PORT MAP (
          SW2 => SW2,
          SW1 => SW1,
          SW0 => SW0,
          LED1 => LED1,
          LED0 => LED0
        );
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here. 
		SW2 <= '0'; SW1 <= '0'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '0'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '1'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '1'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '0'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '0'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '1'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '1'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '0'; SW0 <= '0';
      wait;
   end process;

END;
