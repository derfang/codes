-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Xblock is
    Port ( Di1 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (4 downto 0);
           Pi : in STD_LOGIC_VECTOR (2 downto 1);
           R : out STD_LOGIC_VECTOR (4 downto 0);
           Do : out STD_LOGIC_VECTOR (2 downto 1);
           Co : out STD_LOGIC_VECTOR (2 downto 1));
end Xblock;

architecture Behavioral of Xblock is
    component CAS
        port(
            P,D,X,Cin : in STD_LOGIC;
            R,Cout :    out STD_LOGIC
        );
    end component;

    signal S: STD_LOGIC_VECTOR (7 downto 1);
    signal t0: STD_LOGIC;
    signal t1: STD_LOGIC;

begin
    Do(1) <= Di1;
    Do(2) <= Pi(2);
    t0 <= not Pi(1);
    t1 <= not Pi(2);
    CAS_A: CAS port map(Pi(1), Pi(1), A(0), S(1), R(0), Co(1));
    CAS_B: CAS port map(Pi(1),  t0  , A(1), S(2), S(3), S(1) );
    CAS_C: CAS port map(Pi(1),  '1' , A(2), Pi(1),S(4), S(2) );
    CAS_D: CAS port map(Pi(2), Di1  , S(3), S(5), R(1), Co(2));
    CAS_E: CAS port map(Pi(2), Pi(2), S(4), S(6), R(2), S(5) );
    CAS_F: CAS port map(Pi(2),  t1  , A(3), S(7), R(3), S(6) );
    CAS_G: CAS port map(Pi(2),  '1' , A(4), Pi(2),R(4), S(7) );


end Behavioral;
