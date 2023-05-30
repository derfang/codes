-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder16x4 is
    port(
        input: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(15 downto 0)
    );
end decoder16x4;

architecture Behavioral of decoder16x4 is
    component decoder4x2 is
        port(
            input: in std_logic_vector(1 downto 0);
            enable: in std_logic;
            output: out std_logic_vector(3 downto 0)
        );
    end component;

    signal tempE: std_logic_vector(3 downto 0);
    
begin
    decoder4x2_temp: decoder4x2 port map(
        input => input(3 downto 2),
        enable => '1',
        output => tempE
    );

    decoder4x2_0: decoder4x2 port map(
        input => input(1 downto 0),
        enable => tempE(0),
        output => output(3 downto 0)
    );

    decoder4x2_1: decoder4x2 port map(
        input => input(1 downto 0),
        enable => tempE(1),
        output => output(7 downto 4)
    );

    decoder4x2_2: decoder4x2 port map(
        input => input(1 downto 0),
        enable => tempE(2),
        output => output(11 downto 8)
    );

    decoder4x2_3: decoder4x2 port map(
        input => input(1 downto 0),
        enable => tempE(3),
        output => output(15 downto 12)
    );


end Behavioral;
