---------------------------------------------------------------------------
-- This VHDL fil
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_maj_gate IS
	generic (N: INTEGER:= 8);
END tb_maj_gate;
 
ARCHITECTURE behavior OF tb_maj_gate IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maj_gate
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         C : IN  std_logic_vector(N-1 downto 0);
         f : OUT  std_logic_vector(N-1 downto 0);
         y_err : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');
   signal C : std_logic_vector(N-1 downto 0) := (others => '0');

 	--Outputs
   signal f : std_logic_vector(N-1 downto 0);
   signal y_err : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maj_gate PORT MAP (
          A => A,
          B => B,
          C => C,
          f => f,
          y_err => y_err
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A <= x"13"; B <= x"13"; C <=x"09"; wait for 20 ns;
		A <= x"45"; B <= x"B3"; C <=x"B3"; wait for 20 ns;
		A <= x"AF"; B <= x"08"; C <=x"AF"; wait for 20 ns;
		A <= x"BE"; B <= x"BA"; C <=x"09"; wait for 20 ns;
		A <= x"00"; B <= x"00"; C <=x"00"; wait for 20 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
