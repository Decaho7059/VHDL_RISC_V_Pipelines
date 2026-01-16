


----------------uart debug
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity uartDebug is 

	port(clk, Greset, sscs : in std_logic;
		 mscMax, sscMax : in std_logic_vector(3 downto 0);
		 mstl, sstl : out std_logic_vector(2 downto 0);
		 txd : out std_logic);

end uartDebug;




architecture archUartDebug of uartDebug is

	component uart
		port(selMux8b : in std_logic_vector(2 downto 0);
			 rs, clk, reset : in std_logic;
			 selMux1b : out std_logic_vector(3 downto 0);
			 txd : out std_logic);
	end component;
	
	
	component controlUart
		port(clk, reset, sscs : in std_logic;
			 mscMax, sscMax : in std_logic_vector(3 downto 0);
			 selMux1b : in std_logic_vector(3 downto 0);
			 mstl, sstl : out std_logic_vector(2 downto 0);
			 selMux8b : out std_logic_vector(2 downto 0);
			 rs: out std_logic);
	end component;
	
	signal selMux1bSig : std_logic_vector(3 downto 0);
	signal selMux8bSig : std_logic_vector(2 downto 0);
	signal rsSig : std_logic;


begin

	uart0 : uart port map(selMux8b=>selMux8bSig,
						  rs=>rsSig, 
						  reset=>Greset,
						  selMux1b=>selMux1bSig,
						  txd=>txd, clk=>clk); 
						  		  
	controlUart0 : controlUart port map(clk=>clk, 
										reset=>Greset,
										sscs=>sscs,
										mscMax=>mscMax, 
										sscMax=>sscMax,
										mstl=>mstl, sstl=>sstl,
										selMux1b=>selMux1bSig,
										selMux8b=>selMux8bSig,
										rs=>rsSig);

end archUartDebug;






