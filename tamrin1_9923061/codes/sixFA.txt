library ieee;
use ieee.std_logic_1164.all;
entity sixFA is
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
	B : in STD_LOGIC_VECTOR (5 downto 0);
	Cin : in STD_LOGIC_VECTOR (5 downto 0);
	S : out STD_LOGIC_VECTOR (5 downto 0);
	Cout : out STD_LOGIC_VECTOR (5 downto 0));
end sixFA;

architecture Behavioral of sixFA is

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
FA1: FA port map( A(0), B(0), Cin(0), S(0), Cout(0));
FA2: FA port map( A(1), B(1), Cin(1), S(1), Cout(1));
FA3: FA port map( A(2), B(2), Cin(2), S(2), Cout(2));
FA4: FA port map( A(3), B(3), Cin(3), S(3), Cout(3));
FA5: FA port map( A(4), B(4), Cin(4), S(4), Cout(4));
FA6: FA port map( A(5), B(5), Cin(5), S(5), Cout(5));

end Behavioral;