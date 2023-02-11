---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_pashiftreg_sclr IS
END tb_pashiftreg_sclr;
 
ARCHITECTURE behavior OF tb_pashiftreg_sclr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pashiftreg_sclr
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         din : IN  std_logic;
         E,sclr : IN  std_logic;
         s_l : IN  std_logic;
         D : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0);
         shiftout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal din : std_logic := '0';
   signal E, sclr : std_logic := '0';
   signal s_l : std_logic := '0';
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal shiftout : std_logic;

   -- Clock period definitions
   constant T : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pashiftreg_sclr PORT MAP (
          clock => clock,
          resetn => resetn,
          din => din,
          E => E, sclr => sclr,
          s_l => s_l,
          D => D,
          Q => Q,
          shiftout => shiftout
        );

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
		resetn <= '0'; wait for 100 ns;
		resetn <= '0'; wait for T*2;
		resetn <= '1';
		D <= "0000"; din <= '1'; E <= '1'; s_l <= '0'; wait for T*2;
		D <= "1101"; din <= '0'; E <= '1'; s_l <= '0'; wait for T;
		D <= "1101"; din <= '1'; E <= '1'; s_l <= '0'; wait for T*2;
		D <= "1101"; din <= '1'; E <= '0'; s_l <= '0'; wait for T;
		
		E <= '1';
		D <= "1101"; din <= '0'; s_l <= '0'; wait for T;
		D <= "1101"; din <= '1'; s_l <= '1'; wait for T;
		sclr <= '1'; wait for T; sclr <= '0';
		D <= "1001"; din <= '0'; s_l <= '0'; wait for T;
		D <= "1100";
		din <= '0'; s_l <= '1'; wait for T;
		din <= '0'; s_l <= '0'; wait for T*2;		
		din <= '1'; s_l <= '0'; wait for T;
		din <= '0'; s_l <= '1'; wait for T;
		din <= '0'; s_l <= '0'; wait for T*2;		
		wait;
      
   end process;

END;
