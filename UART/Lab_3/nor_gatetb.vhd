LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nor_gatetb is

end entity nor_gatetb;


architecture rtl of nor_gatetb is

	component nor_gate is

        port(

			x_nor : in std_logic;
			y_nor : in std_logic;

			z_nor : out std_logic

		);

    end component nor_gate;
    
    signal x_nor, y_nor, z_nor : std_logic;

    begin

        norGate: nor_gate port map(
            x_nor => x_nor,
            y_nor => y_nor,

            z_nor => z_nor
        );
	
        testbench: process

            begin

                x_nor <= '0';
                y_nor <= '0';
                wait for 20 ns;
                assert( (z_nor ='1') )
                report "Test failed for 00 combination" severity error;

                x_nor <= '0';
                y_nor <= '1';
                assert( (z_nor ='0') )
                report "Test failed for 01 combination" severity error;
                wait for 20 ns;

                x_nor <= '1';
                y_nor <= '0';
                wait for 20 ns;
                assert( (z_nor ='0') )
                report "Test failed for 10 combination" severity error;

                x_nor <= '1';
                y_nor <= '1';
                wait for 20 ns;
                assert( (z_nor ='0') )
                report "Test failed for 11 combination" severity error;

                wait;

        end process;
		
		
end architecture rtl;