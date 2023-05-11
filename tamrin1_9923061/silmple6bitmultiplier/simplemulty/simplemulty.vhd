library ieee;
use ieee.std_logic_1164.all;


entity multy is 
    port (
        x: in  std_logic_vector (5 downto 0);
        y: in  std_logic_vector (5 downto 0);
        p: out std_logic_vector (11 downto 0)
    );
end entity multy;

architecture rtl of multy is
    component Ripple_Adder
        port ( 
            A:      in  std_logic_vector (5 downto 0);
            B:      in  std_logic_vector (5 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (5 downto 0);
           Cout:    out std_logic
        );
    end component;
    signal G0, G1, G2 ,G3 ,G4:  std_logic_vector (5 downto 0);
    signal B0, B1, B2, B3 ,B4:  std_logic_vector (5 downto 0);

begin

    
    G0 <= (x(5) and y(1), x(4) and y(1), x(3) and y(1), x(2) and y(1), x(1) and y(1), x(0) and y(1));
    G1 <= (x(5) and y(2), x(4) and y(2), x(3) and y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
    G2 <= (x(5) and y(3), x(4) and y(3), x(3) and y(3), x(2) and y(3), x(1) and y(3), x(0) and y(3));
	G3 <= (x(5) and y(4), x(4) and y(4), x(3) and y(4), x(2) and y(4), x(1) and y(4), x(0) and y(4));
	G4 <= (x(5) and y(5), x(4) and y(5), x(3) and y(5), x(2) and y(5), x(1) and y(5), x(0) and y(5));


    
    B0 <=  ('0',x(5) and y(0), x(4) and y(0), x(3) and y(0), x(2) and y(0), x(1) and y(0));

cell_1: 
    Ripple_Adder 
        port map (
            a => G0,
            b => B0,
            cin => '0',
            cout => B1(5),
			S(5) => B1(4),
			S(4) => B1(3),
            S(3) => B1(2),
            S(2) => B1(1), 
            S(1) => B1(0),
            S(0) => p(1)
        );
cell_2: 
    Ripple_Adder 
        port map (
            a => G1,
            b => B1,
            cin => '0',
            cout => B2(5),
			S(5) => B2(4),
            S(4) => B2(3),
            S(3) => B2(2),
            S(2) => B2(1),
            S(1) => B2(0),
            S(0) => p(2)
        );
cell_3: 
    Ripple_Adder 
        port map (
            a => G2,
            b => B2,
            cin => '0',
            cout => B3(5),
			S(5) => B3(4),
            S(4) => B3(3),
            S(3) => B3(2),
            S(2) => B3(1),
            S(1) => B3(0),
            S(0) => p(3)
        );
cell_4: 
    Ripple_Adder 
        port map (
            a => G3,
            b => B3,
            cin => '0',
            cout => B4(5),
			S(5) => B4(4),
            S(4) => B4(3),
            S(3) => B4(2),
            S(2) => B4(1),
            S(1) => B4(0),
            S(0) => p(4)
        );
cell_5: 
    Ripple_Adder 
        port map (
            a => G4,
            b => B4,
            cin => '0',
            cout => p(11),
            S => p(10 downto 5) 
        );
    p(0) <= x(0) and y(0); 
end architecture rtl;