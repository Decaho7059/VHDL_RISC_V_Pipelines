
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux1 IS
	PORT (
		a,b : IN STD_LOGIC ;
		sel : IN STD_LOGIC;
		y : OUT STD_LOGIC
	);
END mux1;

ARCHITECTURE struct OF mux1 IS

BEGIN
	y <= (A NAND (NOT sel)) NAND (B NAND sel);
END struct;