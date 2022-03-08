LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_components.ALL;

ENTITY des_cipher IS
	PORT (
		clk, rst   : IN  STD_LOGIC;
		plaintext  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		round_key  : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		sel        : IN  STD_LOGIC;
		ciphertext : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF des_cipher IS
	SIGNAL plaintext_permuted : STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL lr, lr2, lr_out : STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL l_out, r_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL l_out_reg, r_out_reg : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	-- initial permutation instance
	ip_i : initial_permutation PORT MAP(inp => plaintext, outp => plaintext_permuted);

	lr <= plaintext_permuted WHEN sel = '1' ELSE lr2;

	-- des internal calculations: 
	------ L_out <= R
	------ R_out <= f(R, K) xor L
	des_comp_i : des_computation PORT MAP(
		L     => lr(63 DOWNTO 32),
		R     => lr(31 DOWNTO 0),
		K     => round_key,
		L_out => l_out,
		R_out => r_out
	);

	-- registers 
	PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			l_out_reg <= (OTHERS => '0');
			r_out_reg <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			l_out_reg <= l_out;
			r_out_reg <= r_out;
		END IF;
	END PROCESS;
	
	-- feedback loop signal 
	lr2 <= l_out_reg & r_out_reg;
	-- output signal
	lr_out <= r_out_reg & l_out_reg;

	-- inverse initial permutation instance
	inv_ip_i : inv_initial_permutation PORT MAP(inp => lr_out, outp => ciphertext);
END ARCHITECTURE;