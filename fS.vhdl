-- Função de Saída
-- Estados com 3 bits

library ieee;
use ieee.std_logic_1164.all;

entity fs is
    port(
        ea  : in std_logic_vector(2 downto 0);
        disp, cof, dev, m_rec : out std_logic
    );
end entity;

architecture calc of fs is
  
  
begin

    disp <= ea(2) and not ea(1);
    cof <= ea(2) and not ea(1);
    dev <= ea(1) and ea(2);
    m_rec <= not ea(2);

end;
