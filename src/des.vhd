LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.my_components.ALL;

ENTITY des IS
	PORT (
		clk, rst      : IN  STD_LOGIC;
		gen, enc, dec : IN  STD_LOGIC;
		plaintext     : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		key           : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		ciphertext    : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		done_gen,
		done_enc,
		done_dec : OUT STD_LOGIC;
		ready    : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE top OF des IS
	-- internal signals
	SIGNAL round_id, wr_addr : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL wr_en, sel : STD_LOGIC;
	SIGNAL round_key, data_out : STD_LOGIC_VECTOR(47 DOWNTO 0);
BEGIN
	sel <= '1' WHEN ((gen OR enc OR dec) = '1' AND round_id = "0000") OR (dec = '1' AND round_id = "1111") ELSE '0';
	wr_addr <= STD_LOGIC_VECTOR(unsigned(round_id) - 1);

	-- component instances
	key_schedule_i : key_schedule PORT MAP(
		clk       => clk,
		rst       => rst,
		key       => key,
		round_id  => round_id,
		sel       => sel,
		round_key => round_key
	);
	des_cipher_i : des_cipher PORT MAP(
		clk        => clk,
		rst        => rst,
		plaintext  => plaintext,
		round_key  => data_out,
		sel        => sel,
		ciphertext => ciphertext
	);
	des_controller_i : des_controller PORT MAP(
		clk      => clk,
		rst      => rst,
		gen      => gen,
		enc      => enc,
		dec      => dec,
		cnt      => round_id,
		wr_en    => wr_en,
		done_gen => done_gen,
		done_enc => done_enc,
		done_dec => done_dec,
		ready    => ready
	);
	register_file_i : register_file PORT MAP(
		clk      => clk,
		rst      => rst,
		data     => round_key,
		rd_addr  => round_id,
		wr_addr  => wr_addr,
		wr_en    => wr_en,
		data_out => data_out
	);
END ARCHITECTURE;