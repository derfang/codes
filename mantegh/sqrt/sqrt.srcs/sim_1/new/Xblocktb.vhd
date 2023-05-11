-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Xblocktb is
--  Port ( );
end Xblocktb;

architecture Behavioral of Xblocktb is
    component Xblock is
        port ( 
           Di1 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (4 downto 0);
           Pi : in STD_LOGIC_VECTOR (2 downto 1);
           R : out STD_LOGIC_VECTOR (4 downto 0);
           Do : out STD_LOGIC_VECTOR (2 downto 1);
           Co : out STD_LOGIC_VECTOR (2 downto 1)
        );
    end component;


    signal Di1 : STD_LOGIC;
    signal A : STD_LOGIC_VECTOR (4 downto 0);
    signal Pi : STD_LOGIC_VECTOR (2 downto 1);
    signal R : STD_LOGIC_VECTOR (4 downto 0);
    signal Do : STD_LOGIC_VECTOR (2 downto 1);
    signal Co : STD_LOGIC_VECTOR (2 downto 1);
    

begin
    uut : Xblock port map (
        Di1 => Di1,
        A => A,
        Pi => Pi,
        R => R,
        Do => Do,
        Co => Co
    );

    stim_proc: process
    begin
        Di1 <= '0';
        for i in 0 to 31 loop
            A <= std_logic_vector(to_unsigned(i, 5));
            for j in 0 to 3 loop
                Pi <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;

        Di1 <= '1';
        for i in 0 to 31 loop
            A <= std_logic_vector(to_unsigned(i, 5));
            for j in 0 to 3 loop
                Pi <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;

        
    wait;
    end process;
    


end Behavioral;
