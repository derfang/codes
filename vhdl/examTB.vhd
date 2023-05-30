-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity examTB is
end entity;

architecture testbench of examTB is
    component ESCfinder is
        port (
        clk: in std_logic;
        input: in std_logic ;
        output: out std_logic
    );
    end component;
    signal clk: std_logic := '0';
    signal input: std_logic := '0';
    signal output: std_logic := '0';
    constant clk_period: time := 20 ns;
begin
    DUT: ESCfinder
        port map (
            clk => clk,
            input => input,
            output => output
        );
     -- Clock process definitions( clock with 50% duty cycle is generated here.
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        wait for 100 ns;
        input <= '1'; -- 1
        wait for 20 ns;
        input <= '1'; -- 11
        wait for 20 ns;
        input <= '1'; -- 111
        wait for 20 ns;
        input <= '0'; -- 0111
        wait for 20 ns;
        input <= '1'; -- 10111
        wait for 20 ns;
        input <= '0'; -- 010111
        wait for 20 ns;
        input <= '0'; -- 0010111
        wait for 20 ns;
        input <= '1'; -- 10010111
        wait for 20 ns;
        input <= '1'; -- 110010111
        wait for 20 ns;
        input <= '0'; -- 0110010111
        wait for 20 ns;
        input <= '1'; -- 10110010111
        wait for 20 ns;
        input <= '1'; -- 110110010111
        wait for 20 ns;
        input <= '0'; -- 0110110010111
        wait for 20 ns;
        input <= '1'; -- 10110110010111
        wait for 20 ns;
        input <= '0'; -- 010110110010111
        wait for 20 ns;
        input <= '0'; -- 0010110110010111
        wait for 20 ns;
        input <= '0'; -- 00010110110010111
        wait for 20 ns;
        input <= '1'; -- 100010110110010111
        wait for 20 ns;
        input <= '1'; -- 1100010110110010111
        wait for 20 ns;
        input <= '0'; -- 01100010110110010111
        wait for 20 ns;
        input <= '1'; -- 101100010110110010111
        wait for 20 ns;
        input <= '1'; -- 1101100010110110010111
        wait for 20 ns;
        input <= '1'; -- 11101100010110110010111
        wait;
    end process;
end architecture;