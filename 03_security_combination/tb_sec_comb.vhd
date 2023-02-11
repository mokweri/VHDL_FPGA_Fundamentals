---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2013).  It may be
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
 
ENTITY tb_sec_comb IS
END tb_sec_comb;
 
ARCHITECTURE behavior OF tb_sec_comb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sec_comb
    PORT(
         SW : IN  std_logic_vector(7 downto 0);
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SW : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sec_comb PORT MAP (
          SW => SW,
          LED => LED
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 	
		-- Here, we create all the cases		
		wb: for j in 0 to 256-1 loop		 
		       SW <= conv_std_logic_vector(j,8); wait for 20 ns;							  
		  	 end loop wb;
			
      wait;
   end process;

END;
