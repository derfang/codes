-- vhdl-linter-disable type-resolved
-- This is the implemantation of Extrabit

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Extrabit is
    port (
        clk : in std_logic;
        reset : in std_logic;
        colmpliment : in std_logic;
        data_in : in std_logic;
        data_out : out std_logic := '0'
    );
end entity Extrabit;

architecture Behavioral of Extrabit is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                data_out <= '0';
            elsif colmpliment = '1' then
                data_out <= not data_in;
            else
                data_out <= data_in;
            end if;
        end if;
    end process;
end architecture Behavioral;