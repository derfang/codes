-- vhdl-linter-disable unused
-- vhdl-linter-disable type-resolved
-- This is the implimantation of our computer especially the Control Unit
-- using the components we have already defined

library IEEE;
use IEEE.std_logic_1164.all;

entity computer is
    port(
        clk : in std_logic 
        );
end computer;

architecture arch of computer is
    component ALU is
        port (a,b: in std_logic_vector(15 downto 0) ;  
          op_select: in std_logic_vector(2 downto 0);
          result: out std_logic_vector(15 downto 0);
          Ein: in std_logic;
          Eout: out std_logic);
    end component;

    component acumulator is
        Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC :='0';
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
           LD : in  STD_LOGIC :='0' ;
           INC : in  STD_LOGIC :='0' );
    end component;

    component AR is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC :='0';
               data_in : in  STD_LOGIC_VECTOR (9 downto 0);
               data_out : out  STD_LOGIC_VECTOR (9 downto 0) :=(others => '0');
               LD : in  STD_LOGIC :='0' ;
               INC : in  STD_LOGIC :='0' );
    end component;

    component DR is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC :='0';
               data_in : in  STD_LOGIC_VECTOR (15 downto 0);
               data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
               LD : in  STD_LOGIC :='0' ;
               INC : in  STD_LOGIC :='0' );
    end component;

    component Extrabit is
        port (
            clk : in std_logic;
            reset : in std_logic;
            colmpliment : in std_logic;
            data_in : in std_logic;
            data_out : out std_logic
        );
    end component;

    component IR is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC :='0';
               data_in : in  STD_LOGIC_VECTOR (15 downto 0);
               data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
               LD : in  STD_LOGIC :='0' );
    end component;

    component PC is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC :='0';
               data_in : in  STD_LOGIC_VECTOR (15 downto 0);
               data_out : out  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
               LD : in  STD_LOGIC :='0' ;
               INC : in  STD_LOGIC :='0' );
    end component;

    component ram is
        port(
            clk: in std_logic;
            address: in std_logic_vector(9 downto 0);
            data_in: in std_logic_vector(15 downto 0);
            data_out: out std_logic_vector(15 downto 0);
            readF: in std_logic;
            writeF: in std_logic
        );
    end component;


    component SC is
        port (clk, reset: in std_logic;
              count: inout std_logic_vector(2 downto 0));
    end component;
    

    component rom is
        Port ( address : in  STD_LOGIC_VECTOR (15 downto 0);
               data : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

    --------------------------------------------------------------------
    signal ram_in , ram_out ,  PC_in , PC_out , DR_in , DR_out : std_logic_vector(15 downto 0);
    signal AR_in , AR_out , ram_add : std_logic_vector(9 downto 0);
    signal ALU_in1 , ALU_in2 , ALU_out , AC_in , AC_out , IR_in , IR_out : std_logic_vector(15 downto 0);
    signal mem_read , mem_write , AR_LD , AR_INC , AR_reset , PC_LD , PC_INC , PC_reset , DR_LD , DR_INC , DR_reset : std_logic;
    signal AC_LD , AC_INC , AC_reset , IR_LD , IR_reset  , Eout , Ein : std_logic;
    signal SC_count , ALU_select : std_logic_vector(2 downto 0);
    signal HALT: std_logic := '0';
    signal SC_reset , ALU_Ein , ALU_Eout : std_logic;
    signal rom_data , rom_add : std_logic_vector(15 downto 0);
    signal Extrabit_in , Extrabit_out , Extrabit_reset , Extrabit_compliment : std_logic;
    signal opt_code : std_logic_vector(5 downto 0);
    -----------------------------------------------------------------------------------------------------
begin
    uut_ram : ram port map(clk => clk , address => ram_add , data_in => ram_in , data_out => ram_out , readF => mem_read , writeF => mem_write);
    uut_AR : AR port map(clk => clk , reset => AR_reset , data_in => AR_in , data_out => AR_out , LD => AR_LD , INC => AR_INC);
    uut_PC : PC port map(clk => clk , reset => PC_reset , data_in => PC_in , data_out => PC_out , LD => PC_LD , INC => PC_INC);
    uut_DR : DR port map(clk => clk , reset => DR_reset , data_in => DR_in , data_out => DR_out , LD => DR_LD , INC => DR_INC);
    uut_AC : acumulator port map(clk => clk , reset => AC_reset , data_in => AC_in , data_out => AC_out , LD => AC_LD , INC => AC_INC);
    uut_IR : IR port map(clk => clk , reset => IR_reset , data_in => IR_in , data_out => IR_out , LD => IR_LD);
    uut_ALU : ALU port map(a => ALU_in1 , b => ALU_in2 , op_select => ALU_select , result => ALU_out , Ein => ALU_Ein , Eout => ALU_Eout);
    uut_SC : SC port map(clk => clk , reset => SC_reset , count => SC_count);
    uut_rom : rom port map(address => rom_add , data => rom_data);
    uut_Extrabit : Extrabit port map(clk => clk , reset => Extrabit_reset , colmpliment => Extrabit_compliment , data_in => Extrabit_in , data_out => Extrabit_out);
    -----------------------------------------------------------------------------------------------------------
    ---------------this part is the implimentation of coumputer -----------------------------------------------
    -----------------------------------------------------------------------------------------------------------
    rom_add <= PC_out;
    IR_in <= rom_data;
    ram_add <= AR_out;
    ram_in <= AC_out;
    DR_in <= ram_out;
    AC_in <= ALU_out;
    ALU_in1 <= AC_out;
    ALU_in2 <= DR_out;
    AR_in <= IR_out(9 downto 0);
    opt_code <= IR_out(15 downto 10);
    extrabit_in <= ALU_Eout;
    ALU_Ein <= Extrabit_out;
    PC_in <= "0000000000000000";
    PC_LD <= '0';
    PC_reset <= '0';
    DR_reset <= '0';
    AR_INC <= '0';
    DR_INC <= '0';
    Extrabit_compliment <= '0';



    -----------------------------------------------------------------------------------------------------------
    ---------------this part is the implimentation of control unit------------------------------------------------
    -----------------------------------------------------------------------------------------------------------
    process(opt_code , SC_count , HALT , AC_out , Extrabit_out , clk) 
    begin
        IR_LD <= '0';
        IR_reset <= '0';
        PC_INC <= '0';
        AR_LD <= '0';
        AR_reset <= '0';
        DR_LD <= '0';
        mem_read <= '0';
        mem_write <= '0';
        AC_LD <= '0';
        AC_INC <= '0';
        AC_reset <= '0';
        extrabit_reset <= '0';
        SC_reset <= '0';

    if HALT = '0' then
        if SC_count = "000" then------------------------------------------------------------------------
            IR_LD <= '1';
            PC_INC <= '1';
        elsif SC_count = "001" then---------------------------------------------------------------------
            AR_LD <= '1';
            -- if opt_code = "000011" then --load
            --     mem_read <= '1';
            -- elsif opt_code = "000010" then --add
            --     mem_read <= '1';
            -- elsif opt_code = "010000" then --MUL
            --     mem_read <= '1';
            -- elsif opt_code = "100000" then --SQR
            --     mem_read <= '1';
            -- end if;
        elsif SC_count = "010" then---------------------------------------------------------------------
            if opt_code = "000001" then   --and
                mem_read <= '1';
            elsif opt_code = "000010" then  --store
                mem_write <= '1';
            elsif opt_code = "000011" then  --load
                AC_reset <= '1';
                mem_read <= '1';
            elsif opt_code = "000100" then  --add
                mem_read <= '1';
            elsif opt_code = "000101" then  --INC
                AC_INC <= '1';
            elsif opt_code = "000110" then  --CLA
                AC_reset <= '1';
            elsif opt_code = "000111" then  --CLE
                Extrabit_reset <= '1';
            elsif opt_code = "001000" then  --CIL
                -- AC_LD <= '1';
                ALU_select <= "010";
            elsif opt_code = "001001" then  --CIR
                -- AC_LD <= '1';
                ALU_select <= "011";
            elsif opt_code = "001010" then  --SPA
                if AC_out(15) = '0' then
                    PC_INC <= '1';
                end if;
            elsif opt_code = "001011" then  --SNA
                if AC_out(15) = '1' then
                    PC_INC <= '1';
                end if;
            elsif opt_code = "001100" then  --SZE
                if Extrabit_out = '0' then
                    PC_INC <= '1';
                end if;
            elsif opt_code = "001101" then  --SZA
                if AC_out = "0000000000000000" then
                    PC_INC <= '1';
                end if;
            elsif opt_code = "001110" then  --LLS
                -- AC_LD <= '1';
                ALU_select <= "100";
            elsif opt_code = "001111" then  --LRS
                -- AC_LD <= '1';
                ALU_select <= "101";
            elsif opt_code = "010000" then  --MUL
                mem_read <= '1';
            elsif opt_code = "100000" then  --SQR
                mem_read <= '1';
            else                            --HLT
                HALT <= '1';
            end if;
        elsif SC_count = "011" then---------------------------------------------------------------------
            if opt_code = "000001" then   --and
                DR_LD <= '1';
                ALU_select <= "000";
            elsif opt_code = "000011" then  --load
                DR_LD <= '1';
                ALU_select <= "001";
            elsif opt_code = "000100" then  --add
                DR_LD <= '1';
                ALU_select <= "001";
            elsif opt_code = "010000" then --MUL
                DR_LD <= '1';
                ALU_select <= "110";
            elsif opt_code = "100000" then --SQR
                DR_LD <= '1';
                ALU_select <= "111";
            elsif opt_code = "001000" then  --CIL
                AC_LD <= '1';
                SC_reset <= '1';
            elsif opt_code = "001001" then  --CIR
                AC_LD <= '1';
                SC_reset <= '1';
            elsif opt_code = "001110" then  --LLS  
                AC_LD <= '1';
                SC_reset <= '1';
            elsif opt_code = "001111" then  --LRS
                AC_LD <= '1';
                SC_reset <= '1';
            end if;
        elsif SC_count = "100" then---------------------------------------------------------------------
            SC_reset <= '1';
            if opt_code = "000011" then   --load
                AC_LD <= '1';
            elsif opt_code = "000100" then  --and
                AC_LD <= '1';
            elsif opt_code = "000101" then  --add
                AC_LD <= '1';
            elsif opt_code = "010000"  then  --MUL
                AC_LD <= '1';
            elsif opt_code = "100000" then  --SQR
                AC_LD <= '1';
            end if;
        end if;
    end if;
end process;
end arch;

