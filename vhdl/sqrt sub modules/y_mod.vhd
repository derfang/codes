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



entity y_mod is
port (  
        a11 : in std_logic;
		  a12 : in std_logic;
		  
		  a22 : in std_logic;
		  
		  di1 : in std_logic;
		  di2 : in std_logic;
		  
		  ci1 : in std_logic;
		  ci2 : in std_logic;

		  pi1 : in std_logic;
		  pi2 : in std_logic;		  
		  
		  
		  po1 : out std_logic;
		  po2 : out std_logic;
		  
		  co1 : out std_logic;
		  co2 : out std_logic;

		  s21 : out std_logic;
		  s22 : out std_logic;
		  
		  do1 : out std_logic;
		  do2 : out std_logic;
		  
		  s11 : out std_logic
		  );
end y_mod;

architecture Behavioral of y_mod is
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


signal s0 : std_logic;
signal s2 : std_logic;

signal k0 : std_logic;
signal k2 : std_logic;

signal m1 : std_logic;


begin

do1 <= di1;
do2 <= di2;

cas_h : cas port map(d_in => di1,  p_in => pi1,   x_c => a11, p_out => s0, cin_c => k0, r_c => s11 , cout_c => co1);





cas_i : cas port map(d_in => di2,  p_in => s0,   x_c => a12, p_out => po1, cin_c => ci1, r_c => m1 , cout_c => k0);





cas_j : cas port map(d_in => di1,  p_in => pi2,   x_c => m1, p_out => s2, cin_c => k2, r_c => s21 , cout_c => co2);



cas_k : cas port map(d_in => di2,  p_in => s2,   x_c => a22, p_out => po2, cin_c => ci2, r_c => s22 , cout_c => k2);



end Behavioral;