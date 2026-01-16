library ieee;
use ieee.std_logic_1164.all;

entity countertb is
end countertb;

architecture rtl of countertb is

    component counter is 

        port(
            GClock : in std_logic;
            enable : in std_logic;
            d_input : in std_logic_vector(3 downto 0);
            resetBar : in std_logic;
            
            d_out : out std_logic_vector(3 downto 0);
            done : out std_logic
        );

    end component counter;

    constant T : time := 20 ns;
    signal GClock, enable, done : std_logic;
    signal resetBar : std_logic;
    signal d_input : std_logic_vector (3 downto 0) := "1111";
    signal d_out : std_logic_vector (3 downto 0);

    begin

        counterTest: counter port map (

            GClock => GClock,
            enable => enable,
            d_input => d_input,
            resetBar => resetBar,
            
            d_out => d_out,
            done => done
        );

        clock : process

            begin

                GClock <= '1';
                wait for T/2;

                GClock <= '0';
                wait for T/2;


        end process;

        counterTestBench: process 

            begin

                enable <= '1';
                resetBar <= '1';
                d_input <= "1111";

                wait;

        end process;

end rtl;