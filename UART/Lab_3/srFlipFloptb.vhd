LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity srFlipFloptb is
end entity srFlipFloptb;

architecture rtl of srFlipFloptb is

    component srFlipFlop is

        port(
	
            set, reset : in std_logic;
            q, qBar : out std_logic
        
        );
    
    end component srFlipFlop;
    
    signal i_set, i_reset, o_q, o_qBar : std_logic;

    begin

        flipFlop : srFlipFlop port map (
            set => i_set,
            reset => i_reset,

            q => o_q,
            qBar => o_qBar
        );

        testbench: process

            begin
                

                i_set <= '0';
                i_reset <= '1';
                wait for 10 ns;
                assert( (o_q='0') and (o_qBar='1'))
                report "Test failed for S=0 R=1 combination";


                i_set <= '1';
                i_reset <= '0';
                wait for 10 ns;
                assert( (o_q='1') and (o_qBar='0'))
                report "Test failed for S=1 R=0 combination";


                i_set <= '0';
                i_reset <= '0';
                wait for 10 ns;
                assert( (o_q='1') and (o_qBar='0'))
                report "Test failed for S=0 R=0 combination";

                wait;

        end process;
        

end rtl ; -- tFlipFloptb