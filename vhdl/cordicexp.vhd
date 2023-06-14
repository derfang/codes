-- vhdl-linter-disable type-resolved
-- in this code we want to implement cordic algorithm for atan function

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordiexponential is
    port(
        zin : in std_logic_vector(16 downto 0); 
        exp_zin : out std_logic_vector(16 downto 0) 
    );
end cordiexponential;

architecture rtl of cordiexponential is 
    type deg is array (0 to 9) of std_logic_vector(16 downto 0);
    constant degs : deg := (
        0 => "00000000000000000", -- NA
        1 => "00000000010001011", -- 0.549 = b'00000000.10001100
        2 => "00000000001000001", -- 0.255 = b'00000000.01000001
        3 => "00000000000100000", -- 0.125 = b'00000000.00100000
        4 => "00000000000010000", -- 0.625 = b'00000000.00010000
        5 => "00000000000001000", -- 0.312 = b'00000000.00001000
        6 => "00000000000000100", -- 0.156 = b'00000000.00000100
        7 => "00000000000000010", -- 0.007 = b'00000000.00000010
        8 => "00000000000000001", -- 0.003 = b'00000000.00000001
        others => "00000000000000000"
    );
    -- signal xo0,xo1,xo2,xo4_0,xo3,xo4_1,xo5,xo6,xo8 : signed(16 downto 0) := (others => '0') ; -- these signals are for test
    -- signal yo0,yo1,yo2,yo4_0,yo3,yo4_1,yo5,yo6,yo8 : signed(16 downto 0) := (others => '0') ;
    -- signal zo0,zo1,zo2,zo4_0,zo4_1,zo3,zo5,zo6,zo8 : signed(16 downto 0) := (others => '0') ;
begin
    process(zin)
        variable x0,x1,x2,x3,x4_0,x4_1,x5,x6,x7 : signed(16 downto 0) := (others => '0') ;
        variable y0,y1,y2,y3,y4_0,y4_1,y5,y6,y7,y8 : signed(16 downto 0) := (others => '0') ;
        variable z0,z1,z2,z3,z4_0,z4_1,z5,z6,z7 : signed(16 downto 0) := (others => '0') ;
        -- variable z8,x8 : signed(16 downto 0) := (others => '0') ;
    begin
        y0 := "00000000100110101"; -- 1.207 = b'00000001.00110101 = 1/K*
        x0 := "00000000100110101"; -- 1.207 = b'00000001.00110101 = 1/K*
        z0 := signed(zin);   
        ---------stage 0---------
        if z0(16) = '1' then
            z1 := z0 + signed(degs(1));
            x1 := x0 - shift_right(y0,1);
            y1 := y0 - shift_right(x0,1);
        else
            z1 := z0 - signed(degs(1));
            x1 := x0 + shift_right(y0,1);
            y1 := y0 + shift_right(x0,1);
        end if;
        ---------stage 1---------
        if z1(16) = '1' then
            z2 := z1 + signed(degs(2));
            x2 := x1 - shift_right(y1,2);
            y2 := y1 - shift_right(x1,2);
        else
            z2 := z1 - signed(degs(2));
            x2 := x1 + shift_right(y1,2);
            y2 := y1 + shift_right(x1,2);
        end if;
        ---------stage 2---------
        if z2(16) = '1' then
            z3 := z2 + signed(degs(3));
            x3 := x2 - shift_right(y2,3);
            y3 := y2 - shift_right(x2,3);
        else
            z3 := z2 - signed(degs(3));
            x3 := x2 + shift_right(y2,3);
            y3 := y2 + shift_right(x2,3);
        end if;
        ---------stage 3---------
        if z3(16) = '1' then
            z4_0 := z3 + signed(degs(4));
            x4_0 := x3 - shift_right(y3,4);
            y4_0 := y3 - shift_right(x3,4);
        else
            z4_0 := z3 - signed(degs(4));
            x4_0 := x3 + shift_right(y3,4);
            y4_0 := y3 + shift_right(x3,4);
        end if;
        ---------stage 4_0---------
        if z4_0(16) = '1' then
            z4_1 := z4_0 + signed(degs(5));
            x4_1 := x4_0 - shift_right(y4_0,5);
            y4_1 := y4_0 - shift_right(x4_0,5);
        else
            z4_1 := z4_0 - signed(degs(5));
            x4_1 := x4_0 + shift_right(y4_0,5);
            y4_1 := y4_0 + shift_right(x4_0,5);
        end if;
        ---------stage 4_1---------
        if z4_1(16) = '1' then
            z5 := z4_1 + signed(degs(5));
            x5 := x4_1 - shift_right(y4_1,5);
            y5 := y4_1 - shift_right(x4_1,5);
        else
            z5 := z4_1 - signed(degs(5));
            x5 := x4_1 + shift_right(y4_1,5);
            y5 := y4_1 + shift_right(x4_1,5);
        end if;
        ---------stage 5---------
        if z5(16) = '1' then
            z6 := z5 + signed(degs(6));
            x6 := x5 - shift_right(y5,6);
            y6 := y5 - shift_right(x5,6);
        else
            z6 := z5 - signed(degs(6));
            x6 := x5 + shift_right(y5,6);
            y6 := y5 + shift_right(x5,6);
        end if;
        ---------stage 6---------
        if z6(16) = '1' then
            z7 := z6 + signed(degs(7));
            x7 := x6 - shift_right(y6,7);
            y7 := y6 - shift_right(x6,7);
        else
            z7 := z6 - signed(degs(7));
            x7 := x6 + shift_right(y6,7);
            y7 := y6 + shift_right(x6,7);
        end if;
        ---------stage 7---------
        if z7(16) = '1' then
            -- z8 := z7 - signed(degs(8)); 
            -- x8 := x7 - shift_right(y7,8);   
            y8 := y7 - shift_right(x7,8);   
        else                                                    
            -- z8 := z7 + signed(degs(8));             
            -- x8 := x7 + shift_right(y7,8);   
            y8 := y7 + shift_right(x7,8);   
        end if;
------------------------------------------------        
        exp_zin <= std_logic_vector(y8);
        -- xo <= x8;  --these signals are for test
        -- yo <= y8;  --you can use them to check any stage
        -- zo <= z8;
        -- xo0 <= x0;   xo1 <= x1;   xo2 <= x2;   xo3 <= x3;   xo4_0 <= x4_0;   xo4_1 <= x4_1;   xo5 <= x5;   xo6 <= x6;   xo8 <= x7;
        -- yo0 <= y0;   yo1 <= y1;   yo2 <= y2;   yo3 <= y3;   yo4_0 <= y4_0;   yo4_1 <= y4_1;   yo5 <= y5;   yo6 <= y6;   yo8 <= y7;
        -- zo0 <= z0;   zo1 <= z1;   zo2 <= z2;   zo3 <= z3;   zo4_0 <= z4_0;   zo4_1 <= z4_1;   zo5 <= z5;   zo6 <= z6;   zo8 <= z7;
        end process;    
end rtl;