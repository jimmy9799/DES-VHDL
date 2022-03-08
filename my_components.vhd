LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE my_components IS
	---------------------------------------------------------------------
	-- KEY SCHEDULE COMPONENTS --
	---------------------------------------------------------------------
	COMPONENT permuted_choice1
		PORT (
			input_key    : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
			key_permuted : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT permuted_choice2
		PORT (
			inp          : IN  STD_LOGIC_VECTOR(55 DOWNTO 0);
			inp_permuted : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT left_rot
		PORT (
			inp      : IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
			round_id : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			outp     : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
		);
	END COMPONENT;
	---------------------------------------------------------------------
	-- F components --
	---------------------------------------------------------------------
	COMPONENT s1
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s2
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s3
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s4
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s5
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s6
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s7
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT s8
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT extend_function
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT permutation_function
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	---------------------------------------------------------------------
	-- DES CIPHER COMPONENTS --
	---------------------------------------------------------------------
	COMPONENT des_computation
		PORT (
			L, R         : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			K            : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
			L_out, R_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT initial_permutation
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT inv_initial_permutation
		PORT (
			inp  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;
	---------------------------------------------------------------------
	-- MAIN COMPONENTS --
	---------------------------------------------------------------------
	COMPONENT f
		PORT (
			r    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			k    : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
			outp : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT key_schedule
		PORT (
			clk, rst  : IN  STD_LOGIC;
			key       : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
			round_id  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			sel       : IN  STD_LOGIC;
			round_key : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT des_cipher
		PORT (
			clk, rst   : IN  STD_LOGIC;
			plaintext  : IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
			round_key  : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
			sel        : IN  STD_LOGIC;
			ciphertext : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT des_controller
		PORT (
			clk, rst      : IN  STD_LOGIC;
			gen, enc, dec : IN  STD_LOGIC;
			cnt           : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			wr_en         : OUT STD_LOGIC;
			done_gen,
			done_enc,
			done_dec : OUT STD_LOGIC;
			ready    : OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT register_file
		PORT (
			clk, rst         : IN  STD_LOGIC;
			data             : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
			rd_addr, wr_addr : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			wr_en            : IN  STD_LOGIC;
			data_out         : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
		);
	END COMPONENT;
	---------------------------------------------------------------------
END PACKAGE;