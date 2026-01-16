library ieee;
use ieee.std_logic_1164.all;

entity z3tb is
end z3tb;

architecture rtl of z3tb is

    component z3 is

        port (
            z3in:   in  std_logic;
            z3out:  out std_logic
        );
    
    end component z3;

    signal z3out:std_logic;
    signal z3in: std_logic;

    begin

        z3Gate: z3 port map (
            z3in => z3in,
            z3out => z3out
        );

        testbench: process

            begin

                z3in <= '0';
                wait for 20 ns;
                
                z3in <= '1';
                wait for 20 ns;

                wait;

        end process;


end rtl ; -- rtl

