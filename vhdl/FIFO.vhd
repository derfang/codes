-- vhdl-linter-disable type-resolved
-- FIFO stack implimentation N bits wide and 8 deep
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo is
    generic(
        DATA_WIDTH : integer := 4
    );
    port(
        clk : in std_logic;
        rst : in std_logic;
        push : in std_logic;
        pop : in std_logic;
        data_in : in std_logic_vector(DATA_WIDTH-1 downto 0);
        data_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
        empty : out std_logic;
        full : out std_logic
    );
end fifo;

architecture
    rtl of fifo is
    type fifo_type is array (0 to 7) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal fifo : fifo_type;
    signal head : integer range 0 to 8 := 0;
    signal tail : integer range 0 to 8 := 0;
    signal count : integer range 0 to 8 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            head <= 0;
            tail <= 0;
            count <= 0;
        elsif rising_edge(clk) then
            if push = '1' then
                fifo(head) <= data_in;
                head <= head + 1;
                count <= count + 1;
            elsif pop = '1' then
                tail <= tail + 1;
                count <= count - 1;
            end if;
        end if;
    end process;

    data_out <= fifo(tail);
    empty <= '1' when count = 0 else '0';
    full <= '1' when count = 8 else '0';
end rtl;