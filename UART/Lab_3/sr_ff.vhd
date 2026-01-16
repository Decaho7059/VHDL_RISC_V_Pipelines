LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity sr_ff is
	port(
	
		i_set, i_reset : in std_logic;
		i_enable : in std_logic;
		o_q, o_qBar : out std_logic
	
	);
end sr_ff;

architecture rtl of sr_ff is

	signal int_q, int_qBar : std_logic;
	signal int_sSignal, int_rSignal : std_logic;

	begin
	
		-- Concurrent Signal Assignment
		
		int_sSignal <= i_set nand i_enable;
		int_rSignal <= i_enable nand i_reset;
		int_q <= int_sSignal nand int_qBar;
		int_qBar <= int_q nand int_rSignal;
		
		-- Output Driver
		
		o_q <= int_q;
		o_qBar <= int_qBar;

end architecture rtl;