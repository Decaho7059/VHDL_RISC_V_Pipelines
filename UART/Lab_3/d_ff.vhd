LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity d_ff is
	port(
	
		i_d : in std_logic;
		i_clock : in std_logic;
		o_q, o_qBar : out std_logic

	);
end entity d_ff;

architecture rtl of d_ff is

	signal int_q, int_qBar : std_logic;
	signal int_d, int_dBar : std_logic;
	signal int_notD, int_notClock : std_logic;
	
	component sr_ff
		port(
			i_set, i_reset : in std_logic;
			i_enable : in std_logic;
			o_q, o_qBar : out std_logic
		);
	end component sr_ff;
	
	begin
	
		-- Component Instantiation
		
		first : sr_ff port map ( i_d, int_notD, int_notClock, int_q, int_qBar);
								  
		second : sr_ff port map ( int_q, int_qBar, i_clock, o_q, o_qBar);

		-- Concurrent Signal Assignment

		int_notD <= not(i_d);
		int_notClock <= not(i_clock);
		
end architecture rtl;