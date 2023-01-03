library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity walk_register_tb is
end;

architecture bench of walk_register_tb is

  component walk_register
      Port ( wr_sync : in STD_LOGIC := '0';
             wr_reset : in STD_LOGIC := '0';
             wr : out STD_LOGIC := '0');
  end component;

  signal wr_sync: STD_LOGIC := '0';
  signal wr_reset: STD_LOGIC := '0';
  signal wr: STD_LOGIC := '0';

begin

  uut: walk_register port map ( wr_sync  => wr_sync,
                                wr_reset => wr_reset,
                                wr       => wr );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 10 ns;
    wr_sync <= '1';
    wait for 10 ns;
    wr_sync <= '0';
    wait for 20 ns;
    wr_reset <= '1';
    wait for 10 ns;
    wr_reset <= '0';

    -- Put test bench stimulus code here

    wait;
  end process;


end;