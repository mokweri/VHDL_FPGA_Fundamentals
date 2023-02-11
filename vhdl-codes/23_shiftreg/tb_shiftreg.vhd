---------------------------------------------------------------------------
-- This VHDL file---------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_shiftreg IS
	generic (N: INTEGER:= 8);
END tb_shiftreg;
 
ARCHITECTURE behavior OF tb_shiftreg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shiftreg
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         shiftin : IN  std_logic;
         E : IN  std_logic;
         Q : OUT  std_logic_vector(N-1 downto 0);
         shiftout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal shiftin : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(N-1 downto 0);
   signal shiftout : std_logic;

   -- Clock period definitions
   constant T: time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shiftreg PORT MAP (
          clock => clock,
          resetn => resetn,
          shiftin => shiftin,
          E => E,
          Q => Q,
          shiftout => shiftout
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

      wait for T*10;

      -- insert stimulus here 
		resetn <= '0'; wait for 2*T;
		resetn <= '1'; E <= '1';
		shiftin <= '1'; wait for T;
		shiftin <= '0'; wait for T;
		shiftin <= '1'; wait for T;
		shiftin <= '0'; wait for T;
		
      wait;
   end process;

END;
