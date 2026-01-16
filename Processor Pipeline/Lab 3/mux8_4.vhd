LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_8_4 IS
	PORT (
		a, b, c, d  : IN STD_LOGIC_VECTOR (7 downto 0);
		sel 		: IN STD_LOGIC_VECTOR (1 downto 0);
		y 		: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END mux_8_4;

ARCHITECTURE struct OF mux_8_4 IS

COMPONENT MUX_4x1 IS
	PORT (
		input : IN STD_LOGIC_VECTOR (3 downto 0);
		sel : IN STD_LOGIC_VECTOR (1 downto 0);
		y : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	MUX_0: MUX_4x1
	PORT MAP (
		  input(0) => a(0),
		  input(1) => b(0),
		  input(2) => c(0),
		  input(3) => d(0),
		  sel => sel,
		  y => y(0) );

	MUX_1: MUX_4x1
	PORT MAP (
		  input(0) => a(1),
		  input(1) => b(1),
		  input(2) => c(1),
		  input(3) => d(1),
		  sel => sel,
		  y => y(1) );

	MUX_2: MUX_4x1
	PORT MAP (
		  input(0) => a(2),
		  input(1) => b(2),
		  input(2) => c(2),
		  input(3) => d(2),
		  sel => sel,
		  y => y(2) );

	MUX_3: MUX_4x1
	PORT MAP (
		  input(0) => a(3),
		  input(1) => b(3),
		  input(2) => c(3),
		  input(3) => d(3),
		  sel => sel,
		  y => y(3) );

	MUX_4: MUX_4x1
	PORT MAP (
		  input(0) => a(4),
		  input(1) => b(4),
		  input(2) => c(4),
		  input(3) => d(4),
		  sel => sel,
		  y => y(4) );

	MUX_5: MUX_4x1
	PORT MAP (
		  input(0) => a(5),
		  input(1) => b(5),
		  input(2) => c(5),
		  input(3) => d(5),
		  sel => sel,
		  y => y(5) );
	
	MUX_6: MUX_4x1
	PORT MAP (
		  input(0) => a(6),
		  input(1) => b(6),
		  input(2) => c(6),
		  input(3) => d(6),
		  sel => sel,
		  y => y(6) );

	MUX_7: MUX_4x1
	PORT MAP (
		  input(0) => a(7),
		  input(1) => b(7),
		  input(2) => c(7),
		  input(3) => d(7),
		  sel => sel,
		  y => y(7) );

END struct;