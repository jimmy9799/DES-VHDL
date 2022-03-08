library ieee;
use ieee.std_logic_1164.all;

entity des_tb is
end entity;

architecture sim of des_tb is
    component des
        port (
            clk, rst      : in STD_LOGIC;
            gen, enc, dec : in STD_LOGIC;
            plaintext     : in  STD_LOGIC_VECTOR(63 downto 0);
            key           : in  STD_LOGIC_VECTOR(63 downto 0);
            ciphertext    : out STD_LOGIC_VECTOR(63 downto 0);
            done_gen, 
            done_enc, 
            done_dec	  : out std_logic;
            ready         : out STD_LOGIC
        );
    end component;

    constant clk_t : time := 10 ns;
    signal clk, rst: std_logic := '1';
    signal gen, enc, dec: std_logic;
    signal plaintext, key, ciphertext: std_logic_vector(63 downto 0);
    signal done_gen, 
           done_enc, 
           done_dec, ready: std_logic;
begin
    dut: des port map (
        clk => clk,
        rst => rst,
        gen => gen,
        enc => enc,
        dec => dec,
        plaintext => plaintext,
        key => key,
        ciphertext => ciphertext,
        done_gen => done_gen,
        done_enc  => done_enc ,
        done_dec => done_dec,
        ready => ready
    );

    clk_gen: process
    begin
        wait for clk_t / 2;
        clk <= not clk;
    end process;

    stim: process 
    begin
        plaintext <= x"9e51c5df6a280123";
        key <= x"0123456789ABCDEF";

        rst <= '0' after 0.75 * clk_t;

        gen <= '0';
        enc <= '0';
        dec <= '0';
        wait for 0.75 * clk_t;
        gen <= '1';
        wait for 16 * clk_t;
        gen <= '0';
        wait for 1*clk_t;
        enc <= '1';
        wait for 16 * clk_t;
        enc <= '0';
        wait for clk_t;
        plaintext <= ciphertext;
        dec <= '1';
        wait for 16 * clk_t;
        dec <= '0';
        wait for clk_t;

        plaintext <= x"0123456789ABCDEF";
        enc <= '1';
        wait for 16 * clk_t;
        enc <= '0';
        wait for clk_t;
        plaintext <= ciphertext;
        dec <= '1';
        wait for 16 * clk_t;
        dec <= '0';
        wait for clk_t;

        report "Sim Ended";
        wait;
    end process;
end architecture;