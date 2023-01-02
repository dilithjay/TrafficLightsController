----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 07:33:29 PM
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

entity fsm is
    Port ( wr : in STD_LOGIC;
           sensor_sync : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           expired : in STD_LOGIC;
           reset_sync: in STD_LOGIC;
           clk: in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (6 downto 0) := "1000010";
           interval : out STD_LOGIC_VECTOR (1 downto 0) := "00";
           start_t : out STD_LOGIC := '1';
           wr_reset : out STD_LOGIC := '0');
end fsm;

architecture Behavioral of fsm is
    TYPE State_type IS (A, B, C, D, E, F); 
    signal state : State_type := A;

begin
  PROCESS (clk) 
  begin
    IF rising_edge(clk) THEN
        IF prog_sync = '1' OR reset_sync = '1' THEN
          state <= A;
          interval <= "00";
          start_t <= '1';
          wr_reset <= '0';
        END IF;
    
        IF expired = '1' THEN
          start_t <= '0';
          
          CASE state IS
            WHEN A =>
              -- When sensor is triggered, wait for tEXT instead of tBASE
              IF sensor_sync = '1' THEN
                interval <= "01";
              END IF;
              state <= B;
            WHEN B =>
              -- Switch Main street light from Green to Yellow
              leds <= "0100010";
              interval <= "10";
              state <= C;
            WHEN C =>
              -- Switch Main street light from Yellow to Red
              
              -- If walk button pressed turn both lights to red and turn on walk lamp
              IF wr = '1' THEN
                leds <= "0010011";
                interval <= "01";
                state <= D;
              -- Else turn on Side street Green light
              ELSE
                leds <= "0011000";
                interval <= "00";
                state <= E;
              END IF;
            WHEN D =>
              -- Turn on Side street Green light once walk period is over
              leds <= "0011000";
              interval <= "00";
              wr_reset <= '1';
              state <= E;
            WHEN E =>
              -- Switch Side street light from Green to Yellow
              leds <= "0010100";
              interval <= "10";
              wr_reset <= '0';
              state <= F;
            WHEN F =>
              -- Switch Side street light from Yellow to Green
              leds <= "1000010";
              interval <= "00";
              state <= A;
            WHEN others =>
              leds <= "0000000";
          END CASE;
        END IF;
    END IF;
  end PROCESS;
end Behavioral;