LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY des_controller IS
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
END ENTITY;

ARCHITECTURE arch OF des_controller IS
	TYPE state_type IS (
        waits, gens, encs, decs, dgen, denc, ddec,
        -- generation counter states
		gc1, gc2, gc3, gc4, gc5, gc6, gc7, gc8, gc9, gc10, gc11, gc12, gc13, gc14, gc15,
        -- encryption - decryption counter states
		c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15
	);
	SIGNAL curr_state, next_state : state_type;
BEGIN
    --  next state process
	p0 : PROCESS (curr_state, gen, enc, dec)
	BEGIN
		CASE curr_state IS
			WHEN waits | dgen | denc | ddec => 
                IF gen = '1' THEN next_state <= gens;
                ELSIF enc = '1' THEN next_state <= encs;
                ELSIF dec = '1' THEN next_state <= decs;
                ELSE next_state <= waits;
                END IF;
            WHEN gens => next_state <= gc1;
            WHEN encs => next_state <= c1;
            WHEN decs => next_state <= c14;

            -- generation counter next state
            WHEN gc1 => next_state <= gc2; WHEN gc2 => next_state <= gc3; WHEN gc3 => next_state <= gc4;
            WHEN gc4 => next_state <= gc5; WHEN gc5 => next_state <= gc6; WHEN gc6 => next_state <= gc7;
            WHEN gc7 => next_state <= gc8; WHEN gc8 => next_state <= gc9; WHEN gc9 => next_state <= gc10;
            WHEN gc10 => next_state <= gc11; WHEN gc11 => next_state <= gc12; WHEN gc12 => next_state <= gc13;
            WHEN gc13 => next_state <= gc14; WHEN gc14 => next_state <= gc15; WHEN gc15 => next_state <= dgen;

            -- encryption decryption counter next state
            WHEN c0 => next_state <= ddec;
            WHEN c1 => IF enc = '1' THEN next_state <= c2; ELSE next_state <= c0; END IF;
            WHEN c2 => IF enc = '1' THEN next_state <= c3; ELSE next_state <= c1; END IF;
            WHEN c3 => IF enc = '1' THEN next_state <= c4; ELSE next_state <= c2; END IF;
            WHEN c4 => IF enc = '1' THEN next_state <= c5; ELSE next_state <= c3; END IF;
            WHEN c5 => IF enc = '1' THEN next_state <= c6; ELSE next_state <= c4; END IF;
            WHEN c6 => IF enc = '1' THEN next_state <= c7; ELSE next_state <= c5; END IF;
            WHEN c7 => IF enc = '1' THEN next_state <= c8; ELSE next_state <= c6; END IF;
            WHEN c8 => IF enc = '1' THEN next_state <= c9; ELSE next_state <= c7; END IF;
            WHEN c9 => IF enc = '1' THEN next_state <= c10; ELSE next_state <= c8; END IF;
            WHEN c10 => IF enc = '1' THEN next_state <= c11; ELSE next_state <= c9; END IF;
            WHEN c11 => IF enc = '1' THEN next_state <= c12; ELSE next_state <= c10; END IF;
            WHEN c12 => IF enc = '1' THEN next_state <= c13; ELSE next_state <= c11; END IF;
            WHEN c13 => IF enc = '1' THEN next_state <= c14; ELSE next_state <= c12; END IF;
            WHEN c14 => IF enc = '1' THEN next_state <= c15; ELSE next_state <= c13; END IF;
            WHEN c15 => next_state <= denc;
        END CASE;
    END PROCESS;

    p1 : PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            curr_state <= waits;
        ELSIF rising_edge(clk) THEN
            curr_state <= next_state;
        END IF;
    END PROCESS;

    -- outputs process
    p2 : PROCESS (curr_state)
    BEGIN
        CASE curr_state IS
            WHEN waits => 
                cnt <= (OTHERS => '0');
                wr_en <= '0';
                done_gen <= '0'; done_enc <= '0'; done_dec <= '0';
                ready <= '1';
            WHEN gens | encs => 
                cnt <= (OTHERS => '0');
                wr_en <= '0';
                done_gen <= '0'; done_enc <= '0'; done_dec <= '0';
                ready <= '0';
            WHEN decs => 
                cnt <= (OTHERS => '1');
                wr_en <= '0';
                done_gen <= '0'; done_enc <= '0'; done_dec <= '0';
                ready <= '0';
            WHEN dgen => 
                cnt <= (OTHERS => '0');
                wr_en <= '1';
                done_gen <= '1'; done_enc <= '0'; done_dec <= '0';
                ready <= '1';
            WHEN denc => 
                cnt <= (OTHERS => '0');
                wr_en <= '0';
                done_gen <= '0'; done_enc <= '1'; done_dec <= '0';
                ready <= '1';
            WHEN ddec => 
                cnt <= (OTHERS => '0');
                wr_en <= '0';
                done_gen <= '0'; done_enc <= '0'; done_dec <= '1';
                ready <= '1';

            -- encryption - dectyption counter states outputs
            WHEN c0 => cnt <= "0000"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c1 => cnt <= "0001"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c2 => cnt <= "0010"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c3 => cnt <= "0011"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c4 => cnt <= "0100"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c5 => cnt <= "0101"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c6 => cnt <= "0110"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c7 => cnt <= "0111"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c8 => cnt <= "1000"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c9 => cnt <= "1001"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c10 => cnt <= "1010"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c11 => cnt <= "1011"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c12 => cnt <= "1100"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c13 => cnt <= "1101"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c14 => cnt <= "1110"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN c15 => cnt <= "1111"; wr_en <= '0'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';

            -- generation counter states outputs
            WHEN gc1 => cnt <= "0001"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc2 => cnt <= "0010"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc3 => cnt <= "0011"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc4 => cnt <= "0100"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc5 => cnt <= "0101"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc6 => cnt <= "0110"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc7 => cnt <= "0111"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc8 => cnt <= "1000"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc9 => cnt <= "1001"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc10 => cnt <= "1010"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc11 => cnt <= "1011"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc12 => cnt <= "1100"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc13 => cnt <= "1101"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc14 => cnt <= "1110"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
            WHEN gc15 => cnt <= "1111"; wr_en <= '1'; done_gen <= '0'; done_enc <= '0'; done_dec <= '0'; ready <= '0';
        END CASE;
    END PROCESS;
END ARCHITECTURE;