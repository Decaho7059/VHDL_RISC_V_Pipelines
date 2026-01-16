library ieee;
use ieee.std_logic_1164.all;

entity mainStreetCounter is
    port (
        GClock : in std_logic;
        reset: in std_logic;

        counter : in std_logic_vector(3 downto 0);
        currentCounterValue : out std_logic_vector(3 downto 0) 
    );
end mainStreetCounter;

architecture rtl of mainStreetCounter is

    

begin

end rtl ; -- rtl