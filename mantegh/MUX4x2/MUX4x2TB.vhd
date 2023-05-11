LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY MUX4x2TB IS
END MUX4x2TB;
 
ARCHITECTURE behavior OF MUX4x2TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4x2
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         C : IN  std_logic_vector(1 downto 0);
         D : IN  std_logic_vector(1 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         O : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');
   signal C : std_logic_vector(1 downto 0) := (others => '0');
   signal D : std_logic_vector(1 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(1 downto 0);

 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4x2 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          S => S,
          O => O
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "11";
		B <= "10";
		C <= "01";
		D <= "00";
		for i in 0 to 3 loop
			S <= std_logic_vector(to_unsigned(i,2));
			wait for 100 ns;
		end loop;
      wait;
   end process;

END;