library ieee;
use ieee.std_logic_1164.all;

ENTITY bcdDecodertb IS
END bcdDecodertb;

architecture rtl of bcdDecodertb is

    component bcdDecoder is 

        PORT(
            currentCount: in std_logic_vector(3 downto 0);

            toBCD : out std_logic_vector(6 downto 0)
        );

    end component bcdDecoder;

    signal currentCount : std_logic_vector(3 downto 0);
    signal toBCD : std_logic_vector(6 downto 0);


    begin

        testbench: bcdDecoder port map (

            currentCount => currentCount,
            toBCD => toBCD

        );

        testbenchbcdDecoder: process

            begin

                currentCount <= "0000";
                wait for 20 ns;
                assert(toBCD =  not("1111110"))
                report "test failed for combination 0000" severity error;
                

                currentCount <= "0001";
                wait for 20 ns;
                assert(toBCD = not "0110000")
                report "test failed for combination 0001" severity error;

                currentCount <= "0010";
                wait for 20 ns;
                assert(toBCD = not "1101101")
                report "test failed for combination 0010" severity error;

                currentCount <= "0011";
                wait for 20 ns;
                assert(toBCD = not "1111001")
                report "test failed for combination 1111" severity error;

                currentCount <= "0100";
                wait for 20 ns;
                assert(toBCD = not "0110011")
                report "test failed for combination 0100" severity error;

                currentCount <= "0101";
                wait for 20 ns;
                assert(toBCD = not "1011011")
                report "test failed for combination 0101" severity error;

                currentCount <= "0110";
                wait for 20 ns;
                assert(toBCD = not "1011111")
                report "test failed for combination 0110" severity error;

                currentCount <= "0111";
                wait for 20 ns;
                assert(toBCD = not "1110000")
                report "test failed for combination 0111" severity error;

                currentCount <= "1000";
                wait for 20 ns;
                assert(toBCD = not "1111111")
                report "test failed for combination 1000" severity error;

                currentCount <= "1001";
                wait for 20 ns;
                assert(toBCD = not "1111011")
                report "test failed for combination 1001" severity error;

                currentCount <= "1010";
                wait for 20 ns;
                assert(toBCD = not "1110111")
                report "test failed for combination 1010" severity error;

                currentCount <= "1011";
                wait for 20 ns;
                assert(toBCD = not "0011111")
                report "test failed for combination 1011" severity error;

                currentCount <= "1100";
                wait for 20 ns;
                assert(toBCD = not "1001110")
                report "test failed for combination 1100" severity error;

                currentCount <= "1101";
                wait for 20 ns;
                assert(toBCD = not "0111101")
                report "test failed for combination 1101" severity error;

                currentCount <= "1110";
                wait for 20 ns;
                assert(toBCD = not "1001111")
                report "test failed for combination 1110" severity error;

                currentCount <= "1111";
                wait for 20 ns;
                assert(toBCD = not "1000111")
                report "test failed for combination 1111" severity error;


                wait;

        end process;

end rtl ; -- rtl