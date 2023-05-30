-- vhdl-linter-disable type-resolved
-- this codes intends to identify ascii code of ESC: 1011 <- in a sequence of inputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ESCfinder is
    port (
        clk: in std_logic;
        input: in std_logic ;
        output: out std_logic
    );
end entity ESCfinder;

architecture rtl of ESCfinder is
    type state_type is (idle, esc1, esc2 , esc3);
    signal state: state_type := idle;
begin
    process(clk)
    begin
        if falling_edge(clk) then  --1011
            case state is
                when idle =>
                    if input = '1' then
                        state <= esc1;
                        output <= '0';
                    else
                        state <= idle;
                        output <= '0';
                    end if;
                when esc1 =>
                    if input = '1' then
                        state <= esc2;
                        output <= '0';
                    else
                        state <= idle;
                        output <= '0';
                    end if;
                when esc2 =>
                    if input = '1' then
                        state <= esc2;
                        output <= '0';
                    else
                        state <= esc3;
                        output <= '0';
                    end if;
                when esc3 =>
                    if input = '1' then
                        state <= esc1;
                        output <= '1';
                    else
                        state <= idle;
                        output <= '0';
                    end if;
            end case;
        end if;
    end process;
end architecture rtl;