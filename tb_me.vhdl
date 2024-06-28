-- ghdl -a *.vhdl ; ghdl -r tb_me --wave=tb_me.ghw --stop-time=300ns

library ieee;
use ieee.std_logic_1164.all;

entity tb_me is
end entity;

architecture tb of tb_me is
    constant cicloClock : time := 20 ns;

    component me is
        port(
            rst, clk : in std_logic;
            m50, m25 : in std_logic;
            cof, disp, dev, m_rec  : out std_logic     
        );
    end component;

    -- sinais controle
    signal srst : std_logic := '1';
    signal sclk : std_logic := '0';

    -- Estimulo

    signal sm50, sm25 : std_logic := '0';
    
    --Sinal saidas
    signal scof, sdisp, sdev, sm_rec : std_logic := '0';

begin
    sclk <= not(sclk) after cicloClock / 2;

    -- A Máquina de Estado:
    u_me : me port map(srst, sclk, sm50, sm25, scof, sdisp, sdev, sm_rec);

    tb_rst : process
    begin
        -- reset inicial
        srst <= '0';
        wait for cicloClock;
        srst <= '1';
        wait for cicloClock;
        
        -- .25 + .50 + .25 = 1.00
        sm25 <= '1';
        sm50 <= '0';
        wait for cicloClock;
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        sm25 <= '1';
        sm50 <= '0';
        wait for cicloClock;
        
        -- .5 + .5 = 1.00
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        sm25 <= '0';
        sm50 <= '0';
        wait for cicloClock;
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        
        --Passar de 1
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        sm25 <= '1';
        sm50 <= '0';
        wait for cicloClock;
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        
        --Duas ao mesmo tempo
        sm25 <= '0';
        sm50 <= '1';
        wait for cicloClock;
        sm25 <= '1';
        sm50 <= '1';
        wait for cicloClock; 
        --reset
        srst <= '0';
        sm25 <= '0';
        sm50 <= '0';
        wait for cicloClock;
        srst <= '1';
        wait for cicloClock;
        
    end process;

end architecture;
