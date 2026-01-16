library ieee;
use ieee.std_logic_1164.all;

entity down_counter_4bitstb is
end down_counter_4bitstb;

architecture rtl of down_counter_4bitstb is

    component down_counter_4bits is 

        port (
            inputSignal : in std_logic_vector(3 downto 0);
            enable : in std_logic;
            clock : in std_logic;
            resetBar : in std_logic;
            
            finish : out std_logic
        );

    end component down_counter_4bits;

    signal inSignal : std_logic_vector(3 downto 0);
    constant T : time := 20 ns;
    signal enable, clock, resetBar, finish : std_logic;

    begin

        downCounter4BitsComponent : down_counter_4bits port map(

            inputSignal => inSignal,
            enable => enable,
            clock => clock,
            resetBar => resetBar,
            finish => finish

        );

        clockPrcess : process

            begin

                clock <= '1';
                wait for T/2;

                clock <= '0';
                wait for T/2;


        end process;


        testbenchDownCounter4Bits: process

                begin 

                    inSignal <= "1111";
                    enable <= '1';
                    resetBar <= '0', '1' after 40 ns;

                    assert(finish ='1')
                    report "Test failed for input signal = 1111" severity error;

                    wait;
                

        end process;

end rtl ; -- rtl