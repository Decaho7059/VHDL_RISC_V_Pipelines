LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity sr_fftb is
end entity sr_fftb;

architecture rtl of sr_fftb is

    component sr_ff is

        port(
	
            i_set, i_reset : in std_logic;
            i_enable : in std_logic;
            o_q, o_qBar : out std_logic
        
        );
    
    end component sr_ff;
    
    signal i_set, i_reset, i_enable, o_q, o_qBar : std_logic;

    begin

        flipFlop : sr_ff port map (
            i_set => i_set,
            i_reset => i_reset,
            i_enable => i_enable,

            o_q => o_q,
            o_qBar => o_qBar
        );

        testbench: process

            begin
                
                i_enable <= '1';
                i_set <= '0';
                i_reset <= '1';
                wait for 10 ns;
                assert( (o_q='0') and (o_qBar='1'))
                report "Test failed for S=0 R=1 combination";

                i_enable <= '1';
                i_set <= '1';
                i_reset <= '0';
                wait for 10 ns;
                assert( (o_q='1') and (o_qBar='0'))
                report "Test failed for S=1 R=0 combination";

                i_enable <= '1';
                i_set <= '0';
                i_reset <= '0';
                wait for 10 ns;
                assert( (o_q='1') and (o_qBar='0'))
                report "Test failed for S=0 R=0 combination";

                wait;

        end process;
        

end rtl ; -- tFlipFloptb