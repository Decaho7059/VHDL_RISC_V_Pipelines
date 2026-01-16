library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port (
        GClock : in std_logic;
        enable : in std_logic;
        d_input : in std_logic_vector(3 downto 0);
        resetBar : in std_logic;
        
        d_out : out std_logic_vector(3 downto 0);
        done : out std_logic
    );
end counter;

architecture rtl of counter is

    component enARdFF_2 is 

        port(
            i_resetBar	: IN	STD_LOGIC;
            i_d	        : IN	STD_LOGIC;
            i_enable	: IN	STD_LOGIC;
            i_clock		: IN	STD_LOGIC;
            o_q, o_qBar	: OUT	STD_LOGIC
        );

    end component enARdFF_2;

    signal yNext0, yNext1, yNext2, yNext3, count0, count1, count2, count3, z : std_logic;
    signal yInput0, yInput1, yInput2, yInput3 : std_logic := '1';
    signal qBar0, qBar1, qBar2, qBar3 : std_logic;
    signal int_q0, int_q1, int_q2, int_q3 : std_logic;
    signal test : std_logic;
    signal i_resetBar : std_logic;
    signal int_qBar0, int_qBar1, int_qBar2, int_qBar3 : std_logic;

    begin

        yNext0 <= enable xor yInput0;
        
        yNext1 <= ( enable and yInput0 ) or ( not(enable) and yInput1 );
        yNext2 <= ( enable and ( ( yInput2 and yInput1 ) or ( yInput2 and yInput0 ) or ( not(yInput2) and not(yInput1) and not(yInput0) ) ) )   or   ( not(enable) and ( yInput2 ) );
        yNext3 <= ( enable and ( ( not( yInput3 and yInput2 and yInput1 and yInput0 ) ) or ( yInput3 and ( yInput2 or yInput1 or yInput0 ) ) ) ) or ( not(enable) and yInput3 );

        dflipflop0: enARdFF_2 port map (

            i_d => yNext0,
            i_resetBar => resetBar,
            i_enable => enable,
            i_clock => GClock,
            o_q => int_q0,
            o_qBar => qBar0

        );

        yInput0 <= int_q0;
        yInput1 <= int_q1;
        yInput2 <= int_q2;
        yInput3 <= int_q3;
		  
        dflipflop1: enARdFF_2 port map (

            i_d => yNext1,
            i_resetBar => resetBar,
            i_enable => enable,
            i_clock => GClock,
            o_q => int_q1,
            o_qBar => qBar1

        );
        dflipflop2: enARdFF_2 port map (

            i_d => yNext2,
            i_resetBar => resetBar,
            i_enable => enable,
            i_clock => GClock,
            o_q => int_q2,
            o_qBar => qBar2

        );
        dflipflop3: enARdFF_2 port map (

            i_d => yNext3,
            i_resetBar => resetBar,
            i_enable => enable,
            i_clock => GClock,
            o_q => int_q3,
            o_qBar => qBar3

        );

        z <= not yInput0 and not yInput1 and not yInput2 and not yInput3;

        done <= z;
        d_out(0) <= int_q0;
        d_out(1) <= int_q1;
        d_out(2) <= int_q2;
        d_out(3) <= int_q3;

        

end rtl;