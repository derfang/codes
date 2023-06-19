-- vhdl-linter-disable component
-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cordicatanTB is
end entity;

architecture testbench of cordicatanTB is
    component cordicatan is
        port(yin : in signed(16 downto 0); 
            atan_yin : out signed(16 downto 0) );
    end component;

    signal yin : signed(16 downto 0) := (others => '0');
    signal atan_yin : signed(16 downto 0) := (others => '0');
    
begin
    uut : cordicatan
        port map(
            yin => yin,
            atan_yin => atan_yin
        );
    
    strm : process
    begin
        yin <= "00000000000000000"; --0
        wait for 1 us;
        yin <= "00000000100000000"; --1
        wait for 1 us;
        yin <= "00000001000000000"; --2
        wait for 1 us;
        yin <= "00000000110000000"; --1.5
        wait for 1 us;
        yin <= "00000000010000000"; --0.5
        wait for 1 us;
        yin <= "00000010100000000"; --5
        wait for 1 us;
        yin <= "00000101000000000"; --10
        wait for 1 us; --15
        yin <= "00000111100000000"; --15
        wait for 1 us;--25
        yin <= "00001100100000000"; --25
        wait for 1 us;-- -5
        yin <= "11111101100000000"; -- -00000010100000000
        wait;
    end process;
end architecture;

