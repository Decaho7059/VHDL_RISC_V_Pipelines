LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux3to8 IS
	PORT(
		a1	: IN STD_LOGIC_VECTOR(7 downto 0);
		a2	: IN STD_LOGIC_VECTOR(7 downto 0);
		a3	: IN STD_LOGIC_VECTOR(7 downto 0);
		a4	: IN STD_LOGIC_VECTOR(7 downto 0);
		a5	: IN STD_LOGIC_VECTOR(7 downto 0);
		a6	: IN STD_LOGIC_VECTOR(7 downto 0);
		a7	: IN STD_LOGIC_VECTOR(7 downto 0);
		a8	: IN STD_LOGIC_VECTOR(7 downto 0);
		s 	: IN STD_LOGIC_VECTOR(2 downto 0);
		m 	: OUT STD_LOGIC_VECTOR(7 downto 0));
END mux3to8;


ARCHITECTURE struct OF mux3to8 IS
	SIGNAL int_mux_OUT   :  STD_LOGIC_VECTOR(7 downto 0);
	

COMPONENT MUX_8x1 IS
	PORT(
		i_input			: IN	STD_LOGIC_VECTOR(7 downto 0);
		s			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		o_output		: OUT	STD_LOGIC);
END COMPONENT;

BEGIN
	mux0: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(0),
		i_input(1)	=>a2(0),
		i_input(2)	=>a3(0),
		i_input(3)	=>a4(0),
		i_input(4)	=>a5(0),
		i_input(5)	=>a6(0),
		i_input(6)	=>a7(0),
		i_input(7)	=>a8(0),
		o_output	=>int_mux_OUT(0) );

	mux1: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(1),
		i_input(1)	=>a2(1),
		i_input(2)	=>a3(1),
		i_input(3)	=>a4(1),
		i_input(4)	=>a5(1),
		i_input(5)	=>a6(1),
		i_input(6)	=>a7(1),
		i_input(7)	=>a8(1),
		o_output	=>int_mux_OUT(1) );

	mux2: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(2),
		i_input(1)	=>a2(2),
		i_input(2)	=>a3(2),
		i_input(3)	=>a4(2),
		i_input(4)	=>a5(2),
		i_input(5)	=>a6(2),
		i_input(6)	=>a7(2),
		i_input(7)	=>a8(2),
		o_output	=>int_mux_OUT(2) );

	mux3: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(3),
		i_input(1)	=>a2(3),
		i_input(2)	=>a3(3),
		i_input(3)	=>a4(3),
		i_input(4)	=>a5(3),
		i_input(5)	=>a6(3),
		i_input(6)	=>a7(3),
		i_input(7)	=>a8(3),
		o_output	=>int_mux_OUT(3) );

	mux4: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(4),
		i_input(1)	=>a2(4),
		i_input(2)	=>a3(4),
		i_input(3)	=>a4(4),
		i_input(4)	=>a5(4),
		i_input(5)	=>a6(4),
		i_input(6)	=>a7(4),
		i_input(7)	=>a8(4),
		o_output	=>int_mux_OUT(4) );

	mux5: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(5),
		i_input(1)	=>a2(5),
		i_input(2)	=>a3(5),
		i_input(3)	=>a4(5),
		i_input(4)	=>a5(5),
		i_input(5)	=>a6(5),
		i_input(6)	=>a7(5),
		i_input(7)	=>a8(5),
		o_output	=>int_mux_OUT(5) );

	mux6: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(6),
		i_input(1)	=>a2(6),
		i_input(2)	=>a3(6),
		i_input(3)	=>a4(6),
		i_input(4)	=>a5(6),
		i_input(5)	=>a6(6),
		i_input(6)	=>a7(6),
		i_input(7)	=>a8(6),
		o_output	=>int_mux_OUT(6) );

	mux7: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a1(7),
		i_input(1)	=>a2(7),
		i_input(2)	=>a3(7),
		i_input(3)	=>a4(7),
		i_input(4)	=>a5(7),
		i_input(5)	=>a6(7),
		i_input(6)	=>a7(7),
		i_input(7)	=>a8(7),
		o_output	=>int_mux_OUT(7) );

	--Output Assignment
	m 	<= int_mux_OUT;
END struct;