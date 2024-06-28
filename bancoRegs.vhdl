-- Banco de Registradores

library ieee;
use ieee.std_logic_1164.all;

entity bancoReg3b is
    port(
        din     : in std_logic_vector(2 downto 0);
        cl, clk : in std_logic;
        dout    : out std_logic_vector(2 downto 0)
    );
end entity;

architecture storage of bancoReg3b is
    component ffd is
        port(
            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

begin

    r0 : ffd port map(din(0), clk, '1', cl, dout(0));
    r1 : ffd port map(din(1), clk, '1', cl, dout(1));
    r2 : ffd port map(din(2), clk, '1', cl, dout(2));

end architecture;
