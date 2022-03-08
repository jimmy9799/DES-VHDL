library ieee;
use ieee.std_logic_1164.all;
use work.my_components.all;

entity pc1_tb is
end entity;

architecture sim of pc1_tb is
    signal input_key: std_logic_vector(63 downto 0);
    signal key_permuted: std_logic_vector(55 downto 0);
begin
    dut: permuted_choice1 port map (input_key, key_permuted);

    process 
    begin
        input_key <= x"7D0F_18C5_B1B2_FC65";
        wait for 10 ns;
        input_key <= x"7ecc7ef38c661c85";
        wait for 10 ns;
        input_key <= x"125a40dc48bc7b27";
        wait for 10 ns;
        input_key <= x"17f971d98c48aa1b";
        wait for 10 ns;
        input_key <= x"ffffffffffffffff";
        wait for 10 ns;
        report "Sim Ended";
        wait;
    end process;
end architecture;