LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY permuted_choice1 IS
	PORT (
		input_key    : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		key_permuted : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE dataflow OF permuted_choice1 IS
	SIGNAL c, d : STD_LOGIC_VECTOR(27 DOWNTO 0);
BEGIN
	-- c half
	c(27) <= input_key(63 - 57 + 1);
	c(26) <= input_key(63 - 49 + 1);
	c(25) <= input_key(63 - 41 + 1);
	c(24) <= input_key(63 - 33 + 1);
	c(23) <= input_key(63 - 25 + 1);
	c(22) <= input_key(63 - 17 + 1);
	c(21) <= input_key(63 - 9 + 1);
	c(20) <= input_key(63 - 1 + 1);
	c(19) <= input_key(63 - 58 + 1);
	c(18) <= input_key(63 - 50 + 1);
	c(17) <= input_key(63 - 42 + 1);
	c(16) <= input_key(63 - 34 + 1);
	c(15) <= input_key(63 - 26 + 1);
	c(14) <= input_key(63 - 18 + 1);
	c(13) <= input_key(63 - 10 + 1);
	c(12) <= input_key(63 - 2 + 1);
	c(11) <= input_key(63 - 59 + 1);
	c(10) <= input_key(63 - 51 + 1);
	c(9) <= input_key(63 - 43 + 1);
	c(8) <= input_key(63 - 35 + 1);
	c(7) <= input_key(63 - 27 + 1);
	c(6) <= input_key(63 - 19 + 1);
	c(5) <= input_key(63 - 11 + 1);
	c(4) <= input_key(63 - 3 + 1);
	c(3) <= input_key(63 - 60 + 1);
	c(2) <= input_key(63 - 52 + 1);
	c(1) <= input_key(63 - 44 + 1);
	c(0) <= input_key(63 - 36 + 1);

	-- d half
	d(27) <= input_key(63 - 63 + 1);
	d(26) <= input_key(63 - 55 + 1);
	d(25) <= input_key(63 - 47 + 1);
	d(24) <= input_key(63 - 39 + 1);
	d(23) <= input_key(63 - 31 + 1);
	d(22) <= input_key(63 - 23 + 1);
	d(21) <= input_key(63 - 15 + 1);
	d(20) <= input_key(63 - 7 + 1);
	d(19) <= input_key(63 - 62 + 1);
	d(18) <= input_key(63 - 54 + 1);
	d(17) <= input_key(63 - 46 + 1);
	d(16) <= input_key(63 - 38 + 1);
	d(15) <= input_key(63 - 30 + 1);
	d(14) <= input_key(63 - 22 + 1);
	d(13) <= input_key(63 - 14 + 1);
	d(12) <= input_key(63 - 6 + 1);
	d(11) <= input_key(63 - 61 + 1);
	d(10) <= input_key(63 - 53 + 1);
	d(9) <= input_key(63 - 45 + 1);
	d(8) <= input_key(63 - 37 + 1);
	d(7) <= input_key(63 - 29 + 1);
	d(6) <= input_key(63 - 21 + 1);
	d(5) <= input_key(63 - 13 + 1);
	d(4) <= input_key(63 - 5 + 1);
	d(3) <= input_key(63 - 28 + 1);
	d(2) <= input_key(63 - 20 + 1);
	d(1) <= input_key(63 - 12 + 1);
	d(0) <= input_key(63 - 4 + 1);

	key_permuted <= c & d;
END ARCHITECTURE;
