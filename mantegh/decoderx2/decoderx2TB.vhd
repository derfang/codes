LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY decoderx2TB IS
END decoderx2TB;
 
ARCHITECTURE behavior OF decoderx2TB IS 
 
 
    COMPONENT decoderx2
    PORT(
         In1 : IN  std_logic_vector(1 downto 0);
         In2 : IN  std_logic_vector(2 downto 0);
         O1 : OUT  std_logic_vector(3 downto 0);
         O2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic_vector(1 downto 0) := (others => '0');
   signal In2 : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O1 : std_logic_vector(3 downto 0);
   signal O2 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoderx2 PORT MAP (
          In1 => In1,
          In2 => In2,
          O1 => O1,
          O2 => O2
        );



   -- Stimulus process
   stim_proc: process
   begin		
		for i in 0 to 3 loop 
			
			in1 <=std_logic_vector(to_unsigned(i,2));
			wait for 10 ns;
		end loop;
		
		for j in 0 to 7 loop 
			
			in2 <=std_logic_vector(to_unsigned(j,3));
			wait for 10 ns;
		end loop;

      wait;
   end process;

END;
