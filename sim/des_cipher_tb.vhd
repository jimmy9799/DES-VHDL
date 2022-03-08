library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity des_cipher_tb is
end entity;

architecture sim of des_cipher_tb is
    COMPONENT des_cipher
        PORT (
            clk, rst   : IN  STD_LOGIC;
            plaintext  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
            round_key  : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
            sel        : IN  STD_LOGIC;
            ciphertext : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
        );
    END COMPONENT; 

    constant clk_t     : TIME := 10 ns;

    signal clk, rst   : STD_LOGIC := '1';
    signal plaintext  : STD_LOGIC_VECTOR(63 DOWNTO 0);
    signal round_key  : STD_LOGIC_VECTOR(47 DOWNTO 0);
    signal sel        : STD_LOGIC := '1';
    signal ciphertext : STD_LOGIC_VECTOR(63 DOWNTO 0);

    type round_keys_type is array (0 to 15) of std_logic_vector(47 downto 0);
    signal round_keys : round_keys_type := (
        x"0b02679b49a5",
        x"69a659256a26",
        x"45d48ab428d2",
        x"7289d2a58257",
        x"3ce80317a6c2",
        x"23251e3c8545",
        x"6c04950ae4c6",
        x"5788386ce581",
        x"c0c9e926b839",
        x"91e307631d72",
        x"211f830d893a",
        x"7130e5455c54",
        x"91c4d04980fc",
        x"5443b681dc8d",
        x"b691050a16b5",
        x"ca3d03b87032"
    );
begin
    dut: des_cipher PORT MAP (
        clk=> clk,
        rst => rst ,
        plaintext=> plaintext,
        round_key=> round_key,
        sel=> sel,
        ciphertext=> ciphertext
    );

    clk_gen: process
    begin
        wait for clk_t / 2;
        clk <= not clk;
    end process;

    stim: process
    begin
        rst <= '0' after 0.75 * clk_t;
        sel <= '0' after 2 * clk_t;
        plaintext <= x"0123456789abcdef";
        round_key <= round_keys(0);

        for i in 0 to 15 loop
            wait for clk_t;
            round_key <= round_keys(i);
        end loop;

        report "Sim ended";
        wait;
    end process;
end architecture;