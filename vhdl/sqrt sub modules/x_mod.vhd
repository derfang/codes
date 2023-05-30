-- vhdl-linter-disable type-resolved
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:31:00 03/29/2023 
-- Design Name: 
-- Module Name:    x_mod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity x_mod is
port (  a : in std_logic_vector(4 downto 0);
		  di1 : in std_logic;
		  pi1 : in std_logic;
		  pi2 : in std_logic;
		  
		  
		  r : out std_logic_vector(4 downto 0);
		  do1 : out std_logic;
		  do2 : out std_logic;
		  co1 : out std_logic;
		  co2 : out std_logic
		  
		  );
end x_mod;

architecture Behavioral of x_mod is
component cas is
port (  x_c : in std_logic;
        d_in : in std_logic;
        P_in : in std_logic;
		  cin_c : in std_logic;

		  p_out : out std_logic;
		 
		  r_c : out std_logic;
		  cout_c : out std_logic
		  );
end component;


signal s : std_logic_vector(6 downto 0);
signal k : std_logic_vector(6 downto 0);
signal m : std_logic_vector(6 downto 0);
signal e1 : std_logic;
signal e2 : std_logic;

begin

do1 <= di1;

cas_a : cas port map(d_in => pi1,  p_in => pi1,   x_c => a(0), p_out => s(0), cin_c => k(0), r_c => m(0) , cout_c => co1);

r(0) <= m(0);
e1 <= not(s(0));

cas_b : cas port map(d_in => e1,  p_in => s(0),   x_c => a(1), p_out => s(1), cin_c => k(1), r_c => m(1) , cout_c => k(0));

cas_c : cas port map(d_in => '1',  p_in => s(1),   x_c => a(2), p_out => s(2), cin_c => k(2), r_c => m(2) , cout_c => k(1));

k(2) <= s(2) ;

cas_d : cas port map(d_in => di1,  p_in => pi2,   x_c => m(1), p_out => s(3), cin_c => k(3), r_c => m(3) , cout_c => co2);

r(1) <= m(3);
do2 <= s(3);

cas_e : cas port map(d_in => s(3),  p_in => s(3),   x_c => m(2), p_out => s(4), cin_c => k(4), r_c => m(4) , cout_c => k(3));

r(2) <= m(4);
e2 <= not(s(4));

cas_f : cas port map(d_in => e2,  p_in => s(4),   x_c => a(3), p_out => s(5), cin_c => k(5), r_c => m(5) , cout_c => k(4));

r(3) <= m(5);

cas_g : cas port map(d_in => '1',  p_in => s(5),   x_c => a(4), p_out => s(6), cin_c => k(6), r_c => m(6) , cout_c => k(5));

r(4) <= m(6);
k(6) <= s(6);

end Behavioral;