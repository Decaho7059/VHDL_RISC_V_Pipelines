LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity d_fftb is
end entity d_fftb;

architecture rtl of d_fftb is

    component d_ff is

        port(
	
            i_d : in std_logic;
            i_clock : in std_logic;
            o_q, o_qBar : out std_logic

    	);
    
    end component d_ff;
    
    constant T : time := 20 ns;
    signal i_d, i_clock, o_q, o_qBar : std_logic := '0';

    begin

        flipFlop : d_ff port map (
            i_d => i_d,
            i_clock => i_clock,

            o_q => o_q,
            o_qBar => o_qBar
        );


        -- continuous clock
        process

            begin

                i_clock <= '0';
                wait for T/2;

                i_clock <= '1';
                wait for T/2;


        end process;

        testbench: process

            begin

                i_d <= '0';
                wait for 20 ns;
                assert( (o_q ='0') and (o_qBar ='1') )
                report "Test failed for D=0" severity error;

                i_d <= '1';
                wait for 20 ns;
                assert( (o_q ='1') and (o_qBar ='0') )
                report "Test failed for D=1" severity error;

        end process;
        

end rtl ; -- tFlipFloptb