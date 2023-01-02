library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity timer_tb is
end;

architecture bench of timer_tb is

  component timer
      Port ( tp_val : in STD_LOGIC_VECTOR (3 downto 0):= "0000";
             enable : in STD_LOGIC:= '0';
             start_t : in STD_LOGIC := '0';
             expired : out STD_LOGIC := '0');
  end component;

  signal tp_val: STD_LOGIC_VECTOR (3 downto 0):= "0000";
  signal enable: STD_LOGIC:= '0';
  signal start_t: STD_LOGIC := '0';
  signal expired: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: timer port map ( tp_val  => tp_val,
                        enable  => enable,
                        start_t => start_t,
                        expired => expired );

  stimulus: process
  begin
  
    wait for 20 ns;
    tp_val <= "0011";
    start_t <= '1', '0' after 10 ns;
    wait for 100 ns;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      enable <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;