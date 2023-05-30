--aurhor : DERFANG
-- vhdl-linter-disable type-resolved
library ieee;
use ieee.std_logic_1164.all;


entity arraymulty is
    port (
        x: in  std_logic_vector (5 downto 0);
        y: in  std_logic_vector (5 downto 0);
        p: out std_logic_vector (11 downto 0)
    );
end arraymulty;

architecture Behavioral of arraymulty is

component FA
	Port (  A : in STD_LOGIC;
		B : in STD_LOGIC;
		Cin : in STD_LOGIC;
		S : out STD_LOGIC;
		Cout : out STD_LOGIC);
end component;
	 



-- Intermediate Carry declaration
    signal A0, A1, A2 ,A3 ,A4 ,A5:  std_logic_vector (4 downto 0);
    signal B0, B1, B2 ,B3 ,B4 ,B5:  std_logic_vector (4 downto 0);
    signal C0, C1, C2 ,C3 ,C4 ,C5:  std_logic_vector (4 downto 0);




begin
	p(0) <= x(0) and y(0);
	A0 <= (x(4) and y(1), x(3) and y(1), x(2) and y(1), x(1) and y(1), x(0) and y(1));
    B0 <= (x(5) and y(0), x(4) and y(0), x(3) and y(0), x(2) and y(0), x(1) and y(0));
	C0 <= "00000";
	p(0) <= x(0) and y(0);
	B1(4) <= x(5) and y(1);

		stage00:FA port map (A0(0),B0(0),C0(0),p(1) ,C1(0));
		stage01:FA port map (A0(1),B0(1),C0(1),B1(0),C1(1));
		stage02:FA port map (A0(2),B0(2),C0(2),B1(1),C1(2));
		stage03:FA port map (A0(3),B0(3),C0(3),B1(2),C1(3));
		stage04:FA port map (A0(4),B0(4),C0(4),B1(3),C1(4));
--------------------------------------------------------------------------------------------
	A1 <= (x(4) and y(2), x(3) and y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
	B2(4) <= x(5) and y(2);
	
		stage10:FA port map (A1(0),B1(0),C1(0),p(2) ,C2(0));
		stage11:FA port map (A1(1),B1(1),C1(1),B2(0),C2(1));
		stage12:FA port map (A1(2),B1(2),C1(2),B2(1),C2(2));
		stage13:FA port map (A1(3),B1(3),C1(3),B2(2),C2(3));
		stage14:FA port map (A1(4),B1(4),C1(4),B2(3),C2(4));
--------------------------------------------------------------------------------------------
	A2 <= (x(4) and y(3), x(3) and y(3), x(2) and y(3), x(1) and y(3), x(0) and y(3));
	B3(4) <= x(5) and y(3);
	
		stage20:FA port map (A2(0),B2(0),C2(0),p(3) ,C3(0));
		stage21:FA port map (A2(1),B2(1),C2(1),B3(0),C3(1));
		stage22:FA port map (A2(2),B2(2),C2(2),B3(1),C3(2));
		stage23:FA port map (A2(3),B2(3),C2(3),B3(2),C3(3));
		stage24:FA port map (A2(4),B2(4),C2(4),B3(3),C3(4));
--------------------------------------------------------------------------------------------
	A3 <= (x(4) and y(4), x(3) and y(4), x(2) and y(4), x(1) and y(4), x(0) and y(4));
	B4(4) <= x(5) and y(4);
	
		stage30:FA port map (A3(0),B3(0),C3(0),p(4) ,C4(0));
		stage31:FA port map (A3(1),B3(1),C3(1),B4(0),C4(1));
		stage32:FA port map (A3(2),B3(2),C3(2),B4(1),C4(2));
		stage33:FA port map (A3(3),B3(3),C3(3),B4(2),C4(3));
		stage34:FA port map (A3(4),B3(4),C3(4),B4(3),C4(4));
--------------------------------------------------------------------------------------------
	A4 <= (x(4) and y(5), x(3) and y(5), x(2) and y(5), x(1) and y(5), x(0) and y(5));
	B5(4) <= x(5) and y(5);
	
		stage40:FA port map (A4(0),B4(0),C4(0),p(5) ,C5(0));
		stage41:FA port map (A4(1),B4(1),C4(1),B5(0),C5(1));
		stage42:FA port map (A4(2),B4(2),C4(2),B5(1),C5(2));
		stage43:FA port map (A4(3),B4(3),C4(3),B5(2),C5(3));
		stage44:FA port map (A4(4),B4(4),C4(4),B5(3),C5(4));
--------------------------------------------------------------------------------------------
	A5(0) <= '0';

		stage50:FA port map (A5(0),B5(0),C5(0),p(6) ,A5(1));
		stage51:FA port map (A5(1),B5(1),C5(1),p(7) ,A5(2));
		stage52:FA port map (A5(2),B5(2),C5(2),p(8) ,A5(3));
		stage53:FA port map (A5(3),B5(3),C5(3),p(9) ,A5(4));
		stage54:FA port map (A5(4),B5(4),C5(4),p(10),p(11));
--------------------------------------------------------------------------------------------

	
	
	
end Behavioral;