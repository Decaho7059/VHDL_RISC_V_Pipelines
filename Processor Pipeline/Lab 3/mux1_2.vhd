LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_1_2 IS
	PORT (
		input : IN STD_LOGIC_VECTOR (1 downto 0);
		sel : IN STD_LOGIC;
		y : OUT STD_LOGIC
	);
END mux_1_2;

ARCHITECTURE struct OF mux_1_2 IS
SIGNAL int_sig : STD_LOGIC_VECTOR (1 downto 0);
BEGIN
	int_sig(0) <= input(0) NAND (NOT sel);
	int_sig(1) <= input(1) NAND sel;
	y <= int_sig(0) NAND int_sig(1);
END struct;