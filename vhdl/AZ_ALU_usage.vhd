-- vhdl-linter-disable type-resolved
--now to  use our beloved alu and fifos 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_usage is
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
end entity alu_usage;


architecture rtl of alu_usage is
    component AZ_ALU is
        generic(
            N : integer := 4
        );
        port(
        clk : in std_logic;
        A, B : in signed(N-1 downto 0) := (others => '0');
        output : out signed(N-1 downto 0) := (others => '0');
        op_code : in std_logic_vector(3 downto 0) := "0000";
        read_start : in std_logic := '0';
        idle : out std_logic := '1';
        prosessing : out std_logic := '0';
        writing : out std_logic := '0';
        zero : out std_logic := '0';
        -- valid : out std_logic := '0';
        -- carry : out std_logic := '0';
        negative : out std_logic := '0'
    );
    end component AZ_ALU;

    component fifo is
        generic(
            DATA_WIDTH : integer := 4
        );
        port(
            clk : in std_logic;
            rst : in std_logic;
            push : in std_logic;
            pop : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH-1 downto 0);
            data_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
            empty : out std_logic;
            full : out std_logic
        );
    end component fifo;
-------------------------------------------------------------------------------------------
    signal Aalu : std_logic_vector(N-1 downto 0) := (others => '0');
    signal Balu : std_logic_vector(N-1 downto 0) := (others => '0');
    signal resulttempstd : std_logic_vector(N-1 downto 0) := (others => '0');
    signal resulttempsigned : signed(N-1 downto 0) := (others => '0');
    begin
        resulttempstd <= std_logic_vector(resulttempsigned);
        uut_A : fifo
            generic map(
                DATA_WIDTH => N
            )
            port map(
                clk => clk,
                rst => '0',
                push => apush,
                pop => apull,
                data_in => a,
                data_out => Aalu,--------------------------------------------------------
                empty => open,
                full => open
            );

        uut_B : fifo
            generic map(
                DATA_WIDTH => N
            )
            port map(
                clk => clk,
                rst => '0',
                push => bpush,
                pop => bpull,
                data_in => b,
                data_out => balu,--------------------------------------------------------
                empty => open,
                full => open
            );
        
        uut_alu : AZ_ALU
            generic map(
                N => N
            )
            port map(
                clk => clk,
                A => signed(Aalu),
                B => signed(Balu),
                output => resulttempsigned,
                op_code => op,
                read_start => start,
                idle => idle,
                prosessing => prosessing,
                writing => writing,
                zero => zero,
                negative => negative
            );

        uut_result : fifo
            generic map(
                DATA_WIDTH => N
            )
            port map(
                clk => clk,
                rst => '0',
                push => resultpush,
                pop => resultpull,
                data_in => resulttempstd,--------------------------------------------------------
                data_out => result,
                empty => open,
                full => open
            );
end architecture rtl;





