LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity srFlipFlop is
	port(
	
		set, reset : in std_logic;
		q, qBar : out std_logic
	
	);
end srFlipFlop;

architecture rtl of srFlipFlop is

	component nor_gate is

		port(

			x_nor : in std_logic;
			y_nor : in std_logic;

			z_nor : out std_logic

		);
	
	end component nor_gate;

	signal int_q, int_qBar : std_logic;

	begin

		sNor: nor_gate port map (
			x_nor => set,
            y_nor => int_qBar,

            z_nor => int_q
		);

		rNor: nor_gate port map (
			x_nor => reset,
            y_nor => int_q,

            z_nor => int_qBar
		);

		q <= int_q;
		qBar <= int_qBar;

end architecture rtl;