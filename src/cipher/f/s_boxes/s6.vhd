library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s6 is
	port (
		inp  : in  STD_LOGIC_VECTOR(5 downto 0);
		outp : out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture arch of s6 is
begin
	with inp select outp <=
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) when "000000",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) when "000010",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) when "000100",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) when "000110",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) when "001000",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) when "001010",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) when "001100",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) when "001110",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) when "010000",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) when "010010",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) when "010100",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) when "010110",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) when "011000",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) when "011010",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) when "011100",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) when "011110",

		STD_LOGIC_VECTOR(to_unsigned(10, 4)) when "000001",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) when "000011",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) when "000101",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) when "000111",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) when "001001",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) when "001011",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) when "001101",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) when "001111",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) when "010001",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) when "010011",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) when "010101",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) when "010111",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) when "011001",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) when "011011",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) when "011101",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) when "011111",

		STD_LOGIC_VECTOR(to_unsigned(9, 4)) when "100000",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) when "100010",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) when "100100",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) when "100110",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) when "101000",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) when "101010",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) when "101100",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) when "101110",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) when "110000",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) when "110010",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) when "110100",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) when "110110",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) when "111000",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) when "111010",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) when "111100",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) when "111110",

		STD_LOGIC_VECTOR(to_unsigned(4, 4)) when "100001",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) when "100011",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) when "100101",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) when "100111",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) when "101001",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) when "101011",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) when "101101",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) when "101111",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) when "110001",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) when "110011",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) when "110101",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) when "110111",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) when "111001",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) when "111011",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) when "111101",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) when others;
end architecture;
