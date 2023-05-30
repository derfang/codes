-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity sqrt is
port (  ai : in std_logic_vector(16 downto 1);
		  
		  ro : out std_logic_vector(16 downto 7);
		  q : out std_logic_vector(8 downto 1);
        nc : out std_logic_vector(14 downto 0)
		  );
end sqrt;



architecture Behavioral of sqrt is
component x_mod is
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
end component;


component y_mod is
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
end component;




















signal r_x  :  std_logic_vector(19 downto 0);
signal do1_x : std_logic_vector(3 downto 0);
signal do2_x : std_logic_vector(3 downto 0);
signal co1_x : std_logic_vector(3 downto 0);
signal co2_x : std_logic_vector(3 downto 0);


signal a11_y : std_logic_vector(5 downto 0);
signal a12_y : std_logic_vector(5 downto 0);
		  
signal a22_y : std_logic_vector(5 downto 0);
		  
signal di1_y : std_logic_vector(5 downto 0);
signal di2_y : std_logic_vector(5 downto 0);
		  
signal ci1_y : std_logic_vector(5 downto 0);
signal ci2_y : std_logic_vector(5 downto 0);

signal pi1_y : std_logic_vector(5 downto 0);
signal pi2_y : std_logic_vector(5 downto 0);		  
		  
		  
signal po1_y : std_logic_vector(5 downto 0);
signal po2_y : std_logic_vector(5 downto 0);
		  
signal co1_y : std_logic_vector(5 downto 0);
signal co2_y : std_logic_vector(5 downto 0);

signal s21_y : std_logic_vector(5 downto 0);
signal s22_y : std_logic_vector(5 downto 0);
		  
signal do1_y : std_logic_vector(5 downto 0);
signal do2_y : std_logic_vector(5 downto 0);
		  
signal s11_y : std_logic_vector(5 downto 0);





begin



x_mod_1 : x_mod port map(di1 => '0',a(0) => '1' , a(4 downto 1) => ai(4 downto 1),   pi1 => '1', co1 => co1_x(0), pi2 => co1_x(0) , co2 => co2_x(0), do1 => do1_x(0) ,do2 => do2_x(0) , r(4 downto 0) => r_x(4 downto 0)) ;

q(1) <= co1_x(0);
q(2) <= co2_x(0);
nc(0) <= r_x(0);
nc(1) <= r_x(1);





y_mod_1 : y_mod port map(di1 => do1_x(0),  a11 => r_x(2),   di2 => do2_x(0), a12 => r_x(3), po1 => po1_y(0), ci1 => co1_x(1) , a22 => r_x(5), po2 => po2_y(0) ,ci2 => co2_x(1) , s22 => s22_y(0) , do2 => do2_y(0) , s21 => s21_y(0) , do1 => do1_y(0) , co2 => co2_y(0) , pi2 => co1_y(0) , s11 => s11_y(0) , co1 => co1_y(0) , pi1 => co2_x(0)) ;

nc(2) <= s11_y(0);
q(3) <= co1_y(0);
q(4) <= co2_y(0);
nc(3) <= s21_y(0);






x_mod_2 : x_mod port map(di1 => po1_y(0), a(0) => r_x(4) , a(4 downto 1) => ai(8 downto 5),   pi1 => po1_y(0), co1 => co1_x(1),  pi2 => po2_y(0) , co2 => co2_x(1), do1 => do1_x(1) ,do2 => do2_x(1) , r(4 downto 0) => r_x(9 downto 5)) ;









y_mod_2 : y_mod port map(di1 => do1_y(0),  a11 => s22_y(0),   di2 => do2_y(0), a12 => r_x(6), po1 => po1_y(1), ci1 => co1_y(2) , a22 => s11_y(2), po2 => po2_y(1) ,ci2 => co2_y(2) , s22 => s22_y(1) , do2 => do2_y(1) , s21 => s21_y(1) , do1 => do1_y(1) , co2 => co2_y(1) , pi2 => co1_y(1) , s11 => s11_y(1) , co1 => co1_y(1) , pi1 => co2_y(0)) ;


nc(4) <= s11_y(1);
q(5) <= co1_y(1);
q(6) <= co2_y(1);
nc(5) <= s21_y(1);






y_mod_3 : y_mod port map(di1 => do1_x(1),  a11 => r_x(7),   di2 => do2_x(1), a12 => r_x(8), po1 => po1_y(2), ci1 => co1_x(2) , a22 => r_x(10), po2 => po2_y(2) ,ci2 => co2_x(2) , s22 => s22_y(2) , do2 => do2_y(2) , s21 => s21_y(2) , do1 => do1_y(2) , co2 => co2_y(2) , pi2 => po2_y(1) , s11 => s11_y(2) , co1 => co1_y(2) , pi1 => po1_y(1)) ;








x_mod_3 : x_mod port map(di1 => po1_y(2), a(0) => r_x(9) , a(4 downto 1) => ai(12 downto 9),   pi1 => po1_y(2), co1 => co1_x(2),  pi2 => po2_y(2) , co2 => co2_x(2), do1 => do1_x(2) ,do2 => do2_x(2) , r(4 downto 0) => r_x(14 downto 10)) ;







y_mod_4 : y_mod port map(di1 => do1_y(1),  a11 => s22_y(1),   di2 => do2_y(1), a12 => s21_y(2), po1 => po1_y(3), ci1 => co1_y(4) , a22 => s11_y(4), po2 => po2_y(3) ,ci2 => co2_y(4) , s22 => s22_y(3) , do2 => do2_y(3) , s21 => s21_y(3) , do1 => do1_y(3) , co2 => co2_y(3) , pi2 => co1_y(3) , s11 => s11_y(3) , co1 => co1_y(3) , pi1 => co2_y(1)) ;


nc(6) <= s11_y(3);
q(7) <= co1_y(3);
q(8) <= co2_y(3);
nc(7) <= do2_y(3);
nc(8) <= do1_y(3);
ro(7) <= s21_y(3);
ro(8) <= s22_y(3);






y_mod_5 : y_mod port map(di1 => do1_y(2),  a11 => s22_y(2),   di2 => do2_y(2), a12 => r_x(11), po1 => po1_y(4), ci1 => co1_y(5) , a22 => s11_y(5), po2 => po2_y(4) ,ci2 => co2_y(5) , s22 => s22_y(4) , do2 => do2_y(4) , s21 => s21_y(4) , do1 => do1_y(4) , co2 => co2_y(4) , pi2 => po2_y(3) , s11 => s11_y(4) , co1 => co1_y(4) , pi1 => po1_y(3)) ;


nc(9) <= do1_y(4);
ro(9) <= s21_y(4);
nc(10) <= do2_y(4);
ro(10) <= s22_y(4);






y_mod_6 : y_mod port map(di1 => do1_x(2),  a11 => r_x(12),   di2 => do2_x(2), a12 => r_x(13), po1 => po1_y(5), ci1 => co1_x(3) , a22 => r_x(15), po2 => po2_y(5) ,ci2 => co2_x(3) , s22 => s22_y(5) , do2 => do2_y(5) , s21 => s21_y(5) , do1 => do1_y(5) , co2 => co2_y(5) , pi2 => po2_y(4) , s11 => s11_y(5) , co1 => co1_y(5) , pi1 => po1_y(4)) ;


nc(11) <= do1_y(5);
ro(11) <= s21_y(5);
nc(12) <= do2_y(5);
ro(12) <= s22_y(5);








x_mod_4 : x_mod port map(di1 => po1_y(5), a(0) => r_x(14) , a(4 downto 1) => ai(16 downto 13),   pi1 => po1_y(5), co1 => co1_x(3),  pi2 => po2_y(5) , co2 => co2_x(3), do1 => do1_x(3) ,do2 => do2_x(3) , r(4 downto 0) => r_x(19 downto 15)) ;

nc(13) <= do1_x(3);
ro(13) <= r_x(16);
nc(14) <= do2_x(3);
ro(14) <= r_x(17);
ro(15) <= r_x(18);
ro(16) <= r_x(19);






end Behavioral;