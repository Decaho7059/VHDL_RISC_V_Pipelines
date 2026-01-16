library ieee;
use  ieee.std_logic_1164.all;

ENTITY bcdDecoder IS
	PORT(
            currentCount: in std_logic_vector(3 downto 0);

            toBCD : out std_logic_vector(6 downto 0)
        );
END bcdDecoder;


architecture rtl of bcdDecoder is

    component dec_7seg is 

        PORT(
            i_hexDigit	: IN STD_LOGIC_VECTOR(3 downto 0);
            o_segment_a, o_segment_b, o_segment_c : out std_logic;
            o_segment_d, o_segment_e : out std_logic;
            o_segment_f, o_segment_g : out STD_LOGIC
        );

    end component dec_7seg;
    
    signal segA, segB, segC, segD, segE, segF, segG : std_logic;
    signal condensedSignal : std_logic;

    begin

        decConverter: dec_7seg port map (

            i_hexDigit => currentCount,
            o_segment_a => segA,
            o_segment_b => segB,
            o_segment_c => segC,
            o_segment_d => segD,
            o_segment_e => segE,
            o_segment_f => segF,
            o_segment_g => segG

        );

        toBCD(6) <= segA;
        toBCD(5) <= segB;
        toBCD(4) <= segC;
        toBCD(3) <= segD;
        toBCD(2) <= segE;
        toBCD(1) <= segF;
        toBCD(0) <= segG;


end rtl ; -- rtl