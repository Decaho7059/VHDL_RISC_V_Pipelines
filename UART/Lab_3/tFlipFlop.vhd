LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tFlipFlop is
	port(
	
		i_t : in std_logic;
		t_clock : in std_logic;
		out_q, out_qBar : out std_logic

	);
end entity tFlipFlop;

architecture rtl of tFlipFlop is

    component xor_gate is

        port (
            x_xor : in std_logic;
            y_xor : in std_logic;

            z_xor : out std_logic
        );

    end component xor_gate;

    component nor_gate is 

        port(

            x_nor : in std_logic;
            y_nor : in std_logic;

            z_nor : out std_logic

        );

    end component nor_gate;

    component and3_gate is 

        port(

            x_and : in std_logic;
            y_and : in std_logic;
            z_and : in std_logic;

            out_and : out std_logic

        );

    end component and3_gate;

    component srFlipFlop is

        port(
	
            set, reset : in std_logic;
            q, qBar : out std_logic
        
        );

    end component srFlipFlop;

    
        signal rNorSignal, sNorSignal, qSignal, qBarSignal : std_logic;

    begin

        rAndGate: and3_gate port map (
                x_and => i_t,
                y_and => t_clock,
                z_and => qSignal,

                out_and => rNorSignal

		);

        sAndGate: and3_gate port map (
                x_and => i_t,
                y_and => t_clock,
                z_and => qBarSignal,

                out_and => sNorSignal

		);

        flipflopSR: srFLipFlop port map (

            set => rNorSignal,
            reset => sNorsignal,
		    q => qSignal,
            qBar => qBarSignal

        );
        
        out_q <= qSignal;
        out_qBar <= qBarSignal;

end rtl; 