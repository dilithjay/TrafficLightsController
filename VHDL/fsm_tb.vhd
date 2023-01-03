
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity fsm_tb is
end;

architecture bench of fsm_tb is

  component fsm
      Port ( wr : in STD_LOGIC := '0';
             sensor_sync : in STD_LOGIC := '0';
             prog_sync : in STD_LOGIC := '0';
             expired : in STD_LOGIC := '0';
             reset_sync: in STD_LOGIC := '0';
             clk: in STD_LOGIC;
             leds : out STD_LOGIC_VECTOR (6 downto 0) := "1000010";
             interval : out STD_LOGIC_VECTOR (1 downto 0) := "00";
             start_t : out STD_LOGIC := '1';
             wr_reset : out STD_LOGIC := '0');
  end component;

  signal wr: STD_LOGIC := '0';
  signal sensor_sync: STD_LOGIC := '0';
  signal prog_sync: STD_LOGIC := '0';
  signal expired: STD_LOGIC := '0';
  signal reset_sync: STD_LOGIC := '0';
  signal clk: STD_LOGIC;
  signal leds: STD_LOGIC_VECTOR (6 downto 0) := "1000010";
  signal interval: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal start_t: STD_LOGIC := '1';
  signal wr_reset: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: fsm port map ( wr          => wr,
                      sensor_sync => sensor_sync,
                      prog_sync   => prog_sync,
                      expired     => expired,
                      reset_sync  => reset_sync,
                      clk         => clk,
                      leds        => leds,
                      interval    => interval,
                      start_t     => start_t,
                      wr_reset    => wr_reset );

  stimulus: process
  begin
  
    -- Put initialisation code here

        sensor_sync <= '0';
        wr <= '0';
        expired <= '0';
        prog_sync <= '0';
		
		wait for 10 ns;
		expired <= '1';
		wait for 10 ns;
        expired <= '0';
		wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
		wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
		wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wr <= '1';
		wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wr <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        sensor_sync <= '1';
		wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
        wait for 10 ns;
        expired <= '1';
        wait for 10 ns;
        expired <= '0';
    -- Put test bench stimulus code here

--    stop_the_clock <= true;
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