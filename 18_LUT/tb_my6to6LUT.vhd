---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2014).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

ENTITY tb_my6to6LUT IS
END tb_my6to6LUT;
 
ARCHITECTURE behavior OF tb_my6to6LUT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my6to6LUT
    PORT(
         ILUT : IN  std_logic_vector(5 downto 0);
         OLUT : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ILUT : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OLUT : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my6to6LUT PORT MAP (ILUT => ILUT, OLUT => OLUT);

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		lp: for i in 0 to 63 loop
				 ILUT <= conv_std_logic_vector(i,6); wait for 20 ns;
		    end loop;
      wait;
   end process;

END;
