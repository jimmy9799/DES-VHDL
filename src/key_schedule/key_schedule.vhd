LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.my_components.all;

ENTITY key_schedule IS
	PORT (
		clk, rst  : IN  STD_LOGIC;
		key       : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		round_id  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel       : IN  STD_LOGIC;
		round_key : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE struct OF key_schedule IS
	-- signals
	SIGNAL key_permuted : STD_LOGIC_VECTOR(55 DOWNTO 0);
	SIGNAL c, d,
		   c_shifted, d_shifted,
		   c_shifted_reg, d_shifted_reg : STD_LOGIC_VECTOR(27 DOWNTO 0);
	SIGNAL cd, cd_shifted : STD_LOGIC_VECTOR(55 DOWNTO 0);
BEGIN
	-- component instances
	pc1_i : permuted_choice1 PORT MAP(input_key => key, key_permuted => key_permuted);
	pc2_i : permuted_choice2 PORT MAP(inp => cd_shifted, inp_permuted => round_key);
	c_rot_i : left_rot PORT MAP(inp => c, round_id => round_id, outp => c_shifted);
	d_rot_i : left_rot PORT MAP(inp => d, round_id => round_id, outp => d_shifted);

	-- registers
	PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			c_shifted_reg <= (OTHERS => '0');
			d_shifted_reg <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			c_shifted_reg <= c_shifted;
			d_shifted_reg <= d_shifted;
		END IF;
	END PROCESS;

	-- concurrent code
	cd <= key_permuted WHEN sel = '1' ELSE cd_shifted;
	c <= cd(55 DOWNTO 28);
	d <= cd(27 DOWNTO 0);
	cd_shifted <= c_shifted_reg & d_shifted_reg;
END ARCHITECTURE;
