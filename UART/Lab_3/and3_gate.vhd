LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity and3_gate is
	port(

			x_and : in std_logic;
			y_and : in std_logic;
            z_and : in std_logic;

			out_and : out std_logic

		);
end entity and3_gate;


architecture rtl of and3_gate is

	begin
	
		out_and <= x_and and y_and and z_and;
		
end architecture rtl;