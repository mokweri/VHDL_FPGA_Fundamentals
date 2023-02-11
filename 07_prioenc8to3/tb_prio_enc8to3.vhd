---------------------------------------------------------------------------
-- This VHDL f
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_prio_enc8to3 IS
END tb_prio_enc8to3;
 
ARCHITECTURE behavior OF tb_prio_enc8to3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prio_enc8to3
    PORT(
         w : IN  std_logic_vector(7 downto 0);
         y : OUT  std_logic_vector(2 downto 0);
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal w : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(2 downto 0);
   signal z : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prio_enc8to3 PORT MAP (
          w => w,
          y => y,
          z => z
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
      w <= x"56"; wait for 20 ns;
		w <= x"00"; wait for 20 ns;
		w <= x"43"; wait for 20 ns;
		w <= x"10"; wait for 20 ns;
		w <= x"80"; wait for 20 ns;
		w <= x"40"; wait for 20 ns;
		w <= x"FF"; wait for 20 ns;
		w <= x"78"; wait for 20 ns;
		w <= x"98"; wait for 20 ns;
		w <= x"A3"; wait for 20 ns;
		w <= x"0C"; wait for 20 ns;
		w <= x"00";
		
      wait;
   end process;

END;
