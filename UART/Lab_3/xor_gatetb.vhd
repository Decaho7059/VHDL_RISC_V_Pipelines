LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity xor_gatetb is
end entity xor_gatetb;


architecture rtl of xor_gatetb is

    component xor_gate is 

            port(
                x_xor : in std_logic;
			    y_xor : in std_logic;

			    z_xor : out std_logic
            );

    end component xor_gate;

    signal x, y, output : std_logic;

	begin

        xorGate: xor_gate port map (
            x_xor => x,
            y_xor => y,

            z_xor => output
        );

        testbench : process

            begin

            x <= '0';
            y <= '0';
            -- 1
            wait for 10 ns;
            assert (output = '0')
            report "test failed for input combination 00" severity error;
            

            x <= '0';
            y <= '1';
            -- 1
            wait for 10 ns;
            assert (output = '1')
            report "test failed for input combination 01" severity error;

            x <= '1';
            y <= '0';
            -- 1
            wait for 10 ns;
            assert (output = '1')
            report "test failed for input combination 10" severity error;

            x <= '1';
            y <= '1';
            -- 1
            wait for 10 ns;
            assert (output = '0')
            report "test failed for input combination 11" severity error;

            wait;

        end process;

		
end architecture rtl;