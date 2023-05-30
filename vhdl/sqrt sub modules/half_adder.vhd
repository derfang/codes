-- vhdl-linter-disable type-resolved

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           c : out  STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin
	sum <= a xor b;
	c <= a and b;
end Behavioral;