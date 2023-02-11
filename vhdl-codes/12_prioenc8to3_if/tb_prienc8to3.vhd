---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2017).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_myprienc8to3 IS
END tb_myprienc8to3;
 
ARCHITECTURE behavior OF tb_myprienc8to3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myprienc8to3
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
   uut: myprienc8to3 PORT MAP (
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
