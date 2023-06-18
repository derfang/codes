-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
-- in this code we want to implement cordic algorithm for atan function

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordicatan is
    port(
        yin : in std_logic_vector(16 downto 0); 
        atan_yin : out std_logic_vector(16 downto 0) 
    );
end cordicatan;

architecture rtl of cordicatan is 
    type deg is array (0 to 9) of std_logic_vector(16 downto 0);
    constant degs : deg := (
        0 => "00010110100000000" , -- 45     = b'00101101.00000000 
        1 => "00001101010001110", -- 26.555 = b'00011010.10001110 
        2 => "00000111000001001", -- 14.036 = b'00001110.00001001
        3 => "00000011100100000", -- 7.125  = b'00000111.00100000
        4 => "00000001110010011", -- 3.576  = b'00000011.10010011
        5 => "00000000111001001", -- 1.789  = b'00000001.11001001
        6 => "00000000011100101", -- 0.895  = b'00000000.11100101
        7 => "00000000001110010", -- 0.447  = b'00000000.01110010
        others => "00000000000000000"
    );
    signal xo0,xo1,xo2,xo4,xo3,xo5,xo6,xo8 : signed(16 downto 0) := (others => '0') ; -- these signals are for test
    signal yo0,yo1,yo2,yo4,yo3,yo5,yo6,yo8 : signed(16 downto 0) := (others => '0') ;
    signal zo0,zo1,zo2,zo4,zo3,zo5,zo6,zo8 : signed(16 downto 0) := (others => '0') ;
begin
    process(yin)
        variable x0,x1,x2,x3,x4,x5,x6,x7 : signed(16 downto 0) := (others => '0') ;
        variable y0,y1,y2,y3,y4,y5,y6,y7 : signed(16 downto 0) := (others => '0') ;
        variable z0,z1,z2,z3,z4,z5,z6,z7,z8 : signed(16 downto 0) := (others => '0') ;
        variable x8,y8 : signed(16 downto 0) := (others => '0') ;
    begin
        y0 := signed(yin);
        x0 := "00000000100000000";   -- 1.0=b'000000010000000
        z0 := "00000000000000000";   -- 0.0=b'000000000000000 
        ---------stage 0---------
        if (y0(16) xor x0(16)) = '1' then
            z1 := z0 - signed(degs(0));
            x1 := x0 - y0;
            y1 := y0 + x0;
        else
            z1 := z0 + signed(degs(0));
            x1 := x0 + y0;
            y1 := y0 - x0;
        end if;
        -- ---------stage 1---------
        if (y1(16) xor x1(16)) = '1' then
            z2 := z1 - signed(degs(1)); 
            x2 := x1 - shift_right(y1,1); 
            y2 := y1 + shift_right(x1,1);
        else
            z2 := z1 + signed(degs(1)); 
            x2 := x1 + shift_right(y1,1);
            y2 := y1 - shift_right(x1,1);
        end if;
        ---------stage 2---------
        if (y2(16) xor x2(16)) = '1' then
            z3 := z2 - signed(degs(2)); 
            x3 := x2 - shift_right(y2,2); 
            y3 := y2 + shift_right(x2,2);
        else
            z3 := z2 + signed(degs(2)); 
            x3 := x2 + shift_right(y2,2);
            y3 := y2 - shift_right(x2,2);
        end if;
        ---------stage 3---------
        if (y3(16) xor x3(16)) = '1' then
            z4 := z3 - signed(degs(3)); 
            x4 := x3 - shift_right(y3,3); 
            y4 := y3 + shift_right(x3,3);
        else
            z4 := z3 + signed(degs(3)); 
            x4 := x3 + shift_right(y3,3);
            y4 := y3 - shift_right(x3,3);
        end if;
        ---------stage 4---------
        if (y5(16) xor x4(16)) = '1' then
            z5 := z4 - signed(degs(4)); 
            x5 := x4 - shift_right(y4,4); 
            y5 := y4 + shift_right(x4,4);
        else
            z5 := z4 + signed(degs(4)); 
            x5 := x4 + shift_right(y4,4);
            y5 := y4 - shift_right(x4,4);
        end if;
        ---------stage 5---------
        if (y5(16) xor x5(16)) = '1' then
            z6 := z5 - signed(degs(5)); 
            x6 := x5 - shift_right(y5,5); 
            y6 := y5 + shift_right(x5,5);
        else
            z6 := z5 + signed(degs(5)); 
            x6 := x5 + shift_right(y5,5);
            y6 := y5 - shift_right(x5,5);
        end if;
        ---------stage 6---------
        if (y6(16) xor x6(16)) = '1' then
            z7 := z6 - signed(degs(6)); 
            x7 := x6 - shift_right(y6,6); 
            y7 := y6 + shift_right(x6,6);
        else
            z7 := z6 + signed(degs(6)); 
            x7 := x6 + shift_right(y6,6);
            y7 := y6 - shift_right(x6,6);
        end if;
        ---------stage 7---------
        if (y7(16) xor x7(16)) = '1' then
            z8 := z7 - signed(degs(7)); 
            x8 := x7 - shift_right(y7,7);   --these are not necessary for calculation 
            y8 := y7 + shift_right(x7,7);   --but they are used to extend the circuit for more bits
        else                                                    
            z8 := z7 + signed(degs(7));             
            x8 := x7 + shift_right(y7,7);   --these are not necessary for calculation 
            y8 := y7 - shift_right(x7,7);   --but they are used to extend the circuit for more bits
        end if;
------------------------------------------------        
        atan_yin <= std_logic_vector(z8);
        -- xo <= x8;  --these signals are for test
        -- yo <= y8;  --you can use them to check any stage
        xo0 <= x0;   xo1 <= x1;   xo2 <= x2;   xo3 <= x3;   xo4 <= x4;   xo5 <= x5;   xo6 <= x6;   xo8 <= x7;
        yo0 <= y0;   yo1 <= y1;   yo2 <= y2;   yo3 <= y3;   yo4 <= y4;   yo5 <= y5;   yo6 <= y6;   yo8 <= y7;
        zo0 <= z0;   zo1 <= z1;   zo2 <= z2;   zo3 <= z3;   zo4 <= z4;   zo5 <= z5;   zo6 <= z6;   zo8 <= z7;
        end process;    
end rtl;