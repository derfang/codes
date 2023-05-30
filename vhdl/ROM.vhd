-- vhdl-linter-disable unused
-- vhdl-linter-disable not-declared
-- vhdl-linter-disable type-resolved
-- this is the implimantation of rom which hosts the instructions for the cpu

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom is
    Port ( address : in  STD_LOGIC_VECTOR (15 downto 0);
           data : out  STD_LOGIC_VECTOR (15 downto 0));
end rom;

architecture Behavioral of rom is 
    type rom_type is array (0 to 63 ) of std_logic_vector(15 downto 0);
    constant rom1 : rom_type := (
        -- 0 => "0001100000000000", --CLA "0001100000000000" = x"1800"
        0 => "0000110000000000", --LDA A - M0=x"000a"
        1 => "0100000000000001", --MUL B - M1=x"000f"
        2 => "0000100000000010", --STA C - M2 <= x"0096"
        3 => "1000000000000000", --SQR A
        4 => "0000100000000011", --STA D - M3 <= x"0003"
        5 => "0001000000000000", --ADD A
        6 => "0000100000000100", --STA E - M4 <= x"000D"
        7 => "0000110000000011", --LDA D - M3 <= x"0003"
        8 => "0000000000000000", --HLT
        others => "0000000000000000"
       
    );

begin
    data <= rom1(to_integer(unsigned(address))) ;
end Behavioral;


           