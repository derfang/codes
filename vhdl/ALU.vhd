-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
-- vhdl-linter-disable not-declared

--?aurhor : DERFANG

-- in this code we wish to make a ALU unit that can do the following operations:
-- 0.and   1.add   2.circular shift left  3.circular shift right
-- 4.linerar shift left  5.linear shift right
-- 5. multiply  6. sqrt and the latter 2 operations are done by using the
-- components that we have already made in the previous codes.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity ALU is
    port (a,b: in std_logic_vector(15 downto 0) ;  
          op_select: in std_logic_vector(2 downto 0);
          result: out std_logic_vector(15 downto 0) := "0000000000000000";
          Ein: in std_logic;
          Eout: out std_logic := '0');
end ALU;

architecture rtl of ALU is


component Ripple_Adder is
    port ( A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    Cin : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR (15 downto 0);
    Cout : out STD_LOGIC);
end component;

component arraymulty is
    port (
        x: in  std_logic_vector (5 downto 0);
        y: in  std_logic_vector (5 downto 0);
        p: out std_logic_vector (11 downto 0)
    );
end component;

component sqrt is
    port (  ai : in std_logic_vector(16 downto 1);
		    ro : out std_logic_vector(16 downto 7);
		    q : out std_logic_vector(8 downto 1);
            nc : out std_logic_vector(14 downto 0)
		  );
end component;

signal adder_out: std_logic_vector(15 downto 0);
signal carry_out: std_logic;

signal multy_out: std_logic_vector(15 downto 0);

signal sqrt_out: std_logic_vector(15 downto 0);
signal sqrt_nc: std_logic_vector(14 downto 0);
signal sqrt_q: std_logic_vector(8 downto 1);
signal sqrt_ro: std_logic_vector(16 downto 7);
signal sqrt_ai: std_logic_vector(16 downto 1);

begin
    uut1: Ripple_Adder port map(a,b,'0',adder_out,carry_out);
    uut2: arraymulty port map(a(5 downto 0),b(5 downto 0),multy_out(11 downto 0));
    multy_out(15 downto 12) <= "0000";
    uut3: sqrt port map(sqrt_ai,sqrt_ro,sqrt_q,sqrt_nc);


    ----------------sqrt was defined reverse in the previous code so we need to reverse it again--------------------
    sqrt_ai(1) <= b(15);    sqrt_ai(2) <= b(14);    sqrt_ai(3) <= b(13);    sqrt_ai(4) <= b(12);
    sqrt_ai(5) <= b(11);    sqrt_ai(6) <= b(10);    sqrt_ai(7) <= b(9);     sqrt_ai(8) <= b(8);
    sqrt_ai(9) <= b(7);     sqrt_ai(10) <= b(6);    sqrt_ai(11) <= b(5);    sqrt_ai(12) <= b(4);
    sqrt_ai(13) <= b(3);    sqrt_ai(14) <= b(2);    sqrt_ai(15) <= b(1);    sqrt_ai(16) <= b(0);  
    ----------------------------------------------------------------------------------------------------------------
    sqrt_out(0) <= sqrt_q(8);    sqrt_out(1) <= sqrt_q(7);    sqrt_out(2) <= sqrt_q(6);    sqrt_out(3) <= sqrt_q(5);
    sqrt_out(4) <= sqrt_q(4);    sqrt_out(5) <= sqrt_q(3);    sqrt_out(6) <= sqrt_q(2);    sqrt_out(7) <= sqrt_q(1);
    sqrt_out(15 downto 8) <= "00000000";
    ----------------------------------------------------------------------------------------------------------------
    process(op_select, Ein, a, b ,adder_out, carry_out, multy_out, sqrt_out)
    begin
        case op_select is --q:why is it not working with "000"? 
            when "000" => result <= a and b; --and
                          Eout <= Ein;
            when "001" => result <= adder_out; --add
                          Eout <= carry_out;
            when "010" => result(15 downto 1) <= a(14 downto 0);  --circular shift left
                          Eout <= a(15);
                          result(0) <= Ein;
            when "011" => result(14 downto 0) <= a(15 downto 1);  --circular shift right
                          Eout <= a(0);
                          result(15)  <=  Ein;
            when "100" => result(15 downto 1) <= a(14 downto 0);  --linear shift left
                          result(0) <= '0';
                          Eout <= Ein;
            when "101" => result(14 downto 0) <= a(15 downto 1);  --linear shift right
                          result(15) <= '0';
                          Eout <= Ein;
            when "110" => result <= multy_out; --multiply
                          Eout <= Ein;
            when "111" => result <= sqrt_out;  --sqrt
                          Eout <= Ein;
            when others => result <= "0000000000000000";
                           Eout <= '0';
        end case; 
    end process;



end rtl;