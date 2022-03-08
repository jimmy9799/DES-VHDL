LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY permuted_choice2 IS
	PORT (
		inp          : IN  STD_LOGIC_VECTOR(55 DOWNTO 0);
		inp_permuted : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE dataflow OF permuted_choice2 IS
BEGIN
	inp_permuted(47) <= inp(55 - 14 + 1);
	inp_permuted(46) <= inp(55 - 17 + 1);
	inp_permuted(45) <= inp(55 - 11 + 1);
	inp_permuted(44) <= inp(55 - 24 + 1);
	inp_permuted(43) <= inp(55 - 1 + 1);
	inp_permuted(42) <= inp(55 - 5 + 1);
	inp_permuted(41) <= inp(55 - 3 + 1);
	inp_permuted(40) <= inp(55 - 28 + 1);
	inp_permuted(39) <= inp(55 - 15 + 1);
	inp_permuted(38) <= inp(55 - 6 + 1);
	inp_permuted(37) <= inp(55 - 21 + 1);
	inp_permuted(36) <= inp(55 - 10 + 1);
	inp_permuted(35) <= inp(55 - 23 + 1);
	inp_permuted(34) <= inp(55 - 19 + 1);
	inp_permuted(33) <= inp(55 - 12 + 1);
	inp_permuted(32) <= inp(55 - 4 + 1);
	inp_permuted(31) <= inp(55 - 26 + 1);
	inp_permuted(30) <= inp(55 - 8 + 1);
	inp_permuted(29) <= inp(55 - 16 + 1);
	inp_permuted(28) <= inp(55 - 7 + 1);
	inp_permuted(27) <= inp(55 - 27 + 1);
	inp_permuted(26) <= inp(55 - 20 + 1);
	inp_permuted(25) <= inp(55 - 13 + 1);
	inp_permuted(24) <= inp(55 - 2 + 1);
	inp_permuted(23) <= inp(55 - 41 + 1);
	inp_permuted(22) <= inp(55 - 52 + 1);
	inp_permuted(21) <= inp(55 - 31 + 1);
	inp_permuted(20) <= inp(55 - 37 + 1);
	inp_permuted(19) <= inp(55 - 47 + 1);
	inp_permuted(18) <= inp(55 - 55 + 1);
	inp_permuted(17) <= inp(55 - 30 + 1);
	inp_permuted(16) <= inp(55 - 40 + 1);
	inp_permuted(15) <= inp(55 - 51 + 1);
	inp_permuted(14) <= inp(55 - 45 + 1);
	inp_permuted(13) <= inp(55 - 33 + 1);
	inp_permuted(12) <= inp(55 - 48 + 1);
	inp_permuted(11) <= inp(55 - 44 + 1);
	inp_permuted(10) <= inp(55 - 49 + 1);
	inp_permuted(9) <= inp(55 - 39 + 1);
	inp_permuted(8) <= inp(55 - 56 + 1);
	inp_permuted(7) <= inp(55 - 34 + 1);
	inp_permuted(6) <= inp(55 - 53 + 1);
	inp_permuted(5) <= inp(55 - 46 + 1);
	inp_permuted(4) <= inp(55 - 42 + 1);
	inp_permuted(3) <= inp(55 - 50 + 1);
	inp_permuted(2) <= inp(55 - 36 + 1);
	inp_permuted(1) <= inp(55 - 29 + 1);
	inp_permuted(0) <= inp(55 - 32 + 1);
END ARCHITECTURE;
