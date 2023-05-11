--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:24:30 03/09/2023
-- Design Name:   
-- Module Name:   C:/Users/erfan/Desktop/temp/mantegh/2/simplemulty/simplemulty-tb.vhd
-- Project Name:  simplemulty
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multy
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY carrymultytb IS
END carrymultytb;
 
ARCHITECTURE behavior OF carrymultytb IS 
	function to_string (inp: std_logic_vector) return string is
        variable image_str: string (1 to inp'length);
        alias input_str:  std_logic_vector (1 to inp'length) is inp;
    begin
        for i in input_str'range loop
            image_str(i) := character'VALUE(std_ulogic'IMAGE(input_str(i)));
        end loop;
        return image_str;
    end function;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carrymulty
    PORT(
         x : IN  std_logic_vector(5 downto 0);
         y : IN  std_logic_vector(5 downto 0);
         p : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(5 downto 0) := (others => '0');
   signal y : std_logic_vector(5 downto 0) := (others => '0');
	signal correctANS:      std_logic_vector (11 downto 0);

 	--Outputs
   signal p : std_logic_vector(11 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carrymulty PORT MAP (
          x => x,
          y => y,
          p => p
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
	 for i in 0 to 63 loop
            x <= std_logic_vector(to_unsigned(i, x'length));
            for j in 0 to 63 loop
                y <= std_logic_vector(to_unsigned(j, y'length));
                wait for 0 ns; -- assignments take effect
                correctANS <= std_logic_vector(unsigned (x) * unsigned(y));
                wait for 10 ns;
                if p /= correctANS then
                    report "multy error";
                    report HT & "expected " & to_string (correctANS);
                    report HT & "got      " & to_string (p);
                end if;
            end loop;
        end loop;
      wait;
   end process;

END;
