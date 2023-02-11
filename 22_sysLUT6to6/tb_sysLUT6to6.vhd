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
 
ENTITY tb_sysLUT6to6 IS
END tb_sysLUT6to6;
 
ARCHITECTURE behavior OF tb_sysLUT6to6 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sysLUT6to6
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         OE : IN  std_logic;
         data : INOUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal OE : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sysLUT6to6 PORT MAP (
          clk => clk,
          resetn => resetn,
          OE => OE,
          data => data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      resetn <= '0'; DATA <= "ZZZZZZ"; wait for 100 ns;
		resetn <= '1'; wait for clk_period;
		
		OE <= '1'; DATA <= "110001"; wait for 2*clk_period;
		OE <= '0'; DATA <= "ZZZZZZ"; wait for 2*clk_period;
		OE <= '1'; DATA <= "100111"; wait for 2*clk_period;
		OE <= '0'; DATA <= "ZZZZZZ"; wait for 2*clk_period;
		OE <= '1'; DATA <= "000111"; wait for 2*clk_period;
		OE <= '0'; DATA <= "ZZZZZZ"; wait for 2*clk_period;
		OE <= '1'; DATA <= "100001"; wait for 2*clk_period;
		OE <= '0'; DATA <= "ZZZZZZ"; wait for 2*clk_period;
      wait for 4*clk_period;
		
		OE <= '1'; 
		lp: for i in 0 to 63 loop
				DATA <= conv_std_logic_vector(i,6); wait for clk_period;
		    end loop;
   end process;

END;
