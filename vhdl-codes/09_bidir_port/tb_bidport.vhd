---------------------------------------------------------------------------
-- This VHDL file was dev
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_my_bidport IS
END tb_my_bidport;
 
ARCHITECTURE behavior OF tb_my_bidport IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
	component bidport
		port (WDAT: in std_logic_vector (7 downto 0);
				RDAT: out std_logic_vector (7 downto 0);
				OE: in std_logic;
				DATA: inout std_logic_vector (7 downto 0));
	end component;
	
   -- Inputs
   signal WDAT: std_logic_vector(7 downto 0) := (others => '0');
	signal OE : std_logic := '0';

 	-- Outputs
   signal RDAT : std_logic_vector (7 downto 0);
	
	-- Buffer signals
	signal DATA: std_logic_vector (7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bidport PORT MAP (WDAT => WDAT, RDAT => RDAT, OE => OE, DATA => DATA);

   -- Stimulus process
   stim_proc: process
   begin		
	   DATA <= "ZZZZZZZZ"; -- If D is to be an output, use 'Z'      
      -- hold reset state for 100 ns.
      wait for 100 ns; 
      -- insert stimulus here 
		OE <= '0'; WDAT <= x"AF"; DATA <= "ZZZZZZZZ"; wait for 20 ns; -- If D is to be an output, use 'Z'
		OE <= '1'; DATA <= x"E6"; wait for 20 ns;
		OE <= '0'; WDAT <= x"9A"; DATA <= "ZZZZZZZZ"; wait for 20 ns; -- If D is to be an output, use 'Z'
		OE <= '1'; DATA <= x"3B"; wait for 20 ns;
		           DATA <= x"CC";
      wait;
   end process;

END;
