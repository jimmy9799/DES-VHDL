library ieee;
use ieee.std_logic_1164.all;
use work.my_components.all;

entity s1_tb is
end entity;

architecture sim of s1_tb is
    signal inp: std_logic_vector(5 downto 0);
    signal outp: std_logic_vector(3 downto 0);
begin
    dut: s1 port map (inp, outp);

    process 
    begin
        inp <= "011100";
        wait for 10 ns;
        inp <= "111110";
        wait for 10 ns;
        inp <= "001101";
        wait for 10 ns;
        inp <= "101100";
        wait for 10 ns;
        inp <= "111111";
        wait for 10 ns;
        report "Sim Ended";
        wait;
    end process;
end architecture ; 