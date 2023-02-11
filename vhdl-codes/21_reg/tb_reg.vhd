---------------------------------------------------------------------------
-- This VHDL fi
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_reg IS
   generic (N: INTEGER:= 4); -- this should match the one in the design code.
END tb_reg;
 
ARCHITECTURE behavior OF tb_reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         E : IN  std_logic;
         sclr : IN  std_logic;
         D : IN  std_logic_vector(N-1 downto 0);
         Q : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal E : std_logic := '0';
   signal sclr : std_logic := '0';
   signal D : std_logic_vector(N-1 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg PORT MAP (
          clock => clock,
          resetn => resetn,
          E => E,
          sclr => sclr,
          D => D,
          Q => Q
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

      wait for clock_period*10; resetn <= '1';

      -- insert stimulus here (this only works for N=4)
		D <= "1010"; E <= '1'; wait for clock_period;
		D <= "----"; E <= '0'; wait for clock_period*5;
		D <= "0111"; E <= '1'; wait for clock_period;
		D <= "----"; E <= '1'; sclr <= '1'; wait for clock_period*5;
		
      wait;
   end process;

END;
