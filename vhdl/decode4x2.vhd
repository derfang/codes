-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;

entity decoder4x2 is
    Port ( 
        input :  in std_logic_vector(1 downto 0);
        enable : in std_logic;
        output : out std_logic_vector(3 downto 0)
    );
end decoder4x2;

architecture Behavioral of decoder4x2 is
    signal temp : std_logic_vector(3 downto 0);
begin
    with input select
        temp <= "0001" when "00",
                "0010" when "01",
                "0100" when "10",
                "1000" when others;
    output <= temp when enable = '1' else "0000";
end Behavioral;

