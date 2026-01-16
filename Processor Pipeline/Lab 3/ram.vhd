--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram IS
	PORT (
		clk: in std_logic;
		mem_access_addr, mem_write_data : IN STD_LOGIC_VECTOR (7 downto 0);
		mem_write_en,RST : IN STD_LOGIC;
		mem_read_data : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END ram;

ARCHITECTURE struct OF ram IS

SIGNAL int_regIn : STD_LOGIC_VECTOR (7 downto 0);

COMPONENT dataMem IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;


COMPONENT eightbitregister IS
	PORT(
		i_resetBar, i_en	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

BEGIN 	

	RAM: dataMem
	PORT MAP (address => mem_access_addr,
			  clock => clk,
			  data => mem_write_data,
			  wren => mem_write_en,
			  q => int_regIn
	);
	
	STBLE: eightbitregister
	PORT MAP (i_resetBar => Rst,
	      i_en => '1',
		  i_clock => clk,
	      i_Value => int_regIn,		  
		  o_Value => mem_read_data
	);

END struct;