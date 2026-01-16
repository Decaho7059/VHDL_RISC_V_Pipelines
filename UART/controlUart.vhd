


-------------------fsm
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity fsm is 
	port(reset, clk, i1, i2: in std_logic;
		 state : out std_logic_vector(1 downto 0));
end fsm;

architecture archFsm of fsm is 
	
	component bascDReset
		PORT(
				i_resetBar : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				--o_qBar : OUT STD_LOGIC;
				o_q : OUT STD_LOGIC);
	end component;
	
	signal input, output : std_logic_vector(1 downto 0);

begin
								  
	bascDReset0 : bascDReset port map(i_resetBar=>reset, i_d=>input(0), 
								      i_enable=>'1', i_clock=>clk,
								      o_q=>output(0));
									  
	bascDReset1 : bascDReset port map(i_resetBar=>reset, i_d=>input(1), 
								      i_enable=>'1', i_clock=>clk,
								      o_q=>output(1));
									 
	input(0)<= ((not output(1)) and output(0)) or ((not i1) and output(0)) or ((not i2) and output(0)) or ((not i1) and i2 and(not output(1)));
	input(1)<= (output(0) and output(1)) or (i2 and output(1)) or (i1 and output(1)) or (i1 and (not i2) and output(0));
	state<= output;

end archFsm;





--------------------PL
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity PL is
	port(reset, clk, i1 : in std_logic;
		 state : out std_logic_vector(2 downto 0));
end PL;

architecture archPL of PL is 
	
	component bascDReset
		PORT(
				i_resetBar : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				--o_qBar : OUT STD_LOGIC;
				o_q : OUT STD_LOGIC);
	end component;
	
	signal input, output : std_logic_vector(2 downto 0);

begin

	bascDReset0 : bascDReset port map(i_resetBar=>reset, i_d=>input(0), 
									  i_enable=>'1', i_clock=>clk,
									  o_q=>output(0));
								  
	bascDReset1 : bascDReset port map(i_resetBar=>reset, i_d=>input(1), 
								      i_enable=>'1', i_clock=>clk,
								      o_q=>output(1));
									  
	bascDReset2 : bascDReset port map(i_resetBar=>reset, i_d=>input(2), 
								      i_enable=>'1', i_clock=>clk,
								      o_q=>output(2));
									  
									  
									  
	input(0) <= (output(1) and (not output(0))) or
	            (output(2) and (not output(0))) or
				((not output(0)) and i1) or
				(output(1) and output(2) and i1);				 
				 
	input(1) <= (output(1) and (not output(0)))or
				(output(1) and output(2) and i1)or
				(output(0) and (not output(1)));
				
	input(2) <= (output(2) and (not output(0)))or
	            (output(2) and i1) or
				(output(2) and (not output(1))) or
				(output(1) and output(0) and (not output(2)));
	
	state <= output;

end archPL;






--------------reset 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity  rst is 
	port(reset, clk, i : in std_logic;
		 sel : in std_logic_vector(3 downto 0);
		 o : out std_logic);
end rst;


architecture archRst of rst is 

	component bascDReset
		PORT(
				i_resetBar : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				--o_qBar : OUT STD_LOGIC;
				o_q : OUT STD_LOGIC);
	end component;
	
	signal input, output : std_logic;
	
	signal selSig : std_logic;

begin

	selSig <= (not sel(0)) and (not sel(1)) and  sel(2) and sel(3);

	bascDReset0 : bascDReset port map(i_resetBar=>reset, i_d=>input, 
								      i_enable=>'1', i_clock=>clk,
								      o_q=>output);
									  						 
	input <=  (i and (not selSig)) or (i and (not output)) or ((not selSig) and output); 
	
	o <=  output ;


end archRst;
 




---------Uart controller 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity UARTControl is

	port(clk, reset, sscs : in std_logic;
		 mscMax, sscMax : in std_logic_vector(3 downto 0);
		 mstl, sstl : out std_logic_vector(2 downto 0);
		 selMux8b : out std_logic_vector(2 downto 0);
		 selMux1b : in  std_logic_vector(3 downto 0);
		 rs : out std_logic);
end UARTControl;


architecture archUARTControl of UARTControl is

	component fsm
		port(reset, clk, i1, i2 : in std_logic;
			 state : out std_logic_vector(1 downto 0));
	end component ;
	
	component PL
		port(reset, clk, i1 : in std_logic;
			 state : out std_logic_vector(2 downto 0));
	end component ;
	
	component lightControl
		port(clk, reset, sscs : in std_logic;
			 mscMax, sscMax : in std_logic_vector(3 downto 0);
			 mstl, sstl : out std_logic_vector(2 downto 0));
	end component;
	
	component clk_div
		port(clkIn : IN	STD_LOGIC;
			 clkOut	: OUT	STD_LOGIC);
	end component;
	
	component rst 
		port(reset, clk, i : in std_logic;
			 sel : in std_logic_vector(3 downto 0);
			 o : out std_logic);
	end component;
	
	signal clkFsmSig, clkPLSig, clkRstSig, i1Sig, i2Sig : std_logic;
	
	signal fsmStateSig : std_logic_vector(1 downto 0);
	
	signal PvLrStateSig : std_logic_vector(7 downto 0);
	signal PjLrStateSig : std_logic_vector(7 downto 0);
	signal PrLvStateSig : std_logic_vector(7 downto 0);
	signal PrLjStateSig : std_logic_vector(7 downto 0);
	
	signal PvLrState : std_logic_vector(2 downto 0);
	signal PjLrState : std_logic_vector(2 downto 0);
	signal PrLvState : std_logic_vector(2 downto 0);
	signal PrLjState : std_logic_vector(2 downto 0);
	
	signal selMux8b0Sig : std_logic_vector(3 downto 0);
	signal selMux8b1Sig : std_logic_vector(3 downto 0);
	signal selMux8b2Sig : std_logic_vector(3 downto 0);
	
	signal iPLSig : std_logic_vector(3 downto 0);
	
	signal oDataSig : std_logic_vector(23 downto 0);
	
	signal mstlSig, sstlSig : std_logic_vector(2 downto 0);
	

begin



------clk

	clk_div0 : clk_div port map(clkIn=>clkRstSig,
								clkOut=>clkPLSig	
								);						
	clk_div1 : clk_div port map(clkIn=>clkPLSig,
								clkOut=>clkFsmSig	
								);
								
	clkRstSig <= clk;


-------light control

	lightControl0 : lightControl port map(clk=>clkFsmSig, 
										  reset=>reset, 
										  sscs=>sscs,
			                              mscMax=>mscMax, 
										  sscMax=>sscMax,
										  mstl=>mstlSig, 
										  sstl=>sstlSig);
										  
										  
	mstl <= mstlSig ;
	
	sstl <= sstlSig;
			
			
								
--------fsm

	i1Sig <= (mstlSig(0)and sstlSig(1)) or (mstlSig(0)and sstlSig(2));
	i2Sig <= (mstlSig(0)and sstlSig(1)) or (mstlSig(1)and sstlSig(0));									  
	fsm0 : fsm port map (reset=>reset, clk=>clkRstSig, 
						 i1=>i1Sig, i2=>i2Sig, state=>fsmStateSig );
						 
		


-------PvLr
		
	iPLSig(0) <= (not fsmStateSig(0)) and (not fsmStateSig(1));					 
			
	selMux8b0Sig(0) <=	PvLrStateSig(2) or PvLrStateSig(3)  or PvLrStateSig(4);
	selMux8b1Sig(0) <=	PvLrStateSig(4) or PvLrStateSig(6);
    selMux8b2Sig(0) <=	PvLrStateSig(3) or PvLrStateSig(5) or PvLrStateSig(6);
	
	PvLrStateSig(0) <= (not PvLrState(0)) and (not PvLrState(1)) and (not PvLrState(2));
	PvLrStateSig(1) <= PvLrState(0) and (not PvLrState(1)) and (not PvLrState(2));
	PvLrStateSig(2) <= (not PvLrState(0)) and PvLrState(1) and (not PvLrState(2));
	PvLrStateSig(3) <=  PvLrState(0) and PvLrState(1) and (not PvLrState(2));
	PvLrStateSig(4) <= (not PvLrState(0)) and (not PvLrState(1)) and PvLrState(2);
	PvLrStateSig(5) <= PvLrState(0) and (not PvLrState(1)) and PvLrState(2);
	PvLrStateSig(6) <= (not PvLrState(0)) and PvLrState(1) and PvLrState(2);
	PvLrStateSig(7) <=  PvLrState(0) and PvLrState(1) and PvLrState(2);
	
	PvLr : PL port map(reset=>reset, clk=>clkPLSig, i1=>iPLSig(0), 
					   state=>PvLrState);
					  
	------PvLr0
						 
	rstPvLr0 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(1), o=>oDataSig(0));	
								  
								  
	------PvLr1
	
	rstPvLr1 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(2), o=>oDataSig(1));	
								  
	
	------PvLr2
	
	rstPvLr2 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(3), o=>oDataSig(2));	
								  
								  					  
	------PvLr3
	
	rstPvLr3 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(4), o=>oDataSig(3));	

								  
								  						  
	------PvLr4
	
	rstPvLr4 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(5), o=>oDataSig(4));	
	
								  							  
	------PvLr5
	
	rstPvLr5 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PvLrStateSig(6), o=>oDataSig(5));	
							  
							  
							  
							  
							  
							  
							  
-------PjLr
		
	iPLSig(1) <= fsmStateSig(0) and (not fsmStateSig(1));					 
					
	selMux8b0Sig(1) <=	PjLrStateSig(3)  or PjLrStateSig(4);
	selMux8b1Sig(1) <=	PjLrStateSig(2) or PjLrStateSig(4) or PjLrStateSig(6);
    selMux8b2Sig(1) <=	PjLrStateSig(3) or PjLrStateSig(5) or PjLrStateSig(6);
	
	PjLrStateSig(0) <= (not PjLrState(0)) and (not PjLrState(1)) and (not PjLrState(2));
	PjLrStateSig(1) <= PjLrState(0) and (not PjLrState(1)) and (not PjLrState(2));
	PjLrStateSig(2) <= (not PjLrState(0)) and PjLrState(1) and (not PjLrState(2));
	PjLrStateSig(3) <= PjLrState(0) and PjLrState(1) and (not PjLrState(2));
	PjLrStateSig(4) <= (not PjLrState(0)) and (not PjLrState(1)) and PjLrState(2);
	PjLrStateSig(5) <= PjLrState(0) and (not PjLrState(1)) and PjLrState(2);
	PjLrStateSig(6) <= (not PjLrState(0)) and PjLrState(1) and PjLrState(2);
	PjLrStateSig(7) <=  PjLrState(0) and PjLrState(1) and PjLrState(2);
	
	PjLr : PL port map(reset=>reset, clk=>clkPLSig, i1=>iPLSig(1), 
					   state=>PjLrState);
					  
	
	------PjLr0
						 
	rstPjLr0 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(1), o=>oDataSig(6));	
	
								  
								  
	------PjLr1
	
	rstPjLr1 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(2), o=>oDataSig(7));	

	------PjLr2
	
	rstPjLr2 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(3), o=>oDataSig(8));						  
								  					  
	------PjLr3
	
	rstPjLr3 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(4), o=>oDataSig(9));	
								  						  
	------PjLr4
	
	rstPjLr4 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(5), o=>oDataSig(10));	
								  		  							  
	------PjLr5
	
	rstPjLr5 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PjLrStateSig(6), o=>oDataSig(11));	
							  
							  
							  
							  
							  
							  
-------PrLv
		
	iPLSig(2) <= fsmStateSig(0) and fsmStateSig(1);					 
	
	PrLvStateSig(0) <= (not PrLvState(0)) and (not PrLvState(1)) and (not PrLvState(2));
	PrLvStateSig(1) <= PrLvState(0) and (not PrLvState(1)) and (not PrLvState(2));
	PrLvStateSig(2) <= (not PrLvState(0)) and PrLvState(1) and (not PrLvState(2));
	PrLvStateSig(3) <= PrLvState(0) and PrLvState(1) and (not PrLvState(2));
	PrLvStateSig(4) <= (not PrLvState(0)) and (not PrLvState(1)) and PrLvState(2);
	PrLvStateSig(5) <= PrLvState(0) and (not PrLvState(1)) and PrLvState(2);
	PrLvStateSig(6) <= (not PrLvState(0)) and PrLvState(1) and PrLvState(2);
	PrLvStateSig(7) <=  PrLvState(0) and PrLvState(1) and PrLvState(2);
					
	selMux8b0Sig(2) <=	PrLvStateSig(3) or PrLvStateSig(4) or PrLvStateSig(5);
	selMux8b1Sig(2) <=	PrLvStateSig(4) or PrLvStateSig(6);
    selMux8b2Sig(2) <=	PrLvStateSig(3) or PrLvStateSig(2) or PrLvStateSig(6);
	
	PrLv : PL port map(reset=>reset, clk=>clkPLSig, i1=>iPLSig(2),
					   state=>PrLvState);
					  
	------PrLv0
						 
	rstPrLv0 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(1), o=>oDataSig(12));	
								  							  
	------PrLv1
	
	rstPrLv1 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(2), o=>oDataSig(13));	
	
	------PrLv2
	
	rstPrLv2 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(3), o=>oDataSig(14));	
								  								  					  
	------PrLv3
	
	rstPrLv3 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(4), o=>oDataSig(15));	
	
	------PrLv4
	
	rstPrLv4 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(5), o=>oDataSig(16));	
								    							  
	------PrLv5
	
	rstPrLv5 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLvStateSig(6), o=>oDataSig(17));	
	
	

							  
-------PrLj
		
	iPLSig(3) <= (not fsmStateSig(0)) and fsmStateSig(1);					 	
			
	selMux8b0Sig(3) <=	PrLjStateSig(3) or PrLjStateSig(4);
	selMux8b1Sig(3) <=	PrLjStateSig(4) or PrLjStateSig(6)or PrLjStateSig(5);
    selMux8b2Sig(3) <=	PrLjStateSig(3) or PrLjStateSig(2) or PrLjStateSig(6);
	
	PrLjStateSig(0) <= (not PrLjState(0)) and (not PrLjState(1)) and (not PrLjState(2));
	PrLjStateSig(1) <= PrLjState(0) and (not PrLjState(1)) and (not PrLjState(2));
	PrLjStateSig(2) <= (not PrLjState(0)) and PrLjState(1) and (not PrLjState(2));
	PrLjStateSig(3) <= (not PrLjState(0)) and PrLjState(1) and PrLjState(2);
	PrLjStateSig(4) <= (not PrLjState(0)) and (not PrLjState(1)) and PrLjState(2);
	PrLjStateSig(5) <= PrLjState(0) and (not PrLjState(1)) and PrLjState(2);
	PrLjStateSig(6) <= (not PrLjState(0)) and PrLjState(1) and PrLjState(2);
	PrLjStateSig(7) <=  PrLjState(0) and PrLjState(1) and PrLjState(2);
	
	
	PrLj : PL port map(reset=>reset, clk=>clkPLSig, i1=>iPLSig(3), 
					   state=>PrLjState);
					  
	
	------PrLj0
						 
	rstPrLj0 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(1), o=>oDataSig(18));	
								  
	------PrLj1
	
	rstPrLj1 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(2), o=>oDataSig(19));	
								  
	------PrLj2
	
	rstPrLj2 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(3), o=>oDataSig(20));			  
								  					  
	------PrLj3
	
	rstPrLj3 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(4), o=>oDataSig(21));	
							
	------PrLj4
	
	rstPrLj4 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(5), o=>oDataSig(22));	

								  					  							  
	------PrLj5
	
	rstPrLj5 : rst port map(reset=>reset, clk=>clkRstSig, sel=>selMux1b, i=>PrLjStateSig(6), o=>oDataSig(23));	
							  
							  
			

			
							  
-------selMux8b0

	selMux8b(0) <= selMux8b0Sig(0) or selMux8b0Sig(1) or selMux8b0Sig(2) or selMux8b0Sig(3);

-------selMux8b1

	selMux8b(1) <= selMux8b1Sig(0) or selMux8b1Sig(1) or selMux8b1Sig(2) or selMux8b1Sig(3);
	
-------selMux8b2

	selMux8b(2) <= selMux8b2Sig(0) or selMux8b2Sig(1) or selMux8b2Sig(2) or selMux8b2Sig(3);
	
--------reset compteur

	rs <= oDataSig(0) or oDataSig(1) or oDataSig(2) or oDataSig(3) or oDataSig(4) or oDataSig(5) or 
			oDataSig(6) or oDataSig(7) or oDataSig(8) or oDataSig(9) or oDataSig(10) or oDataSig(11) or
			oDataSig(12) or oDataSig(13) or oDataSig(14) or oDataSig(15) or oDataSig(16) or oDataSig(17) or
			oDataSig(18) or oDataSig(19) or oDataSig(20) or oDataSig(21) or oDataSig(22) or oDataSig(23);
	
	
end archUARTControl;


















