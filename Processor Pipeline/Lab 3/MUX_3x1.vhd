LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_3x1 IS
	PORT (
		input : IN STD_LOGIC_VECTOR (2 downto 0);
		sel : IN STD_LOGIC_VECTOR (1 downto 0);
		y : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF MUX_3x1 IS
SIGNAL int_sig : STD_LOGIC;

COMPONENT mux_1_2 IS
	PORT (
		input : IN STD_LOGIC_VECTOR (1 downto 0);
		sel : IN STD_LOGIC;
		y : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	-- Component Intantiation --
	MUX1: mux_1_2
	PORT MAP (input => input(1 downto 0),
		  sel => sel(0),
		  y => int_sig
	);

	MUX2: mux_1_2
	PORT MAP (input(0) => int_sig,
		  input(1) => input(2),
		  sel => sel(1),
		  y => y
	);
END struct;