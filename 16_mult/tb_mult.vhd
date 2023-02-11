---------------------------------------------------------------------------
-- This VHDL file
--------------------------------------------------------------------------


-- Simulated for N=4 and N=8
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

ENTITY tb_mult IS
	generic (N: INTEGER:= 4);
END tb_mult;
 
ARCHITECTURE behavior OF tb_mult IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         P : OUT  std_logic_vector(2*N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(2*N-1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	-- Vivado: if 'generic map' is used here, it works, but only at Synthesis
	--         It is better to change the parameter both in testbench and in design code
   uut: mult PORT MAP (
          A => A,
          B => B,
          P => P
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 
		A <= conv_std_logic_vector(3,N);  B <= conv_std_logic_vector (15,N); wait for 20 ns;
		A <= conv_std_logic_vector(14,N); B <= conv_std_logic_vector (10,N); wait for 20 ns;
		A <= conv_std_logic_vector(10,N); B <= conv_std_logic_vector (15,N); wait for 20 ns;
		A <= conv_std_logic_vector(8,N);  B <= conv_std_logic_vector (13,N); wait for 20 ns;
		A <= conv_std_logic_vector(10,N); B <= conv_std_logic_vector (12,N); wait for 20 ns;
		A <= conv_std_logic_vector(2**N -1,N); B <= conv_std_logic_vector (2**N -1,N); wait for 20 ns;
		A <= conv_std_logic_vector(0,N); B <= conv_std_logic_vector (0,N); wait for 20 ns;
		
      wait;
   end process;

END;
