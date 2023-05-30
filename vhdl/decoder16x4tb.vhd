-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder16x4tb is
end decoder16x4tb;

architecture testbench of decoder16x4tb is
    component decoder16x4 is
        port(
            input: in std_logic_vector(3 downto 0);
            output: out std_logic_vector(15 downto 0)
        );
    end component decoder16x4;

    signal input: std_logic_vector(3 downto 0);
    signal output: std_logic_vector(15 downto 0);

begin
    uut: decoder16x4 port map(
        input => input,
        output => output
    );

    strm: process
    begin
        for i in 0 to 15 loop
            input <= std_logic_vector(to_unsigned(i, 4));
            wait for 50 ns;
        end loop;
        wait;

    end process;
end testbench;