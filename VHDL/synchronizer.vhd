----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 06:54:47 PM
-- Design Name: 
-- Module Name: synchronizer - Behavioral
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

entity synchronizer is
    Port ( reset : in STD_LOGIC := '0';
           sensor : in STD_LOGIC := '0';
           walk : in STD_LOGIC := '0';
           reprogram : in STD_LOGIC := '0';
           clk: in STD_LOGIC;
           reset_sync : out STD_LOGIC := '0';
           sensor_sync : out STD_LOGIC := '0';
           wr_sync : out STD_LOGIC := '0';
           prog_sync : out STD_LOGIC := '0');
end synchronizer;

architecture Behavioral of synchronizer is

begin

    PROCESS(clk)
    begin
        IF rising_edge(clk) THEN
            -- TODO: Debounce
            reset_sync <= reset;
            sensor_sync <= sensor;
            wr_sync <= walk;
            prog_sync <= reprogram;
        end IF;
    end PROCESS;

end Behavioral;