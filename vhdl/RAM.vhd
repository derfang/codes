--aurhor : DERFANG
-- vhdl-linter-disable type-resolved

-- in this code we plan to impiment a 1024*16 ram 
-- a ram has read, write, clock, address, data ports

-- q:how can i set a defult value for a type?
-- a:use a signal of that type and set it's value
-- q:how can i set a defult value for a signal?


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
    port(
        clk: in std_logic;
        address: in std_logic_vector(9 downto 0);
        data_in: in std_logic_vector(15 downto 0);
        data_out: out std_logic_vector(15 downto 0);
        readF: in std_logic;
        writeF: in std_logic
    );
end ram;

architecture rtl of ram is
    type ram_type is array(0 to 1023) of std_logic_vector(15 downto 0);
    signal ram: ram_type := (   x"000A" ,
                                x"000F" ,
                                x"0001" ,
                                others => (others => '0') );
    begin
        process(clk)
        begin
            if falling_edge(clk) then
                if readF = '1' then
                    data_out <= ram(to_integer(unsigned(address)));
                elsif writeF = '1' then
                    ram(to_integer(unsigned(address))) <= data_in;
                end if;
            end if;
        end process;
end rtl;
