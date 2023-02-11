---------------------------------------------------------------------------
-- This VHDL file was developed by Mogaka Obed (2023).
--------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_4to1LUT IS
END tb_4to1LUT;
 
ARCHITECTURE behavior OF tb_4to1LUT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my4to1LUT
    PORT(
         ILUT : IN  std_logic_vector(3 downto 0);
         OLUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ILUT : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OLUT : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my4to1LUT PORT MAP (
          ILUT => ILUT,
          OLUT => OLUT
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 
		ILUT <= x"0"; wait for 20 ns;
		ILUT <= x"1"; wait for 20 ns;
		ILUT <= x"2"; wait for 20 ns;
		ILUT <= x"3"; wait for 20 ns;
		ILUT <= x"4"; wait for 20 ns;
		ILUT <= x"5"; wait for 20 ns;
		ILUT <= x"6"; wait for 20 ns;
		ILUT <= x"7"; wait for 20 ns;
		ILUT <= x"8"; wait for 20 ns;
		ILUT <= x"9"; wait for 20 ns;
		ILUT <= x"A"; wait for 20 ns;
		ILUT <= x"B"; wait for 20 ns;
		ILUT <= x"C"; wait for 20 ns;
		ILUT <= x"D"; wait for 20 ns;
		ILUT <= x"E"; wait for 20 ns;
		ILUT <= x"F"; wait for 20 ns;
      wait;
   end process;

END;
