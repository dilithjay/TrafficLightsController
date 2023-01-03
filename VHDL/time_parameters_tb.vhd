library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity time_parameters_tb is
end;

architecture bench of time_parameters_tb is

  component time_parameters
      Port ( tp_sel : in STD_LOGIC_VECTOR (1 downto 0) := "00";
             t_val : in STD_LOGIC_VECTOR (3 downto 0) := "0110";
             prog_sync : in STD_LOGIC := '0';
             reset : in STD_LOGIC := '0';
             clk: in STD_LOGIC;
             interval : in STD_LOGIC_VECTOR (1 downto 0) := "00";
             tp_val : out STD_LOGIC_VECTOR (3 downto 0) := "0110");
  end component;

  signal tp_sel: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal t_val: STD_LOGIC_VECTOR (3 downto 0) := "0110";
  signal prog_sync: STD_LOGIC := '0';
  signal reset: STD_LOGIC := '0';
  signal clk: STD_LOGIC;
  signal interval: STD_LOGIC_VECTOR (1 downto 0) := "00";
  signal tp_val: STD_LOGIC_VECTOR (3 downto 0) := "0110";

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: time_parameters port map ( tp_sel    => tp_sel,
                                  t_val     => t_val,
                                  prog_sync => prog_sync,
                                  reset     => reset,
                                  clk       => clk,
                                  interval  => interval,
                                  tp_val    => tp_val );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 30 ns;
    t_val <= "0010";
    wait for 20 ns;
    prog_sync <= '1';
    wait for 20 ns;
    prog_sync <= '0';
    wait for 40 ns;
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait for 100 ns;

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