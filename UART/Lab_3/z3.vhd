library ieee;
use ieee.std_logic_1164.all;

entity x3 is
    port (
        x3in:   in  std_logic;
        x3out:  out std_logic
    );
end entity;

architecture behv3 of x3 is
begin
    x3out <= x3in;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity y3 is
    port (
        y3in:   in  std_logic;
        y3out:  out std_logic
    );
end entity;

architecture behv3 of y3 is
begin   
    y3out <= y3in;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
entity z3 is
    port (
        z3in:   in  std_logic;
        z3out:  out std_logic
    );
end entity;

architecture foo of z3 is

    component x3 is
        port (
            x3in:   in  std_logic;
            x3out:  out std_logic
        );
    end component;

    component y3 is
        port (
            y3in:   in  std_logic;
            y3out:  out std_logic
        );
    end component;

    signal x3out:   std_logic;

    begin
        u0: x3 port map ( 
                x3in => z3in,
                x3out => x3out
            );
        u1: y3 port map ( 
                    y3in => x3out,
                    y3out => z3out
                );

end architecture;