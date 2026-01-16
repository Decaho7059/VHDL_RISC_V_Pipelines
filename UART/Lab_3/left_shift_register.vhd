LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity left_shift_register is
	port(
	
		in_n : in std_logic_vector(3 downto 0);
		
		load : in std_logic;
		enable : in std_logic;
		clock : in std_logic;
		
		out_n : out std_logic_vector(3 downto 0)
	
	);
end entity left_shift_register;

architecture rtl of left_shift_register is
	
	signal b0tob1,b1tob2,b2tob3, b3tob0 : std_logic;
	
	component enabledDFF is
		port(
	
			d : in std_logic;
			d_clock : in std_logic;
			en_d : in std_logic;
			
			outQ, outQBar : out std_logic

		);
	end component enabledDFF;
	
	begin
	
		d0 : entity work.enabledDFF(rtl)
				port map((b3tob0 and in_n(0)) or (load and in_n(0)) or (b3tob0 and not(load)), clock, enable, b0tob1);
				
		d1 : entity work.enabledDFF(rtl)
				port map((b0tob1 and in_n(1)) or (load and in_n(1)) or (b0tob1 and not(load)), clock, enable, b1tob2);
		
		d2 : entity work.enabledDFF(rtl)
				port map((b1tob2 and in_n(2)) or (load and in_n(2)) or (b1tob2 and not(load)), clock, enable, b2tob3);
				
		d3 : entity work.enabledDFF(rtl)
				port map((b2tob3 and in_n(3)) or (load and in_n(3)) or (b2tob3 and not(load)), clock, enable, b3tob0);	
				
		
		out_n(0) <= b0tob1;
		out_n(1) <= b1tob2;
		out_n(2) <= b2tob3;
		out_n(3) <= b3tob0;
		
end architecture rtl;