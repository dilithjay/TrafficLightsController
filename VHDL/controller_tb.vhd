library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity controller_tb is
end;

architecture bench of controller_tb is

  component controller
      Port ( reset : in STD_LOGIC := '0';
             sensor : in STD_LOGIC := '0';
             walk : in STD_LOGIC := '0';
             reprogram : in STD_LOGIC := '0';
             clk: in STD_LOGIC;
             tp_sel : in STD_LOGIC_VECTOR (1 downto 0) := "00";
             t_val : in STD_LOGIC_VECTOR (3 downto 0) := "0000";
             leds : out STD_LOGIC_VECTOR (6 downto 0));
  end component;

  signal reset: STD_LOGIC := '0';
  signal sensor: STD_LOGIC := '0';
  signal walk: STD_LOGIC := '0';
  signal reprogram: STD_LOGIC := '0';
  signal clk: STD_LOGIC;
  signal tp_sel: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal t_val: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal leds: STD_LOGIC_VECTOR (6 downto 0);
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: controller port map ( reset     => reset,
                             sensor    => sensor,
                             walk      => walk,
                             reprogram => reprogram,
                             clk       => clk,
                             tp_sel    => tp_sel,
                             t_val     => t_val,
                             leds      => leds );

  stimulus: process
  begin
    wait for 30 ns;
    walk <= '1';
    wait for 50 ns;
    walk <= '0';
    wait for 2000 ns;
    walk <= '1';
    wait for 50 ns;
    walk <= '0';
    wait for 200 ns;
    sensor <= '1';
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