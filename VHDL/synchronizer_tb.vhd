library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity synchronizer_tb is
end;

architecture bench of synchronizer_tb is

  component synchronizer
      Port ( reset : in STD_LOGIC := '0';
             sensor : in STD_LOGIC := '0';
             walk : in STD_LOGIC := '0';
             reprogram : in STD_LOGIC := '0';
             clk: in STD_LOGIC;
             reset_sync : out STD_LOGIC := '0';
             sensor_sync : out STD_LOGIC := '0';
             wr_sync : out STD_LOGIC := '0';
             prog_sync : out STD_LOGIC := '0');
  end component;

  signal reset: STD_LOGIC := '0';
  signal sensor: STD_LOGIC := '0';
  signal walk: STD_LOGIC := '0';
  signal reprogram: STD_LOGIC := '0';
  signal clk: STD_LOGIC;
  signal reset_sync: STD_LOGIC := '0';
  signal sensor_sync: STD_LOGIC := '0';
  signal wr_sync: STD_LOGIC := '0';
  signal prog_sync: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: synchronizer port map ( reset       => reset,
                               sensor      => sensor,
                               walk        => walk,
                               reprogram   => reprogram,
                               clk         => clk,
                               reset_sync  => reset_sync,
                               sensor_sync => sensor_sync,
                               wr_sync     => wr_sync,
                               prog_sync   => prog_sync );

  stimulus: process
  begin
  
    reset <= '1';
    wait for 1 ns;
    sensor <= '1';
    wait for 1 ns;
    walk <= '1';
    wait for 1 ns;
    reprogram <= '1';
    wait for 7 ns;
    reset <= '0';
    wait for 1 ns;
    sensor <= '0';
    wait for 1 ns;
    walk <= '0';
    wait for 1 ns;
    reprogram <= '0';

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