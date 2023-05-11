library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x2 is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           C : in  STD_LOGIC_VECTOR (1 downto 0);
           D : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (1 downto 0));
end mux4x2;

architecture Behavioral of mux4x2 is

begin
	with s select o <= A when "00",
							 B when "01",
							 C when "10",
							 D when others;


end Behavioral;

