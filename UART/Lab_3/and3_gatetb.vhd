LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity and3_gatetb is

end entity and3_gatetb;


architecture rtl of and3_gatetb is

	component and3_gate is

        port(

			x_and : in std_logic;
			y_and : in std_logic;
            z_and : in std_logic;

			out_and : out std_logic

		);

    end component and3_gate;
    
    signal x_and, y_and, z_and, out_and : std_logic;

    begin

        and3Gate: and3_gate port map(
            x_and => x_and,
            y_and => y_and,
            z_and => z_and,

            out_and => out_and
        );
	
        testbench: process

            begin

                x_and <= '0';
                y_and <= '0';
                z_and <= '0';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 000" severity error;

                x_and <= '1';
                y_and <= '0';
                z_and <= '0';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 001" severity error;

                x_and <= '0';
                y_and <= '1';
                z_and <= '0';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 010" severity error;

                x_and <= '1';
                y_and <= '1';
                z_and <= '0';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 011" severity error;

                x_and <= '0';
                y_and <= '0';
                z_and <= '1';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 100" severity error;

                x_and <= '1';
                y_and <= '0';
                z_and <= '1';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 101" severity error;

                x_and <= '0';
                y_and <= '1';
                z_and <= '1';
                wait for 20 ns;
                assert (  (z_and ='0') )
                report "Test combination failed for 110" severity error;

                x_and <= '1';
                y_and <= '1';
                z_and <= '1';
                wait for 20 ns;
                assert (  (z_and ='1') )
                report "Test combination failed for 111" severity error;

                wait;

                
        end process;
		
		
end architecture rtl;