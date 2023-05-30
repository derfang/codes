-- vhdl-linter-disable type-resolved
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:12 04/01/2023
-- Design Name:   
-- Module Name:   C:/Users/ali/Desktop/cap2/sqrt/sqrt/test_bench_sqrt.vhd
-- Project Name:  sqrt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sqrt
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench_sqrt IS
END test_bench_sqrt;
 
ARCHITECTURE behavior OF test_bench_sqrt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sqrt
    PORT(
         ai : IN  std_logic_vector(16 downto 1);
         ro : OUT  std_logic_vector(16 downto 7);
         q : OUT  std_logic_vector(8 downto 1);
         nc : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ai : std_logic_vector(16 downto 1) := "0010001100000000";

 	--Outputs
   signal ro : std_logic_vector(16 downto 7);
   signal q : std_logic_vector(8 downto 1);
   signal nc : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant t_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sqrt PORT MAP (
          ai => ai,
          ro => ro,
          q => q,
          nc => nc
        );

   

END;
