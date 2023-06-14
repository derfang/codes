-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
-- testbench file for cordicexp.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cordicexp_tb is
end entity cordicexp_tb;

architecture sim of cordicexp_tb is
    component cordiexponential is
        port(
        zin : in std_logic_vector(16 downto 0); 
        exp_zin : out std_logic_vector(16 downto 0) 
    );
    end component;

    signal zin : std_logic_vector(16 downto 0) := (others => '0');
    signal exp_zin : std_logic_vector(16 downto 0) := (others => '0');

begin
    uut : cordiexponential
        port map(
            zin => zin,
            exp_zin => exp_zin
        );

    stim_proc : process
    begin
        zin <= "00000000000000000"; -- 0
        wait for 1 us;
        zin <= "00000000100000000"; -- 1
        wait for 1 us;
        zin <= "00000001000000000"; -- 2 -diverges
        wait for 1 us;
        zin <= "00000000010000000"; -- 0.5
        wait for 1 us;
        zin <= "00000000001000000"; -- 0.25
        wait for 1 us;
        zin <= "00000000001100000"; -- 0.375
        wait;
    end process;
end architecture sim;