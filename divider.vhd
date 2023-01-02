----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 07:42:03 PM
-- Design Name: 
-- Module Name: divider - Behavioral
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

entity divider is
    Port ( clk: in STD_LOGIC;
           reset: in STD_LOGIC;
           enable : out STD_LOGIC);
end divider;

architecture Behavioral of divider is

    signal count: integer := 1;
    signal tmp : std_logic := '0';
  
begin
  
    PROCESS(clk, reset, tmp)
    begin
        IF(reset = '1') THEN
            count <= 1;
            tmp <= '0';
        ELSIF(clk'event and clk='1') THEN
            count <= count + 1;
            IF (count = 49_999_999) THEN
                tmp <= NOT tmp;
                count <= 1;
            end IF;
        end IF;
        enable <= tmp;
    end PROCESS;

end Behavioral;
