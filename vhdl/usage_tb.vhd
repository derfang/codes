-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
-- test bench for alu usage


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture alu_tb_arch of alu_tb is
    constant N: integer := 4;

    component alu_usage is
        generic(
            N : integer := 4
        );
        port(
            clk : in std_logic := '0';
            op : in std_logic_vector(3 downto 0) := (others => '0');
            start : in std_logic := '0';
            a : in std_logic_vector(N-1 downto 0) := (others => '0');
            b : in std_logic_vector(N-1 downto 0) := (others => '0');
            apush : in std_logic := '0';
            bpush : in std_logic := '0';
            apull : in std_logic := '0';
            bpull : in std_logic := '0';
            resultpush : in std_logic := '0';
            resultpull : in std_logic := '0';
            result : out std_logic_vector(N-1 downto 0) := (others => '0');
            zero, negative, idle, prosessing, writing : out std_logic := '0'
        );
    end component;

    signal clk : std_logic := '0';
    signal op : std_logic_vector(N-1 downto 0) := (others => '0');
    signal start : std_logic := '0';
    signal a : std_logic_vector(N-1 downto 0) := (others => '0');
    signal b : std_logic_vector(N-1 downto 0) := (others => '0');
    signal apush : std_logic := '0';
    signal bpush : std_logic := '0';
    signal apull : std_logic := '0';
    signal bpull : std_logic := '0';
    signal resultpush : std_logic := '0';
    signal resultpull : std_logic := '0';
    signal result : std_logic_vector(N-1 downto 0) := (others => '0');
    signal zero, negative, idle, prosessing, writing : std_logic := '0';


begin
    clk <= not clk after 1 us;
    uut1: alu_usage
        generic map(
            N => N
        )
        port map(
            clk => clk,
            op => op,
            start => start,
            a => a,
            b => b,
            apush => apush,
            bpush => bpush,
            apull => apull,
            bpull => bpull,
            resultpush => resultpush,
            resultpull => resultpull,
            result => result,
            zero => zero,
            negative => negative,
            idle => idle,
            prosessing => prosessing,
            writing => writing
        );

    stim_proc: process
    begin
        op <= "0010"; a <= "0010"; b <= "0010"; start <= '0';
        wait for 2 us;
        apush <= '1';  bpush <= '1';
        wait for 2 us;
        apull <= '1';  bpull <= '1';
        apush <= '0';  bpush <= '0'; start <= '1';
        wait for 2 us;
        apull <= '0';  bpull <= '0'; start <= '0';
        resultpush <= '1';
        wait for 6 us;
        resultpull <= '1';
        resultpush <= '0';
        wait for 2 us;
        resultpull <= '0';
        wait;
    end process;
end architecture;
    
