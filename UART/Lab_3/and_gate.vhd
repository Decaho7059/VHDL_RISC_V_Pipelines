LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity and_gate is
	port(

			x_and : in std_logic;
			y_and : in std_logic;

			z_and : out std_logic

		);
end entity and_gate;


architecture rtl of and_gate is

	begin
	
		z_and <= x_and and y_and;
		
end architecture rtl;