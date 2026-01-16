LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux2to1tb is
end entity mux2to1tb;

architecture rtl of mux2to1tb is

    component mux2to1 is

        port(
	
            sel : in std_logic;
            a : in std_logic;
            b : in std_logic;
            output : out std_logic
	
	    );

    end component mux2to1;

    signal selector, a, b, output : std_logic;

	begin
	
		mux2to1Comp: mux2to1 port map (

            sel => selector,
            a => a,
            b => b,
            output => output

        );

        testbench : process

            begin

                selector <= '0';
                a <= '0';
                b <= '0';
                wait for 20 ns;
                assert( (output = '0') )
                report "test failed for combination S=0, a=0, b=0" severity error;

                selector <= '0';
                a <= '1';
                b <= '0';
                wait for 20 ns;
                assert( (output = '1') )
                report "test failed for combination S=0, a=1, b=0" severity error;

                selector <= '0';
                a <= '0';
                b <= '1';
                wait for 20 ns;
                assert( (output = '0') )
                report "test failed for combination S=0, a=0, b=1" severity error;

                selector <= '0';
                a <= '1';
                b <= '1';
                wait for 20 ns;
                assert( (output = '1') )
                report "test failed for combination S=0, a=1, b=1" severity error;

                selector <= '1';
                a <= '0';
                b <= '0';
                wait for 20 ns;
                assert( (output = '0') )
                report "test failed for combination S=1, a=0, b=0" severity error;

                selector <= '1';
                a <= '1';
                b <= '0';
                wait for 20 ns;
                assert( (output = '0') )
                report "test failed for combination S=1, a=1, b=0" severity error;

                selector <= '1';
                a <= '0';
                b <= '1';
                wait for 20 ns;
                assert( (output = '1') )
                report "test failed for combination S=1, a=0, b=1" severity error;

                selector <= '1';
                a <= '1';
                b <= '1';
                wait for 20 ns;
                assert( (output = '1') )
                report "test failed for combination S=1, a=1, b=1" severity error;

                wait;

        end process;
		
end architecture rtl;