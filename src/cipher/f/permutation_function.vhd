LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY permutation_function IS
	PORT (
		inp  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		outp : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF permutation_function IS
BEGIN
	outp(31) <= inp(32 - 16);
	outp(30) <= inp(32 - 7);
	outp(29) <= inp(32 - 20);
	outp(28) <= inp(32 - 21);
	outp(27) <= inp(32 - 29);
	outp(26) <= inp(32 - 12);
	outp(25) <= inp(32 - 28);
	outp(24) <= inp(32 - 17);
	outp(23) <= inp(32 - 1);
	outp(22) <= inp(32 - 15);
	outp(21) <= inp(32 - 23);
	outp(20) <= inp(32 - 26);
	outp(19) <= inp(32 - 5);
	outp(18) <= inp(32 - 18);
	outp(17) <= inp(32 - 31);
	outp(16) <= inp(32 - 10);
	outp(15) <= inp(32 - 2);
	outp(14) <= inp(32 - 8);
	outp(13) <= inp(32 - 24);
	outp(12) <= inp(32 - 14);
	outp(11) <= inp(32 - 32);
	outp(10) <= inp(32 - 27);
	outp(9) <= inp(32 - 3);
	outp(8) <= inp(32 - 9);
	outp(7) <= inp(32 - 19);
	outp(6) <= inp(32 - 13);
	outp(5) <= inp(32 - 30);
	outp(4) <= inp(32 - 6);
	outp(3) <= inp(32 - 22);
	outp(2) <= inp(32 - 11);
	outp(1) <= inp(32 - 4);
	outp(0) <= inp(32 - 25);
END ARCHITECTURE;
