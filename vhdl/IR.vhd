-- vhdl-linter-disable type-resolved
-- This is the implemantation of Instruction Register

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IR is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC :='0';
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
           LD : in  STD_LOGIC :='0' );
end IR;

architecture Behavioral of IR is

    signal data : STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
begin
    process(clk,reset)
    begin
        if reset = '1' then
            data <= (others => '0');
        elsif rising_edge(clk) then
            if LD = '1' then
                data <= data_in;
            end if;
        end if;
    end process;
    data_out <= data;
end Behavioral;