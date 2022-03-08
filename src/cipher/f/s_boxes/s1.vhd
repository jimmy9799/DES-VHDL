LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY s1 IS
	PORT (
		inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF s1 IS
BEGIN
	WITH inp SELECT outp <=
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) WHEN "000000",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) WHEN "000010",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) WHEN "000100",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) WHEN "000110",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) WHEN "001000",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) WHEN "001010",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) WHEN "001100",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) WHEN "001110",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) WHEN "010000",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) WHEN "010010",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) WHEN "010100",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) WHEN "010110",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) WHEN "011000",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) WHEN "011010",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) WHEN "011100",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) WHEN "011110",

		STD_LOGIC_VECTOR(to_unsigned(0, 4)) WHEN "000001",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) WHEN "000011",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) WHEN "000101",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) WHEN "000111",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) WHEN "001001",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) WHEN "001011",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) WHEN "001101",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) WHEN "001111",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) WHEN "010001",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) WHEN "010011",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) WHEN "010101",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) WHEN "010111",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) WHEN "011001",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) WHEN "011011",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) WHEN "011101",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) WHEN "011111",

		STD_LOGIC_VECTOR(to_unsigned(4, 4)) WHEN "100000",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) WHEN "100010",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) WHEN "100100",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) WHEN "100110",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) WHEN "101000",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) WHEN "101010",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) WHEN "101100",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) WHEN "101110",
		STD_LOGIC_VECTOR(to_unsigned(15, 4)) WHEN "110000",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) WHEN "110010",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) WHEN "110100",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) WHEN "110110",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) WHEN "111000",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) WHEN "111010",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) WHEN "111100",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) WHEN "111110",

		STD_LOGIC_VECTOR(to_unsigned(15, 4)) WHEN "100001",
		STD_LOGIC_VECTOR(to_unsigned(12, 4)) WHEN "100011",
		STD_LOGIC_VECTOR(to_unsigned(8, 4)) WHEN "100101",
		STD_LOGIC_VECTOR(to_unsigned(2, 4)) WHEN "100111",
		STD_LOGIC_VECTOR(to_unsigned(4, 4)) WHEN "101001",
		STD_LOGIC_VECTOR(to_unsigned(9, 4)) WHEN "101011",
		STD_LOGIC_VECTOR(to_unsigned(1, 4)) WHEN "101101",
		STD_LOGIC_VECTOR(to_unsigned(7, 4)) WHEN "101111",
		STD_LOGIC_VECTOR(to_unsigned(5, 4)) WHEN "110001",
		STD_LOGIC_VECTOR(to_unsigned(11, 4)) WHEN "110011",
		STD_LOGIC_VECTOR(to_unsigned(3, 4)) WHEN "110101",
		STD_LOGIC_VECTOR(to_unsigned(14, 4)) WHEN "110111",
		STD_LOGIC_VECTOR(to_unsigned(10, 4)) WHEN "111001",
		STD_LOGIC_VECTOR(to_unsigned(0, 4)) WHEN "111011",
		STD_LOGIC_VECTOR(to_unsigned(6, 4)) WHEN "111101",
		STD_LOGIC_VECTOR(to_unsigned(13, 4)) WHEN OTHERS;
END ARCHITECTURE;
