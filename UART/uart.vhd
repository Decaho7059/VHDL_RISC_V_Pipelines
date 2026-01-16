-----basule D avec reset asynchrone

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bascDReset IS
	PORT(
			i_resetBar : IN STD_LOGIC;
			i_d : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			--o_qBar : OUT STD_LOGIC;
			o_q : OUT STD_LOGIC);
END bascDReset;


ARCHITECTURE arch_bascDReset OF bascDReset IS
	SIGNAL int_q : STD_LOGIC;
BEGIN
	oneBitRegister:
	PROCESS(i_resetBar, i_clock)
	BEGIN
		IF (i_resetBar = '0') THEN
			int_q <= '0';
		ELSIF (i_clock'EVENT and i_clock = '1') THEN
			IF (i_enable = '1') THEN
				int_q <= i_d;
			END IF;
		END IF;
	END PROCESS oneBitRegister;
	-- Output Driver
	o_q <= int_q;
	--o_qBar <= not(int_q);
END arch_bascDReset;




-----basule D avec set asynchrone

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bascDSet IS
	PORT(
			i_setBar : IN STD_LOGIC;
			i_d : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			--o_qBar : OUT STD_LOGIC;
			o_q : OUT STD_LOGIC);
END bascDSet;


ARCHITECTURE arch_bascDSet OF bascDSet IS
	SIGNAL int_q : STD_LOGIC;
BEGIN
	oneBitRegister:
	PROCESS(i_setBar, i_clock)
	BEGIN
		IF (i_setBar = '0') THEN
			int_q <= '1';
		ELSIF (i_clock'EVENT and i_clock = '1') THEN
			IF (i_enable = '1') THEN
				int_q <= i_d;
			END IF;
		END IF;
	END PROCESS oneBitRegister;
	-- Output Driver
	o_q <= int_q;
	--o_qBar <= not(int_q);
END arch_bascDSet;





-- ----bascule D

-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;
-- ENTITY bascD IS
	-- PORT(
	-- i_d : IN STD_LOGIC;
	-- i_enable : IN STD_LOGIC;
	-- i_clock : IN STD_LOGIC;
	-- o_q : OUT STD_LOGIC
	-- --o_qBar : OUT STD_LOGIC;
	-- );
-- END bascD;

-- ARCHITECTURE arch_bascD OF bascD IS
	-- SIGNAL int_q : STD_LOGIC;
-- BEGIN
	-- oneBitRegister:
	-- PROCESS(i_clock)
	-- BEGIN
		-- IF (i_clock'EVENT and i_clock = '1') THEN
			-- IF (i_enable = '1') THEN
				-- int_q <= i_d;
			-- END IF;
		-- END IF;
	-- END PROCESS oneBitRegister;
	-- -- Output Driver
	-- o_q <= int_q;
	-- --o_qBar <= not(int_q);
-- END arch_bascD;






------compteur 4 bits 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity compt4bits is
	port(	clk:in std_logic;
			reset:in std_logic;
			q:out std_logic_vector(3 downto 0));
end compt4bits;

architecture archCompt4bits of compt4bits is 

	component bascDReset
		PORT(	i_resetBar : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				--o_qBar : OUT STD_LOGIC;
				o_q : OUT STD_LOGIC);
	end component;
	
	signal dsig, qsig: std_logic_vector(3 downto 0);

begin
	basc0: bascDReset port map(i_resetBar=>reset, i_d=>dsig(0), i_enable=>'1', i_clock=>clk, o_q=>qsig(0));
	basc1: bascDReset port map(i_resetBar=>reset, i_d=>dsig(1), i_enable=>'1', i_clock=>clk, o_q=>qsig(1));
	basc2: bascDReset port map(i_resetBar=>reset, i_d=>dsig(2), i_enable=>'1', i_clock=>clk, o_q=>qsig(2));
	basc3: bascDReset port map(i_resetBar=>reset, i_d=>dsig(3), i_enable=>'1', i_clock=>clk, o_q=>qsig(3));
	
	dsig(0)<= (not qsig(0));
	q(0)<= qsig(0) ;
	dsig(1)<= (qsig(0) xor qsig(1));
	q(1)<= qsig(1);
	dsig(2)<= ((qsig(0) and qsig(1)) xor qsig(2));
	q(2)<= qsig(2);
	dsig(3)<= ((qsig(0) and qsig(1) and qsig(2)) xor qsig(3));
	q(3)<= qsig(3);

end archCompt4bits;









-----registre 8 bits

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity reg8b is 
	PORT(	i_d : IN STD_LOGIC_VECTOR (7 downto 0);
			i_enable : IN STD_LOGIC;
			i_resetBar : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			o_q : OUT STD_LOGIC_VECTOR (7 downto 0));
end reg8b;

architecture archReg8b of reg8b is

	component  bascDReset IS
		PORT(
			i_resetBar : IN STD_LOGIC;
			i_d : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			i_clock : IN STD_LOGIC;
			--o_qBar : OUT STD_LOGIC;
			o_q : OUT STD_LOGIC);
	end component;

begin
	bascD0 : bascDReSet port map(i_d =>i_d(0), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(0));
	bascD1 : bascDReSet port map(i_d =>i_d(1), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(1));
	bascD2 : bascDReSet port map(i_d => i_d(2), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(2));
	bascD3 : bascDReSet port map(i_d => i_d(3), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(3));
	bascD4 : bascDReSet port map(i_d => i_d(4), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(4));
	bascD5 : bascDReSet port map(i_d => i_d(5), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(5));
	bascD6 : bascDReSet port map(i_d => i_d(6), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(6));
	bascD7 : bascDReSet port map(i_d => i_d(7), i_enable => i_enable, i_resetBar => i_resetBar, i_clock => i_clock, o_q => o_q(7));
end archReg8b;




-----multiplexeur 8-1 1 bit

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity mux81_1b is
	port(	sel2, sel1, sel0 : IN STD_LOGIC;
			d0, d1, d2, d3, d4, d5, d6, d7 : IN STD_LOGIC;
			s : OUT STD_LOGIC);
end mux81_1b;

architecture archMux81_1b of mux81_1b is

begin
	s <= 	((not sel2 )and(not sel1)and(not sel0)and d0) or
			((not sel2 )and(not sel1)and sel0 and d1) or
			((not sel2 )and sel1 and(not sel0)and d2) or
			((not sel2 )and sel1 and sel0 and d3) or
			(sel2 and(not sel1)and(not sel0)and d4) or
			(sel2 and(not sel1)and sel0 and d5) or
			(sel2 and sel1 and(not sel0)and d6);
			--(sel2 and sel1 and sel0 and d7) ;
end archMux81_1b;







-----multiplexeur 8-1 8 bits (avec donnees)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity mux81_8b is
	port(	sel0, sel1, sel2 : IN STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR (7 downto 0));
end mux81_8b;

architecture archMux81_8b of mux81_8b is
	
	component mux81_1b
		port(	sel2, sel1, sel0 : IN STD_LOGIC;
				d0, d1, d2, d3, d4, d5, d6, d7 : IN STD_LOGIC;
				s : OUT STD_LOGIC);
	end component;
	
	signal  d0 : STD_LOGIC_VECTOR (7 downto 0):="01010000";   ---P 50
	signal	d1 : STD_LOGIC_VECTOR (7 downto 0):="01110110";   ---v 76
	signal	d2 : STD_LOGIC_VECTOR (7 downto 0):="01101010";   ---j 6A
	signal	d3 : STD_LOGIC_VECTOR (7 downto 0):="01001100";   ---L 4C`
	signal	d4 : STD_LOGIC_VECTOR (7 downto 0):="01110010";   ---r 72
	signal	d5 : STD_LOGIC_VECTOR (7 downto 0):="01011111";   ---_ 5F
	signal	d6 : STD_LOGIC_VECTOR (7 downto 0):="00001010";   ---new line A
	signal	d7 : STD_LOGIC_VECTOR (7 downto 0):="00000000";
	
begin
	mux81_1b_0 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(0), d1 => d1(0), d2 => d2(0), d3 => d3(0), d4 => d4(0), d5 => d5(0), d6 => d6(0), d7 => d7(0), s => s(0));
	mux81_1b_1 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(1), d1 => d1(1), d2 => d2(1), d3 => d3(1), d4 => d4(1), d5 => d5(1), d6 => d6(1), d7 => d7(1), s => s(1));
	mux81_1b_2 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(2), d1 => d1(2), d2 => d2(2), d3 => d3(2), d4 => d4(2), d5 => d5(2), d6 => d6(2), d7 => d7(2), s => s(2));
	mux81_1b_3 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(3), d1 => d1(3), d2 => d2(3), d3 => d3(3), d4 => d4(3), d5 => d5(3), d6 => d6(3), d7 => d7(3), s => s(3));
	mux81_1b_4: mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(4), d1 => d1(4), d2 => d2(4), d3 => d3(4), d4 => d4(4), d5 => d5(4), d6 => d6(4), d7 => d7(4), s => s(4));
	mux81_1b_5: mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(5), d1 => d1(5), d2 => d2(5), d3 => d3(5), d4 => d4(5), d5 => d5(5), d6 => d6(5), d7 => d7(5), s => s(5));
	mux81_1b_6 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(6), d1 => d1(6), d2 => d2(6), d3 => d3(6), d4 => d4(6), d5 => d5(6), d6 => d6(6), d7 => d7(6), s => s(6));
	mux81_1b_7 : mux81_1b port map(sel2 => sel2, sel1 => sel1, sel0 => sel0, d0 => d0(7), d1 => d1(7), d2 => d2(7), d3 => d3(7), d4 => d4(7), d5 => d5(7), d6 => d6(7), d7 => d7(7), s => s(7));
end archMux81_8b;





-- -----multiplexeur 16-1 1 bit

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
entity mux161_1b is
	port(	sel3, sel2, sel1, sel0 : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(7 downto 0);
			s : OUT STD_LOGIC);
end mux161_1b;


architecture archMux161_1b of mux161_1b is 

	signal d0 : std_logic:='1';
	signal d1 : std_logic:='0';
	signal d2 : std_logic:='1';

begin

	s <= 	((not sel3)and(not sel2)and(not sel1)and(not sel0)and d0) or
			((not sel3)and(not sel2)and(not sel1)and sel0 and d1) or
			((not sel3)and(not sel2)and sel1 and(not sel0)and d(0)) or
			((not sel3)and(not sel2 )and sel1 and sel0 and d(1)) or
			((not sel3)and sel2 and(not sel1)and(not sel0)and d(2)) or
			((not sel3) and sel2 and(not sel1)and sel0 and d(3)) or
			((not sel3)and sel2 and sel1 and(not sel0)and d(4)) or
			((not sel3) and sel2 and sel1 and sel0 and d(5)) or 
			(sel3 and (not sel2) and (not sel1) and (not sel0) and d(6)) or
			(sel3 and (not sel2) and (not sel1) and sel0 and d(7)) or
			(sel3 and (not sel2) and sel1 and (not sel0) and d2) or
		
			(sel3 and (not sel2) and sel1 and sel0 and d2) or
			(sel3 and  sel2 and (not sel1) and (not sel0) and d2) or
			(sel3 and sel2 and (not sel1) and sel0 and d2) or
			(sel3 and sel2 and sel1 and (not sel0) and d2) or
			(sel3 and sel2  and sel1 and sel0 and d2);

end archMux161_1b;






-----uart

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity uart is 

	port(selMux8b : in std_logic_vector(2 downto 0);
		 rs, clk, reset : in std_logic;
		 selMux1b : out std_logic_vector(3 downto 0);
		 txd : out std_logic);
		
end uart;

architecture archUart of uart is

	component mux81_8b 
		port(	sel0, sel1, sel2 : IN STD_LOGIC;
				s : OUT STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component reg8b
		PORT(	i_d : IN STD_LOGIC_VECTOR (7 downto 0);
				i_enable : IN STD_LOGIC;
				i_resetBar : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				o_q : OUT STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component mux161_1b
		port(	sel3, sel2, sel1, sel0 : IN STD_LOGIC;
				d : IN STD_LOGIC_VECTOR(7 downto 0);
				s : OUT STD_LOGIC);
	end component;
	
	component compt4bits
		port(	clk:in std_logic;
				reset:in std_logic;
				q:out std_logic_vector(3 downto 0));
	end component;
	
	
	signal dataOut : std_logic_vector(7 downto 0);
	signal sOut : std_logic_vector(7 downto 0);
	signal selSig : std_logic_vector(3 downto 0);
	
begin


	mux81_8b0 : mux81_8b port map(sel0=>selMux8b(0), sel1=>selMux8b(1),
								  sel2=>selMux8b(2), s=>sOut);
								  
	reg8b0 : reg8b port map(i_d=>sOut, i_enable=>rs, i_clock=>clk, 
							  i_resetBar => reset, o_q=>dataOut);
							  
	mux1610 : mux161_1b port map(sel3=>selSig(3), sel2=>selSig(2), sel1=>selSig(1), sel0=>selSig(0),
								 d=>dataOut, s=>txd);
								 
	compt4bits0 : compt4bits port map(clk=>clk, reset=>rs, q=>selSig);
	
	selMux1b <= selSig;
				
							  
	
					
end archUart;


