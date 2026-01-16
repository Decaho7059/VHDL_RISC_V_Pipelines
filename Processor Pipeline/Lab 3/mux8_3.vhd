LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux8_3 IS
	PORT(
		
		a	: IN STD_LOGIC_VECTOR(7 downto 0);
		b	: IN STD_LOGIC_VECTOR(7 downto 0);
		c	: IN STD_LOGIC_VECTOR(7 downto 0);
		d	: IN STD_LOGIC_VECTOR(7 downto 0);
		e	: IN STD_LOGIC_VECTOR(7 downto 0);
		f	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p6	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p7	: IN STD_LOGIC_VECTOR(7 downto 0);
		s 	: IN STD_LOGIC_VECTOR(2 downto 0);
		y 	: OUT STD_LOGIC_VECTOR(7 downto 0));
END mux8_3;


ARCHITECTURE struct OF mux8_3 IS
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
		i_input(0)	=>a(0),
		i_input(1)	=>b(0),
		i_input(2)	=>c(0),
		i_input(3)	=>d(0),
		i_input(4)	=>e(0),
		i_input(5)	=>f(0),
		i_input(6)	=>i_p6(0),
		i_input(7)	=>i_p7(0),
		o_output	=>int_mux_OUT(0) );

	mux1: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(1),
		i_input(1)	=>b(1),
		i_input(2)	=>c(1),
		i_input(3)	=>d(1),
		i_input(4)	=>e(1),
		i_input(5)	=>f(1),
		i_input(6)	=>i_p6(1),
		i_input(7)	=>i_p7(1),
		o_output	=>int_mux_OUT(1) );

	mux2: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(2),
		i_input(1)	=>b(2),
		i_input(2)	=>c(2),
		i_input(3)	=>d(2),
		i_input(4)	=>e(2),
		i_input(5)	=>f(2),
		i_input(6)	=>i_p6(2),
		i_input(7)	=>i_p7(2),
		o_output	=>int_mux_OUT(2) );

	mux3: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(3),
		i_input(1)	=>b(3),
		i_input(2)	=>c(3),
		i_input(3)	=>d(3),
		i_input(4)	=>e(3),
		i_input(5)	=>f(3),
		i_input(6)	=>i_p6(3),
		i_input(7)	=>i_p7(3),
		o_output	=>int_mux_OUT(3) );

	mux4: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(4),
		i_input(1)	=>b(4),
		i_input(2)	=>c(4),
		i_input(3)	=>d(4),
		i_input(4)	=>e(4),
		i_input(5)	=>f(4),
		i_input(6)	=>i_p6(4),
		i_input(7)	=>i_p7(4),
		o_output	=>int_mux_OUT(4) );

	mux5: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(5),
		i_input(1)	=>b(5),
		i_input(2)	=>c(5),
		i_input(3)	=>d(5),
		i_input(4)	=>e(5),
		i_input(5)	=>f(5),
		i_input(6)	=>i_p6(5),
		i_input(7)	=>i_p7(5),
		o_output	=>int_mux_OUT(5) );

	mux6: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(6),
		i_input(1)	=>b(6),
		i_input(2)	=>c(6),
		i_input(3)	=>d(6),
		i_input(4)	=>e(6),
		i_input(5)	=>f(6),
		i_input(6)	=>i_p6(6),
		i_input(7)	=>i_p7(6),
		o_output	=>int_mux_OUT(6) );

	mux7: MUX_8x1
	PORT MAP(
		s		=>s,
		i_input(0)	=>a(7),
		i_input(1)	=>b(7),
		i_input(2)	=>c(7),
		i_input(3)	=>d(7),
		i_input(4)	=>e(7),
		i_input(5)	=>f(7),
		i_input(6)	=>i_p6(7),
		i_input(7)	=>i_p7(7),
		o_output	=>int_mux_OUT(7) );

	--Output Assignment
	y 	<= int_mux_OUT;
END struct;