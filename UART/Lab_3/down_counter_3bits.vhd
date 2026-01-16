LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity down_counter_3bits is
	port(
	
		enable : in std_logic;
		clock : in std_logic;
		resetBar : in std_logic;
		
		finish : out std_logic
	);
end entity down_counter_3bits;

architecture rtl of down_counter_3bits is

	signal Dff2, Dff1, Dff0, y2, y1, y0 : std_logic;
	signal initialValue : std_logic_vector(2 downto 0);
	
	component enabledDFF is
		port(
	
			d : in std_logic;
			d_clock : in std_logic;
			en_d : in std_logic;
			
			outQ, outQBar : out std_logic

		);
	end component enabledDFF;
	
	
	begin
		
		Dff2 <= y2 and (y0 or y1);
		Dff1 <= (y1 and y0) or (not(y1) and not(y0));
		Dff0 <= not(y0);
		
		initialValue <= "111";
		
		d0 : entity work.enabledDFF(rtl)
				port map(Dff0 or not(resetBar), clock, enable, y0);
				
		d1 : entity work.enabledDFF(rtl)
				port map(Dff1 or not(resetBar), clock, enable, y1);
				
		d2 : entity work.enabledDFF(rtl)
				port map(Dff2 or not(resetBar), clock, enable, y2);
		
		finish <= not(y0) and not(y1) and not(y2);
	
	
end architecture rtl;