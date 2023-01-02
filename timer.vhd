----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 07:15:32 PM
-- Design Name: 
-- Module Name: timer - Behavioral
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
USE IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Port ( tp_val : in STD_LOGIC_VECTOR (3 downto 0);
           enable : in STD_LOGIC:= '0';
           start_t : in STD_LOGIC := '1';
           reset_sync: in STD_LOGIC;
           clk: in STD_LOGIC;
           expired : out STD_LOGIC := '0');
end timer;

architecture Behavioral of timer is

    signal count: integer := 1;
    signal change: STD_LOGIC := '1';

begin

    PROCESS (clk)
    begin
        IF rising_edge(clk) THEN
            IF reset_sync = '1' THEN
                change <= '0';
            END IF;
            
            IF start_t = '1' THEN
                change <= '0';
            END IF;
            
            IF change = '0' THEN
                count <= to_integer(signed(tp_val));
                change <= '1';
            END IF;
            
            expired <= '0';
            
            IF enable = '1' THEN
                IF count = 1 THEN
                    expired <= '1';
                ELSE
                    count <= count - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

end Behavioral;