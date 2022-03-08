LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.my_components.all;

ENTITY des_computation IS
	PORT (
		L, R         : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		K            : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		L_out, R_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF des_computation IS
	SIGNAL f_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	f_i : f PORT MAP(r => R, k => K, outp => f_out);

	L_out <= R;
	R_out <= L XOR f_out;
END ARCHITECTURE;
