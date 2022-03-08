library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity key_schedule_tb is
end entity;

architecture sim of key_schedule_tb is
    COMPONENT key_schedule
        PORT (
            clk, rst  : IN  STD_LOGIC;
            key       : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
            round_id  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            sel       : IN  STD_LOGIC;
            round_key : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
        );
    END COMPONENT;

    constant clk_t     : TIME := 10 ns;

    signal clk, rst  : STD_LOGIC := '1';
    signal key       : STD_LOGIC_VECTOR(63 DOWNTO 0);
    signal round_id  : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal sel       : STD_LOGIC := '1';
    signal round_key : STD_LOGIC_VECTOR(47 DOWNTO 0);
begin
    dut: key_schedule PORT MAP (
        clk => clk,
        rst => rst,
        key => key,
        round_id => round_id,
        sel => sel,
        round_key => round_key
    );

    clk_gen: process
    begin
        wait for clk_t / 2;
        clk <= not clk;
    end process;

    stim: process
    begin
        rst <= '0' after 0.75 * clk_t;

        key <= x"0123456789abcdef";
        round_id <= (others => '0');
        sel <= '0' after 2 * clk_t;
        for i in 0 to 15 loop
            wait for clk_t;
            round_id <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
        end loop;
        
        report "Sim ended";
        wait;
    end process;
end architecture;