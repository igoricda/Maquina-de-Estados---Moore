-- M.E.
-- Estados com 3 bits

library ieee;
use ieee.std_logic_1164.all; 

entity me is
    port(
        rst, clk : in std_logic;
        m50, m25 : in std_logic;
        cof, disp, dev, m_rec  : out std_logic
    );
end entity;

architecture doit of me is
    -- Função de Próximo Estado
    component fpe is
        port(
            ea  : in std_logic_vector(2 downto 0);
            m25, m50 : in std_logic;
            pe  : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Banco de Registradores
    component bancoReg3b is
        port(
            din     : in std_logic_vector(2 downto 0);
            cl, clk : in std_logic;
            dout    : out std_logic_vector(2 downto 0)
        );
    end component;
    
    --Funcao de saida
    component fs is
        port(
            ea  : in std_logic_vector(2 downto 0);
            disp, cof, dev, m_rec : out std_logic
        );
    end component;

    -- Sinais internos
    signal spe_reg, sreg_ea : std_logic_vector(2 downto 0);

begin

    -- f(ea)
    u_fpe : fpe port map(sreg_ea, m25, m50, spe_reg);

    -- registradores
    u_reg : bancoReg3b port map(spe_reg, rst, clk, sreg_ea);

    -- s(ea)
    u_fs : fs port map(spe_reg, disp, cof, dev, m_rec);


end architecture;
