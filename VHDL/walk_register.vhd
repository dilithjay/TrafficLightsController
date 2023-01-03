----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 07:42:03 PM
-- Design Name: 
-- Module Name: walk_register - Behavioral
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

entity walk_register is
    Port ( wr_sync : in STD_LOGIC := '0';
           wr_reset : in STD_LOGIC := '0';
           wr : out STD_LOGIC := '0');
end walk_register;

architecture Behavioral of walk_register is

begin

    PROCESS(wr_sync, wr_reset)
    begin
        IF wr_sync = '1' THEN
            wr <= '1';
        END IF;
        IF wr_reset = '1' THEN
            wr <= '0';
        END IF;
        
    end PROCESS;

end Behavioral;
