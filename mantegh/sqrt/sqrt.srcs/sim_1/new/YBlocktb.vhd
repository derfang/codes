-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity YBlocktb is
--  Port ( );
end YBlocktb;

architecture Behavioral of YBlocktb is
    component YBlock
        port(
           Di : in STD_LOGIC_VECTOR (2 downto 1);
           A11,A12,A22 : in STD_LOGIC;
           Ci : in STD_LOGIC_VECTOR (2 downto 1);
           Pi : in STD_LOGIC_VECTOR (2 downto 1);
           Po : out STD_LOGIC_VECTOR (2 downto 1);
           Do : out STD_LOGIC_VECTOR (2 downto 1);
           S11,S21,S22 : out STD_LOGIC;
           Co : out STD_LOGIC_VECTOR (2 downto 1)
        );
    end component;

    signal Di : STD_LOGIC_VECTOR (2 downto 1);  
    signal A11,A12,A22 : STD_LOGIC;
    signal Ci : STD_LOGIC_VECTOR (2 downto 1);
    signal Pi : STD_LOGIC_VECTOR (2 downto 1);
    signal Po : STD_LOGIC_VECTOR (2 downto 1);
    signal Do : STD_LOGIC_VECTOR (2 downto 1);
    signal S11,S21,S22 : STD_LOGIC;
    signal Co : STD_LOGIC_VECTOR (2 downto 1);

    

begin
    uut : YBlock port map(
        Di => Di,
        A11 => A11,
        A12 => A12,
        A22 => A22,
        Ci => Ci,
        Pi => Pi,
        Po => Po,
        Do => Do,
        S11 => S11,
        S21 => S21,
        S22 => S22,
        Co => Co
    );


    stimulus : process
    begin
        
        A11 <= '0';
        A12 <= '0';
        A22 <= '0';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;


        A11 <= '0';
        A12 <= '0';
        A22 <= '1';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '0';
        A12 <= '1';
        A22 <= '0';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '0';
        A12 <= '1';
        A22 <= '1';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '1';
        A12 <= '0';
        A22 <= '0';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '1';
        A12 <= '0';
        A22 <= '1';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '1';
        A12 <= '1';
        A22 <= '0';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;

        A11 <= '1';
        A12 <= '1';
        A22 <= '1';
        for i in 0 to 3 loop
            Di <= std_logic_vector(to_unsigned(i,2));
            for j in 0 to 3 loop
                Ci <= std_logic_vector(to_unsigned(j,2));
                for k in 0 to 3 loop
                    Pi <= std_logic_vector(to_unsigned(k,2));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;


        wait;
    end process;


end Behavioral;
