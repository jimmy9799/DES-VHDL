LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.my_components.all;

ENTITY f IS
	PORT (
		r    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		k    : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		outp : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF f IS
	-- signals
	SIGNAL r_extended, r_xored : STD_LOGIC_VECTOR(47 DOWNTO 0);
	SIGNAL s_outp : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	extend_i : extend_function PORT MAP(inp => r, outp => r_extended);
	r_xored <= r_extended XOR k;

	s8_i : s8 PORT MAP(inp => r_xored(5 DOWNTO 0), outp => s_outp(3 DOWNTO 0));
	s7_i : s7 PORT MAP(inp => r_xored(11 DOWNTO 6), outp => s_outp(7 DOWNTO 4));
	s6_i : s6 PORT MAP(inp => r_xored(17 DOWNTO 12), outp => s_outp(11 DOWNTO 8));
	s5_i : s5 PORT MAP(inp => r_xored(23 DOWNTO 18), outp => s_outp(15 DOWNTO 12));
	s4_i : s4 PORT MAP(inp => r_xored(29 DOWNTO 24), outp => s_outp(19 DOWNTO 16));
	s3_i : s3 PORT MAP(inp => r_xored(35 DOWNTO 30), outp => s_outp(23 DOWNTO 20));
	s2_i : s2 PORT MAP(inp => r_xored(41 DOWNTO 36), outp => s_outp(27 DOWNTO 24));
	s1_i : s1 PORT MAP(inp => r_xored(47 DOWNTO 42), outp => s_outp(31 DOWNTO 28));

	permute_i : permutation_function PORT MAP(inp => s_outp, outp => outp);

END ARCHITECTURE;
