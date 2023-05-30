--aurhor : DERFANG
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
 entity FA is
 Port ( A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end FA;

architecture gate_level of FA is

begin

 S <= A XOR B XOR Cin ;
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;

end gate_level;