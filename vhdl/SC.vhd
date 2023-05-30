--aurhor : DERFANG
-- vhdl-linter-disable type-resolved

-- This is a 3bit count__siger

library ieee; 
use ieee.std_logic_1164.all;

entity SC is
    port (clk, reset: in std_logic;
          count: out std_logic_vector(2 downto 0));
end SC;

architecture SC_arch of SC is
    signal count_sig: std_logic_vector(2 downto 0) := "000";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count_sig <= "000";
            elsif count_sig = "000" then
                count_sig <= "001";
            elsif count_sig = "001" then
                count_sig <= "010";
            elsif count_sig = "010" then
                count_sig <= "011";
            elsif count_sig = "011" then
                count_sig <= "100";
            elsif count_sig = "100" then
                count_sig <= "101";
            elsif count_sig = "101" then
                count_sig <= "110";
            elsif count_sig = "110" then
                count_sig <= "111";
            elsif count_sig = "111" then
                count_sig <= "000";
            end if;
        end if;
        end process;
        count <= count_sig;
end SC_arch;