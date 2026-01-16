LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nand_gate is
	port(

			x_nand : in std_logic;
			y_nand : in std_logic;

			out_nand : out std_logic

		);
end entity nand_gate;


architecture rtl of nand_gate is

	begin
	
		out_nand <= x_nand nand y_nand;
		
end architecture rtl;