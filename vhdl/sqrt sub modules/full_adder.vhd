-- vhdl-linter-disable type-resolved

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity full_adder is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
component half_adder is
port(		a : in  STD_LOGIC;
         b : in  STD_LOGIC;
         sum : out  STD_LOGIC;
         c : out  STD_LOGIC );
end component;
signal s0,s1,s2 : std_logic;
begin

half_adder_ins0 : half_adder port map (a => i0 , b => i1 , sum => s0 , c => s1);
half_adder_ins1 : half_adder port map (a => s0 , b => cin , sum => sum , c => s2);
cout <= s1 or s2;


end Behavioral;

