--aurhor : DERFANG
-- vhdl-linter-disable 


library ieee;
use ieee.std_logic_1164.all;


entity carrymulty is 
    port (
        x: in  std_logic_vector (5 downto 0);
        y: in  std_logic_vector (5 downto 0);
        p: out std_logic_vector (11 downto 0)
    );
end entity carrymulty;

architecture rtl of carrymulty is
    component Ripple_Adder
        port ( 
            A:      in  std_logic_vector (5 downto 0);
            B:      in  std_logic_vector (5 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (5 downto 0);
           Cout:    out std_logic
        );
    end component;
	
	component sixFA
        Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
			B : in STD_LOGIC_VECTOR (5 downto 0);
			Cin : in STD_LOGIC_VECTOR (5 downto 0);
			S : out STD_LOGIC_VECTOR (5 downto 0);
			Cout : out STD_LOGIC_VECTOR (5 downto 0)
        );
    end component;
	
	
    signal G0, G1, G2 ,G3 ,G4, G5:  std_logic_vector (5 downto 0);
    signal S0, S1, S2, S3 ,S4 ,S5:  std_logic_vector (5 downto 0);
	signal C0, C1, C2, C3 ,C4 ,C5:  std_logic_vector (5 downto 0);
	signal p12 : std_logic ; --useless


begin

    G0 <= (x(5) and y(0), x(4) and y(0), x(3) and y(0), x(2) and y(0), x(1) and y(0), x(0) and y(0));
    G1 <= (x(5) and y(1), x(4) and y(1), x(3) and y(1), x(2) and y(1), x(1) and y(1), x(0) and y(1));
    G2 <= (x(5) and y(2), x(4) and y(2), x(3) and y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
    G3 <= (x(5) and y(3), x(4) and y(3), x(3) and y(3), x(2) and y(3), x(1) and y(3), x(0) and y(3));
	G4 <= (x(5) and y(4), x(4) and y(4), x(3) and y(4), x(2) and y(4), x(1) and y(4), x(0) and y(4));
	G5 <= (x(5) and y(5), x(4) and y(5), x(3) and y(5), x(2) and y(5), x(1) and y(5), x(0) and y(5));


    

cell_0: 
    sixFA 
        port map (
            A => G0,
            B => "000000",
            Cin => "000000",
			S => S0,
            Cout => C0
        );
	p(0) <= S0(0);
cell_1: 
    sixFA 
        port map (
            A => G1,
            B(5) => '0',
			B(4) => S0(5),
			B(3) => S0(4),
			B(2) => S0(3),
			B(1) => S0(2),
			B(0) => S0(1),
            Cin => C0,
			S => S1,
            Cout => C1
        );
	p(1) <= S1(0);
cell_2: 
    sixFA 
        port map (
            A => G2,
            B(5) => '0',
			B(4) => S1(5),
			B(3) => S1(4),
			B(2) => S1(3),
			B(1) => S1(2),
			B(0) => S1(1),
            Cin => C1,
			S => S2,
            Cout => C2
        );
	p(2) <= S2(0);
cell_3: 
    sixFA 
        port map (
            A => G3,
            B(5) => '0',
			B(4) => S2(5),
			B(3) => S2(4),
			B(2) => S2(3),
			B(1) => S2(2),
			B(0) => S2(1),
            Cin => C2,
			S => S3,
            Cout => C3
        );
		p(3) <= S3(0);
cell_4: 
    sixFA 
        port map (
            A => G4,
            B(5) => '0',
			B(4) => S3(5),
			B(3) => S3(4),
			B(2) => S3(3),
			B(1) => S3(2),
			B(0) => S3(1),
            Cin => C3,
			S => S4,
            Cout => C4
        );
		p(4) <= S4(0);
cell_5: 
    sixFA 
        port map (
            A => G5,
            B(5) => '0',
			B(4) => S4(5),
			B(3) => S4(4),
			B(2) => S4(3),
			B(1) => S4(2),
			B(0) => S4(1),
            Cin => C4,
			S => S5,
            Cout => C5
        );
		p(5) <= S5(0);
cell_6: 
    Ripple_Adder 
        port map (
            A => C5,
            B(5) => '0',
			B(4) => S5(5),
			B(3) => S5(4),
			B(2) => S5(3),
			B(1) => S5(2),
			B(0) => S5(1),
            Cin => '0',
			S => p(11 downto 6),
            Cout => p12 --useless
        );
end architecture rtl;