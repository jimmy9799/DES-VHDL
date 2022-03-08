library ieee;
use ieee.std_logic_1164.all;

entity des_controller_tb is
end entity;

architecture sim of des_controller_tb is
    component des_controller is
        port (  clk, rst: in std_logic;
                gen, enc, dec: in std_logic;
                cnt: out std_logic_vector(3 downto 0);
                wr_en: out std_logic;
                done_gen, 
                done_enc, 
                done_dec	  : out std_logic;
                ready: out std_logic
            );
    end component;

    constant clk_t : time := 10 ns;
    signal clk, rst: std_logic := '1';
    signal gen, enc, dec: std_logic;
    signal cnt: std_logic_vector(3 downto 0);
    signal wr_en: std_logic;
    signal done_gen, 
           done_enc, 
           done_dec, ready: std_logic;
begin
    dut: des_controller port map (
        clk => clk,
        rst => rst,
        gen => gen,
        enc => enc,
        dec => dec,
        cnt => cnt,
        wr_en => wr_en,
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
        dec <= '1';
        wait for 16 * clk_t;
        dec <= '0';

        report "Sim Ended";
        wait;
    end process;
end architecture;