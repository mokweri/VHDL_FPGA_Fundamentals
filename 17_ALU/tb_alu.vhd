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
 
ENTITY tb_my_alu IS
	generic (N: INTEGER:= 8);
END tb_my_alu;
 
ARCHITECTURE behavior OF tb_my_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_alu
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         sel : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(N-1 downto 0);
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_alu PORT MAP (
          A => A,
          B => B,
          sel => sel,
          y => y
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		sel <= "0000"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0001"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0010"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0011"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0100"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0101"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0110"; A <= x"20"; B <= x"32"; wait for 20 ns;
		sel <= "0111"; A <= x"20"; B <= x"32"; wait for 20 ns;
		sel <= "1000"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "1001"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "1010"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "1011"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "1100"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "1101"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0110"; A <= x"34"; B <= x"AE"; wait for 20 ns;
		sel <= "0111"; A <= x"34"; B <= x"AE"; wait for 20 ns;
      wait;
   end process;

END;
