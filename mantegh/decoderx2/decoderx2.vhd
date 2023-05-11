
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoderx2 is
    Port ( In1 : in  STD_LOGIC_VECTOR (1 downto 0);
           In2 : in  STD_LOGIC_VECTOR (2 downto 0);
           O1 : out  STD_LOGIC_VECTOR (3 downto 0);
           O2 : out  STD_LOGIC_VECTOR (7 downto 0));
end decoderx2;

architecture Behavioral of decoderx2 is

begin
	with In1 select O1 <= "0001" when "00" ,
								 "0010" when "01" ,
								 "0100" when "10" ,
								 "1000" when  others ;
								 
								 
	with In2 select O2 <= "00000001" when "000" ,
								 "00000010" when "001" ,
								 "00000100" when "010" ,
								 "00001000" when "011" ,
								 "00010000" when "100" ,
								 "00100000" when "101" ,
								 "01000000" when "110" ,
								 "10000000" when others ;								 
end Behavioral;

