LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux2to1 is
	port(
	
		sel : in std_logic;
		a : in std_logic;
        b : in std_logic;
		output : out std_logic
	
	);
end entity mux2to1;

architecture rtl of mux2to1 is

    signal aAnd, bAnd : std_logic;

	begin
	
		aAnd <= a and not sel;
        bAnd <= b and sel;
        
        output <= aAnd or bAnd;
		
end architecture rtl;