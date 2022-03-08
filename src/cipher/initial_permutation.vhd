LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY initial_permutation IS
	PORT (
		inp  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		outp : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF initial_permutation IS
BEGIN
	outp(63) <= inp(64 - 58);
	outp(62) <= inp(64 - 50);
	outp(61) <= inp(64 - 42);
	outp(60) <= inp(64 - 34);
	outp(59) <= inp(64 - 26);
	outp(58) <= inp(64 - 18);
	outp(57) <= inp(64 - 10);
	outp(56) <= inp(64 - 2);
	outp(55) <= inp(64 - 60);
	outp(54) <= inp(64 - 52);
	outp(53) <= inp(64 - 44);
	outp(52) <= inp(64 - 36);
	outp(51) <= inp(64 - 28);
	outp(50) <= inp(64 - 20);
	outp(49) <= inp(64 - 12);
	outp(48) <= inp(64 - 4);
	outp(47) <= inp(64 - 62);
	outp(46) <= inp(64 - 54);
	outp(45) <= inp(64 - 46);
	outp(44) <= inp(64 - 38);
	outp(43) <= inp(64 - 30);
	outp(42) <= inp(64 - 22);
	outp(41) <= inp(64 - 14);
	outp(40) <= inp(64 - 6);
	outp(39) <= inp(64 - 64);
	outp(38) <= inp(64 - 56);
	outp(37) <= inp(64 - 48);
	outp(36) <= inp(64 - 40);
	outp(35) <= inp(64 - 32);
	outp(34) <= inp(64 - 24);
	outp(33) <= inp(64 - 16);
	outp(32) <= inp(64 - 8);
	outp(31) <= inp(64 - 57);
	outp(30) <= inp(64 - 49);
	outp(29) <= inp(64 - 41);
	outp(28) <= inp(64 - 33);
	outp(27) <= inp(64 - 25);
	outp(26) <= inp(64 - 17);
	outp(25) <= inp(64 - 9);
	outp(24) <= inp(64 - 1);
	outp(23) <= inp(64 - 59);
	outp(22) <= inp(64 - 51);
	outp(21) <= inp(64 - 43);
	outp(20) <= inp(64 - 35);
	outp(19) <= inp(64 - 27);
	outp(18) <= inp(64 - 19);
	outp(17) <= inp(64 - 11);
	outp(16) <= inp(64 - 3);
	outp(15) <= inp(64 - 61);
	outp(14) <= inp(64 - 53);
	outp(13) <= inp(64 - 45);
	outp(12) <= inp(64 - 37);
	outp(11) <= inp(64 - 29);
	outp(10) <= inp(64 - 21);
	outp(9) <= inp(64 - 13);
	outp(8) <= inp(64 - 5);
	outp(7) <= inp(64 - 63);
	outp(6) <= inp(64 - 55);
	outp(5) <= inp(64 - 47);
	outp(4) <= inp(64 - 39);
	outp(3) <= inp(64 - 31);
	outp(2) <= inp(64 - 23);
	outp(1) <= inp(64 - 15);
	outp(0) <= inp(64 - 7);

END ARCHITECTURE;
