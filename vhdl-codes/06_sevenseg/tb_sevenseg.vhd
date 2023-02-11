---------------------------------------------------------------------------
-- This VHDL file was developed 
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_sevenseg IS
END tb_sevenseg;
 
ARCHITECTURE behavior OF tb_sevenseg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sevenseg
    PORT(
         bcd : IN  std_logic_vector(3 downto 0);
         sevseg : OUT  std_logic_vector(6 downto 0);
         EN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sevseg : std_logic_vector(6 downto 0);
   signal EN : std_logic_vector(3 downto 0);
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sevenseg PORT MAP (
          bcd => bcd,
          sevseg => sevseg,
          EN => EN
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		bcd <= "0000"; wait for 20 ns;
		bcd <= "0001"; wait for 20 ns;
		bcd <= "0010"; wait for 20 ns;
		bcd <= "0011"; wait for 20 ns;
		bcd <= "0100"; wait for 20 ns;
		bcd <= "0101"; wait for 20 ns;
		bcd <= "0110"; wait for 20 ns;
		bcd <= "0111"; wait for 20 ns;
		bcd <= "1000"; wait for 20 ns;
		bcd <= "1001"; wait for 20 ns;
		bcd <= "0000";

      wait;
   end process;

END;
