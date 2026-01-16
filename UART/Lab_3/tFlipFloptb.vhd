LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tFlipFloptb is
end entity tFlipFloptb;

architecture rtl of tFlipFloptb is

    component tFlipFlop is

        port(
	
            i_t : in std_logic;
            t_clock : in std_logic;
            out_q, out_qBar : out std_logic

    	);
    
    end component tFlipFlop;
    
    constant T : time := 20 ns;
    signal t_clock, q, qBar, i_t : std_logic := '0';

    begin

        flipFlop : tFlipFlop port map (
            i_t => i_t,
            t_clock => t_clock,

            out_q => q,
            out_qBar => qBar
        );

        clock : process

            begin

                t_clock <= '1';
                wait for T/2;

                t_clock <= '0';
                wait for T/2;


        end process;

        testbench: process

            begin

                i_t <= '0';
                wait for 20 ns;
                assert( (q='0') and (qBar='1') )
                report "Test failed for T=0 with Q(t)=0" severity error;

                i_t <= '1';
                wait for 20 ns;
                assert( (q='1') and (qBar='0') )
                report "Test failed for T=1 with Q'(t)=1" severity error;

        end process;
        

end rtl ; -- tFlipFloptb