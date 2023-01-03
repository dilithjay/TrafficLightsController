library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity divider_tb is
end;

architecture bench of divider_tb is

  component divider
      Port ( clk: in STD_LOGIC;
             reset: in STD_LOGIC := '0';
             enable : out STD_LOGIC := '0');
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC := '0';
  signal enable: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: divider port map ( clk    => clk,
                          reset  => reset,
                          enable => enable );

  stimulus: process
  begin
  
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