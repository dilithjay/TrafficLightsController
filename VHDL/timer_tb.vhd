library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity timer_tb is
end;

architecture bench of timer_tb is

  component timer
      Port ( tp_val : in STD_LOGIC_VECTOR (3 downto 0) := "0110";
             enable : in STD_LOGIC:= '0';
             start_t : in STD_LOGIC := '1';
             reset_sync: in STD_LOGIC := '0';
             clk: in STD_LOGIC;
             expired : out STD_LOGIC := '0');
  end component;

  signal tp_val: STD_LOGIC_VECTOR (3 downto 0) := "0110";
  signal enable: STD_LOGIC:= '0';
  signal start_t: STD_LOGIC := '1';
  signal reset_sync: STD_LOGIC := '0';
  signal clk: STD_LOGIC;
  signal expired: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: timer port map ( tp_val     => tp_val,
                        enable     => enable,
                        start_t    => start_t,
                        reset_sync => reset_sync,
                        clk        => clk,
                        expired    => expired );

  stimulus: process
  begin
  
    -- Put initialisation code here

    wait for 10 ns;
    enable <= '1';
    tp_val <= "0011";
    start_t <= '0';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    start_t <= '1';
    enable <= '1';
    wait for 10 ns;
    start_t <= '0';
    wait for 20 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    enable <= '0';
    wait for 30 ns;
    enable <= '1';
    wait for 30 ns;
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
