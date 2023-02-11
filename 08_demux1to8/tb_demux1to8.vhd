---------------------------------------------------------------------------
-- This VHDL file was de
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_demux1to8 IS
END tb_demux1to8;
 
ARCHITECTURE behavior OF tb_mydemux1to8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component demux1to8
        port ( s: in std_logic_vector (2 downto 0);
               x: in std_logic;
               y: out std_logic_vector (7 downto 0));
    end component;
    
   -- Inputs
   signal s : std_logic_vector(2 downto 0):= (others => '0');
   signal x : std_logic:='0';

   -- Outputs
   signal y : std_logic_vector(7 downto 0);
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux1to8 PORT MAP ( s => s, x => x, y => y );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		s <= "000"; x <= '0'; wait for 20 ns;
		s <= "000"; x <= '1'; wait for 20 ns;
		s <= "001"; x <= '0'; wait for 20 ns;
		s <= "001"; x <= '1'; wait for 20 ns;
		s <= "010"; x <= '0'; wait for 20 ns;
		s <= "010"; x <= '1'; wait for 20 ns;
		s <= "011"; x <= '0'; wait for 20 ns;
		s <= "011"; x <= '1'; wait for 20 ns;
		s <= "100"; x <= '0'; wait for 20 ns;
        s <= "100"; x <= '1'; wait for 20 ns;
		s <= "101"; x <= '0'; wait for 20 ns;
        s <= "101"; x <= '1'; wait for 20 ns;
		s <= "110"; x <= '0'; wait for 20 ns;
        s <= "110"; x <= '1'; wait for 20 ns;        
		s <= "111"; x <= '0'; wait for 20 ns;
        s <= "111"; x <= '1'; wait for 20 ns;
        s <= "000"; x <= '0';
        wait;
   end process;

END;
