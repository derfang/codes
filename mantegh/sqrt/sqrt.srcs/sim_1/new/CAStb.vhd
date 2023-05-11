-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CAStb is
--  Port ( );
end CAStb;

architecture Behavioral of CAStb is
    component CAS
        port(
            P:   in STD_LOGIC;
            D:   in STD_LOGIC;
            X:   in STD_LOGIC;
            Cin: in STD_LOGIC;
            R:   out STD_LOGIC;
            Cout:out STD_LOGIC
        );
    end component;


    signal P:   STD_LOGIC;
    signal D:   STD_LOGIC;
    signal X:   STD_LOGIC;
    signal Cin: STD_LOGIC;
    signal R:   STD_LOGIC;
    signal Cout:STD_LOGIC;

begin
    uu_CAS: CAS
        port map(
            P   => P,
            D   => D,
            X   => X,
            Cin => Cin,
            R   => R,
            Cout=> Cout
        );


    stim_proc: process
    begin
        P <= '0';
        D <= '0';
        X <= '0';
        Cin <= '0';
        wait for 10 ns;

        P <= '0';
        D <= '0';
        X <= '0';
        Cin <= '1';
        wait for 10 ns;

        P <= '0';
        D <= '0';
        X <= '1';
        Cin <= '0';
        wait for 10 ns;

        P <= '0';
        D <= '0';
        X <= '1';
        Cin <= '1';
        wait for 10 ns;

        P <= '0';
        D <= '1';
        X <= '0';
        Cin <= '0';
        wait for 10 ns;

        P <= '0';
        D <= '1';
        X <= '0';
        Cin <= '1';
        wait for 10 ns;

        P <= '0';
        D <= '1';
        X <= '1';
        Cin <= '0';
        wait for 10 ns;

        P <= '0';
        D <= '1';
        X <= '1';
        Cin <= '1';
        wait for 10 ns;

        P <= '1';
        D <= '0';
        X <= '0';
        Cin <= '0';
        wait for 10 ns;

        P <= '1';
        D <= '0';
        X <= '0';
        Cin <= '1';
        wait for 10 ns;

        P <= '1';
        D <= '0';
        X <= '1';
        Cin <= '0';
        wait for 10 ns;

        P <= '1';
        D <= '0';
        X <= '1';
        Cin <= '1';
        wait for 10 ns;

        P <= '1';
        D <= '1';
        X <= '0';
        Cin <= '0';
        wait for 10 ns;

        P <= '1';
        D <= '1';
        X <= '0';
        Cin <= '1';
        wait for 10 ns;

        P <= '1';
        D <= '1';
        X <= '1';
        Cin <= '0';
        wait for 10 ns;

        P <= '1';
        D <= '1';
        X <= '1';
        Cin <= '1';
        wait for 10 ns;


        wait;
    end process;


end Behavioral;
