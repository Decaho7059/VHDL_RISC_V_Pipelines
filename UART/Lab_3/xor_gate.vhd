LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity xor_gate is
	port(

			x_xor : in std_logic;
			y_xor : in std_logic;

			z_xor : out std_logic

		);
end entity xor_gate;


architecture rtl of xor_gate is

	begin
	
		z_xor <= x_xor xor y_xor;
		
end architecture rtl;