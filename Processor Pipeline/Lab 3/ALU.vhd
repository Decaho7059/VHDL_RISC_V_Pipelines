library  ieee;
use  ieee.std_logic_1164.all;

ENTITY alu IS
	PORT(
	A, B: in std_logic_vector(7 downto 0);
	ALUOP: in std_logic_vector(2 downto 0);
	zero: out std_logic;
	result: out std_logic_vector(7 downto 0));
END alu;

architecture rtl of alu is

signal aluresult, addresult, subresult, andresult,inMuxE, orresult : std_logic_vector(7 downto 0);
signal selectors : std_logic_vector(2 downto 0);

component eightbitfulladder is
	port(
		M : in std_logic_vector (7 downto 0);
		N : in std_logic_vector (7 downto 0);
		Cin : in std_logic;
		Cout : out std_logic;
		Sum : out std_logic_vector (7 downto 0)
	);
end component;

component eightbitsubstractor is
	port(
		M : in std_logic_vector (7 downto 0);
		N : in std_logic_vector (7 downto 0);
		Din : in std_logic;
		Cout : out std_logic;
		Sum : out std_logic_vector (7 downto 0)
	);
end component;

component eightbitor is
	port (
			valA, valB : in std_logic_vector (7 downto 0);
			valO: out std_logic_vector(7 downto 0)
		);
end component;

component eightbitand is
	port (
			valA, valB : in std_logic_vector (7 downto 0);
			valO: out std_logic_vector(7 downto 0)
		);
end component;

component mux8x3 is
	port (
		a,b,c,d,e,f,g,h : in std_logic_vector(7 downto 0);
		s: in std_logic_vector(2 downto 0);
		m : out std_logic_vector(7 downto 0)
	);
end component mux8x3;


begin
selectors <= ALUOP;

ALU_ADD: eightbitfulladder port map(A, B, '0', open, addresult);
ALU_SUB: eightbitsubstractor port map(A, B, '0', open, subresult);
ALU_AND: eightbitand port map(A, B, andresult);
ALU_OR: eightbitor port map(A, B, orresult);
ux: mux8x3 port map(andresult,orresult,addresult,subresult,inMuxE,"00000000","00000000","00000000",selectors,aluresult);
zero <= not (aluresult(0) or aluresult(1) or aluresult(2) or aluresult(3) or aluresult(4) or aluresult(5) or aluresult(6) or aluresult(7));
END rtl;