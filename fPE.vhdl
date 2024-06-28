-- Função de Próximo Estado
-- Estados com 3 bits

library ieee;
use ieee.std_logic_1164.all;

entity fpe is
    port(
        ea  : in std_logic_vector(2 downto 0);
        m25, m50 : in std_logic;
        pe  : out std_logic_vector(2 downto 0)
    );
end entity;

architecture calc of fpe is
    
    begin

        pe(2) <= (m50 and m25) or (not ea(2) and ea(0) and m50) or (not ea(2) and ea(1) and ea(0) and m25);

        pe(1) <= (not ea(1) and m25) or (m50 and m25) or (not ea(2) and ea(1) and not m25) or (ea(2) and m25);

        pe(0) <= (not ea(0) and m50) or (ea(1) and m50) or (ea(0) and not ea(1) and m25) or (not ea(0) and ea(1) and m25) or (ea(0) and ea(2) and not m25 and not m50);

end;
