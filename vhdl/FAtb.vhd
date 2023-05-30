-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FAtb IS
END FAtb;
 
ARCHITECTURE behavior OF FAtb IS 
	
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         A :    IN  std_logic;
         B :    IN  std_logic;
         Cin :  IN  std_logic;
         S :    OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';
   signal S : std_logic ;
   signal Cout : std_logic ;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
            A <= '0';
            B <= '0';
            Cin <= '0';
            wait for 10 ns;

            A <= '0';
            B <= '0';
            Cin <= '1';
            wait for 10 ns;

            A <= '0';
            B <= '1';
            Cin <= '0';
            wait for 10 ns;

            A <= '0';
            B <= '1';
            Cin <= '1';
            wait for 10 ns;

            A <= '1';
            B <= '0';
            Cin <= '0';
            wait for 10 ns;

            A <= '1';
            B <= '0';
            Cin <= '1';
            wait for 10 ns;

            A <= '1';
            B <= '1';
            Cin <= '0';
            wait for 10 ns;

            A <= '1';
            B <= '1';
            Cin <= '1';
            wait for 10 ns;

       wait;
   end process;

END;
