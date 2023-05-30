--aurhor : DERFANG
-- vhdl-linter-disable type-resolved
-- This is the implemantation of DR

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DR is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC :='0';
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
           LD : in  STD_LOGIC :='0' ;
           INC : in  STD_LOGIC :='0' );
end DR;

architecture Behavioral of DR is

    signal data : STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
begin
    process(clk,reset)
    begin
        if reset = '1' then
            data <= (others => '0');
        elsif rising_edge(clk) then
            if LD = '1' then
                data <= data_in;
            elsif INC = '1' then
                data <= std_logic_vector(unsigned(data) + 1);
                end if;
        end if;
    end process;
    data_out <= data;
end Behavioral;
