-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity YBlock is
    Port ( Di : in STD_LOGIC_VECTOR (2 downto 1);
           A11,A12,A22 : in STD_LOGIC;
           Ci : in STD_LOGIC_VECTOR (2 downto 1);
           Pi : in STD_LOGIC_VECTOR (2 downto 1);
           Po : out STD_LOGIC_VECTOR (2 downto 1);
           Do : out STD_LOGIC_VECTOR (2 downto 1);
           S11,S21,S22 : out STD_LOGIC;
           Co : out STD_LOGIC_VECTOR (2 downto 1));
end YBlock;

architecture Behavioral of YBlock is
    component CAS
        port(
            P,D,X,Cin : in STD_LOGIC;
            R,Cout :    out STD_LOGIC
        );
    end component;

    signal T: STD_LOGIC_VECTOR (3 downto 1);


begin
    CAS_11: CAS port map(Pi(1),Di(1),A11,T(1), S11, Co(1));
    CAS_12: CAS port map(Pi(1),Di(2),A12,Ci(1),T(2),T(1) );
    CAS_21: CAS port map(Pi(2),Di(1),T(2),T(3),S21, Co(2));
    CAS_22: CAS port map(Pi(2),Di(2),A22,Ci(2),S22, T(3));
    Do(1) <= Di(1);
    Do(2) <= Di(2);
    Po(1) <= Pi(1);
    Po(2) <= Pi(2);
    



end Behavioral;
