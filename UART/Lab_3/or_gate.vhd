LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity or_gate is
	port(

			x_or : in std_logic;
			y_or : in std_logic;

			z_or : out std_logic

		);
end entity or_gate;


architecture rtl of or_gate is

	begin
	
		z_or <= x_or or y_or;
		
end architecture rtl;