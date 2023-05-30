--aurhor : DERFANG
-- 16bit Ripple Carry Adder VHDL Code
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
entity Ripple_Adder is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        Cin : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (15 downto 0);
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
signal c: std_logic_vector(15 downto 0);

begin

-- Port Mapping Full Adder 6 times
FA1 : FA port map( A(0), B(0), Cin , S(0), c(0));
FA2 : FA port map( A(1), B(1), c(0), S(1), c(1));
FA3 : FA port map( A(2), B(2), c(1), S(2), c(2));
FA4 : FA port map( A(3), B(3), c(2), S(3), c(3));
FA5 : FA port map( A(4), B(4), c(3), S(4), c(4));
FA6 : FA port map( A(5), B(5), c(4), S(5), c(5));
FA7 : FA port map( A(6), B(6), c(5), S(6), c(6));
FA8 : FA port map( A(7), B(7), c(6), S(7), c(7));
FA9 : FA port map( A(8), B(8), c(7), S(8), c(8));
FA10: FA port map( A(9), B(9), c(8), S(9), c(9));
FA11: FA port map( A(10), B(10), c(9), S(10), c(10));
FA12: FA port map( A(11), B(11), c(10), S(11), c(11));
FA13: FA port map( A(12), B(12), c(11), S(12), c(12));
FA14: FA port map( A(13), B(13), c(12), S(13), c(13));
FA15: FA port map( A(14), B(14), c(13), S(14), c(14));
FA16: FA port map( A(15), B(15), c(14), S(15), Cout);


end Behavioral;