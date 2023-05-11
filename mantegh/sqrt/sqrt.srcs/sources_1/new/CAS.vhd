-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity CAS is
    Port ( P,D,X,Cin : in STD_LOGIC;
           R,Cout : out STD_LOGIC);
end CAS;

architecture Behavioral of CAS is
    component FA
        port ( 
            A:      in  std_logic;
            B:      in  std_logic;
            Cin:    in  std_logic;
            S:      out std_logic;
            Cout:   out std_logic
        );
    end component;

    signal Ain:  std_logic;

begin
    
        Ain <= P xor D;
    
        FA_1: FA port map (Ain, X, Cin, R, Cout);
    


end Behavioral;
