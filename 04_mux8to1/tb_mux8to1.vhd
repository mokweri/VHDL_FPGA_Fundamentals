---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka Obed (2023).  
-- Open SOurce
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_mux8to1 IS
	generic (N: INTEGER:= 8);
END tb_mux8to1;
 
ARCHITECTURE behavior OF tb_mux8to1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8to1
    PORT(
         a,b,c,d,e,f,g,h: IN std_logic;
         y_r : OUT  std_logic;
         y_t : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '1';
   signal b : std_logic := '0';
   signal c : std_logic := '1';
   signal d : std_logic := '1';
   signal e : std_logic := '0';
   signal f : std_logic := '0';
   signal g : std_logic := '1';
   signal h : std_logic := '1';

 	--Outputs
   signal y_r : std_logic;
   signal y_t : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8to1 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
		  f => f,
          g => g,
          h => h,
          y_r => y_r,
          y_t => y_t
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		s <= "000"; wait for 20 ns;
		s <= "001"; wait for 20 ns;
		s <= "010"; wait for 20 ns;
		s <= "011"; wait for 20 ns;
		s <= "100"; wait for 20 ns;
		s <= "101"; wait for 20 ns;
		s <= "110"; wait for 20 ns;
		s <= "111"; wait for 20 ns;
      wait;
   end process;

END;
