-- vhdl-linter-disable type-resolved
-- AZ MADAR MANTEGHI's ALU
-- author: DERFANG
-- op_code:
-- 0000: A - B
-- 0001: A and B
-- 0010: A + B
-- 0011: A or B
-- 0100: A * B
-- 0101: A xor B
-- 0110: shift right B(bit wise)
-- 0111: shift left B(bit wise)
-- 1000: move B to output
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AZ_ALU is
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
end entity AZ_ALU;

architecture rtl of AZ_ALU is
    signal output_sig : signed(N-1 downto 0) := (others => '0');
    type FSM_type is (idle_state, prosessing_state, writing_state);
    signal FSM : FSM_type := idle_state;
    signal multresult : signed(2*N-1 downto 0) := (others => '0');
    ----------------------------------------------------------
    begin
        output <= output_sig;
        multresult <= A * B;
    process(clk , read_start) is
    begin
        if rising_edge(clk) or rising_edge(read_start) then
            case FSM is
                when idle_state =>
                    if rising_edge(read_start) then
                        FSM <= prosessing_state;
                        prosessing <= '1';
                        idle <= '0';
                    end if;
                when prosessing_state =>
                        FSM <= writing_state;
                        writing <= '1';
                        prosessing <= '0';
                when writing_state =>
                        FSM <= idle_state;
                        idle <= '1';
                        writing <= '0';
                when others =>
                    null;
            end case;
        end if;
    end process;
                    
----------------------------------------------------------------
        
    process(output_sig) is
    begin
        if output_sig = 0 then
            zero <= '1';
        else
            zero <= '0';
        end if;
        if output_sig(N-1) = '1' then
            negative <= '1';
        else
            negative <= '0';
        end if;
    end process;


    process(FSM) is
    begin
        if FSM = prosessing_state then
            case op_code is
                when  "0000" =>
                    output_sig <= A - B;
                when  "0001" =>
                    output_sig <= A and B;
                when  "0010" =>
                    output_sig <= A + B;
                when  "0011" =>
                    output_sig <= A or B;
                when  "0100" =>
                    output_sig <= multresult(N-1 downto 0);
                when  "0101" =>
                    output_sig <= A xor B;
                when  "0110" =>
                    output_sig <= shift_right(A,1);
                when  "0111" =>
                    output_sig <= shift_left (A,1);
                when  "1000" =>
                    output_sig <= B;
                when others =>
                    null;
            end case;
        end if;
    end process;
end architecture rtl;