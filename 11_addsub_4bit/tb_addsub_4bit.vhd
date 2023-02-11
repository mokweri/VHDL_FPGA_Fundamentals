---------------------------------------------------------------------------
-- This VHDL file 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_addsub_4bit IS
END tb_addsub_4bit;
 
ARCHITECTURE behavior OF tb_addsub_4bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component addsub_4bit
            port ( a,b: in std_logic_vector (3 downto 0);
                   s: in std_logic;
                   f: out std_logic_vector (3 downto 0));
    end component;

    
   --Inputs
   signal a, b : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal f : std_logic_vector(3 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub_4bit PORT MAP ( a => a, b => b, s=> s, f => f);
   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= x"5"; b <= x"6"; s <= '1'; wait for 20 ns;
		a <= x"3"; b <= x"C"; s <= '0'; wait for 20 ns;
		a <= x"F"; b <= x"8"; s <= '1'; wait for 20 ns;
		a <= x"A"; b <= x"9"; s <= '0'; wait for 20 ns;
		a <= (others => '0'); b <= (others => '0');		
		
      wait;
   end process;

END;
