-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity cas is
port (  x_c : in std_logic;
        d_in : in std_logic;
        P_in : in std_logic;
		  cin_c : in std_logic;

		  p_out : out std_logic;
		 
		  r_c : out std_logic;
		  cout_c : out std_logic
		  );
end cas;




architecture Behavioral of cas is
component full_adder is
Port (     i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
			 
end component;

signal s : std_logic;
signal c : std_logic;
signal k : std_logic;


begin

k <= p_in xor d_in;

full_adder_ins : full_adder port map(i0 => x_c,  i1 => k,   cin => cin_c, sum => s, cout => c);

cout_c <= c;
r_c <= s;

p_out <= p_in;


end Behavioral;
