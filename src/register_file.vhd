LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY register_file IS
	PORT (
		clk, rst         : IN  STD_LOGIC;
		data             : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		rd_addr, wr_addr : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		wr_en            : IN  STD_LOGIC;
		data_out         : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE arch OF register_file IS
	-- registers type
	TYPE mem_type IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(47 DOWNTO 0);
	SIGNAL regs : mem_type;
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			regs <= (OTHERS => (OTHERS => '0'));
		ELSIF rising_edge(clk) THEN
			-- write to register
			IF wr_en = '1' THEN
				regs(to_integer(unsigned(wr_addr))) <= data;
			END IF;
		END IF;
	END PROCESS;

	-- read output
	data_out <= regs(to_integer(unsigned(rd_addr)));
END ARCHITECTURE;