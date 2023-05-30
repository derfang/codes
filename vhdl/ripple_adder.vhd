--aurhor : DERFANG
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
entity Ripple_Adder is
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
B : in STD_LOGIC_VECTOR (5 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (5 downto 0);
Cout : out STD_LOGIC);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is

-- Full Adder VHDL Code Component Decalaration
component FA
Port (  A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end component;

-- Intermediate Carry declaration
signal c1,c2,c3,c4,c5: STD_LOGIC;

begin

-- Port Mapping Full Adder 6 times
FA1: FA port map( A(0), B(0), Cin, S(0), c1);
FA2: FA port map( A(1), B(1), c1, S(1), c2);
FA3: FA port map( A(2), B(2), c2, S(2), c3);
FA4: FA port map( A(3), B(3), c3, S(3), c4);
FA5: FA port map( A(4), B(4), c4, S(4), c5);
FA6: FA port map( A(5), B(5), c5, S(5), Cout);

end Behavioral;