LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY left_rot IS
	PORT (
		inp      : IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
		round_id : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		outp     : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE dataflow OF left_rot IS
BEGIN
	WITH round_id SELECT outp <=
		inp(26 DOWNTO 0) & inp(27) WHEN "0000" | "0001" | "1000" | "1111",
		inp(25 DOWNTO 0) & inp(27 DOWNTO 26) WHEN OTHERS;
END ARCHITECTURE;
