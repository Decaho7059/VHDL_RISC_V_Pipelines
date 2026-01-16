LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nor_gate is
	port(

			x_nor : in std_logic;
			y_nor : in std_logic;

			z_nor : out std_logic

		);
end entity nor_gate;


architecture rtl of nor_gate is

	begin
	
		z_nor <= x_nor nor y_nor;
		
end architecture rtl;