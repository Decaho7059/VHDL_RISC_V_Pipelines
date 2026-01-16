LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nand_gatetb is
end entity nand_gatetb;


architecture rtl of nand_gatetb is

	component nand_gate is

        port(

			x_nand : in std_logic;
			y_nand : in std_logic;

			out_nand : out std_logic

		);

    end component nand_gate;
    
    signal x_nand, y_nand, out_nand : std_logic;

    begin

        nandGate: nand_gate port map(
            x_nand => x_nand,
            y_nand => y_nand,

            out_nand => out_nand
        );
	
        testbench: process

            begin

                x_nand <= '0';
                y_nand <= '0';
                wait for 20 ns;
                assert( (out_nand ='1') )
                report "Test failed for 00 combination" severity error;

                x_nand <= '0';
                y_nand <= '1';
                assert( (out_nand ='1') )
                report "Test failed for 01 combination" severity error;
                wait for 20 ns;

                x_nand <= '1';
                y_nand <= '0';
                wait for 20 ns;
                assert( (out_nand ='1') )
                report "Test failed for 10 combination" severity error;

                x_nand <= '1';
                y_nand <= '1';
                wait for 20 ns;
                assert( (out_nand ='0') )
                report "Test failed for 11 combination" severity error;

                wait;

        end process;
		
		
end architecture rtl;