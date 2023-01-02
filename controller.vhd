----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 06:48:50 PM
-- Design Name: 
-- Module Name: controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( reset : in STD_LOGIC := '0';
           sensor : in STD_LOGIC := '0';
           walk : in STD_LOGIC := '0';
           reprogram : in STD_LOGIC := '0';
           clk: in STD_LOGIC;
           tp_sel : in STD_LOGIC_VECTOR (1 downto 0) := "00";
           t_val : in STD_LOGIC_VECTOR (3 downto 0) := "0000";
           leds : out STD_LOGIC_VECTOR (6 downto 0));
end controller;

architecture Behavioral of controller is

component fsm is
    Port ( wr : in STD_LOGIC;
           sensor_sync : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           expired : in STD_LOGIC;
           reset_sync: in STD_LOGIC;
           clk: in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (6 downto 0) := "1000010";
           interval : out STD_LOGIC_VECTOR (1 downto 0) := "00";
           start_t : out STD_LOGIC;
           wr_reset : out STD_LOGIC);
end component;

component synchronizer is
    Port ( reset : in STD_LOGIC;
           sensor : in STD_LOGIC;
           walk : in STD_LOGIC;
           reprogram : in STD_LOGIC;
           clk: in STD_LOGIC;
           reset_sync : out STD_LOGIC;
           sensor_sync : out STD_LOGIC;
           wr_sync : out STD_LOGIC;
           prog_sync : out STD_LOGIC);
end component;

component timer is
    Port ( tp_val : in STD_LOGIC_VECTOR (3 downto 0);
           enable : in STD_LOGIC;
           start_t : in STD_LOGIC;
           reset_sync: in STD_LOGIC;
           clk: in STD_LOGIC;
           expired : out STD_LOGIC);
end component;

component time_parameters is
    Port ( tp_sel : in STD_LOGIC_VECTOR (1 downto 0);
           t_val : in STD_LOGIC_VECTOR (3 downto 0);
           prog_sync : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           interval : in STD_LOGIC_VECTOR (1 downto 0);
           tp_val : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component walk_register is
    Port ( wr_sync : in STD_LOGIC;
           wr_reset : in STD_LOGIC;
           wr : out STD_LOGIC);
end component;

component divider is
    Port ( clk: in STD_LOGIC;
           reset: in STD_LOGIC;
           enable : out STD_LOGIC);
end component;

signal reset_sync: STD_LOGIC;
signal sensor_sync: STD_LOGIC;
signal wr_sync: STD_LOGIC;
signal prog_sync: STD_LOGIC;
signal wr: STD_LOGIC;
signal wr_reset: STD_LOGIC;
signal start_t: STD_LOGIC;
signal expired: STD_LOGIC;
signal enable: STD_LOGIC;
signal interval: STD_LOGIC_VECTOR (1 downto 0);
signal tp_val: STD_LOGIC_VECTOR (3 downto 0);
--signal leds_o: STD_LOGIC_VECTOR (6 downto 0);

begin

    sync_1: synchronizer PORT MAP (
        reset => reset,
        sensor => sensor,
        walk => walk,
        reprogram => reprogram,
        clk => clk,
        reset_sync => reset_sync,
        sensor_sync => sensor_sync,
        wr_sync => wr_sync,
        prog_sync => prog_sync
    );
    
    fsm_1: fsm PORT MAP (
        wr => wr,
        sensor_sync => sensor_sync,
        prog_sync => prog_sync,
        expired => expired,
        reset_sync => reset_sync,
        clk => clk,
        leds => leds,
        interval => interval,
        start_t => start_t,
        wr_reset => wr_reset
    );
    
    timer_1: timer PORT MAP(
        tp_val => tp_val,
        enable => enable,
        start_t => start_t,
        reset_sync => reset_sync,
        clk => clk,
        expired => expired
    );
    
    time_param_1: time_parameters PORT MAP(
        tp_sel => tp_sel,
        t_val => t_val,
        prog_sync => prog_sync,
        reset => reset_sync,
        clk => clk,
        interval => interval,
        tp_val => tp_val
    );
    
    divider_1: divider PORT MAP(
        reset => reset_sync,
        clk => clk,
        enable => enable
    );
    
    walk_register_1: walk_register PORT MAP(
        wr_sync => wr_sync,
        wr_reset => wr_reset,
        wr => wr
    );
    
end Behavioral;