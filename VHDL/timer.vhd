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
    Port ( tp_val : in STD_LOGIC_VECTOR (3 downto 0) := "0110";
           enable : in STD_LOGIC := '0';
           start_t : in STD_LOGIC := '1';
           reset_sync: in STD_LOGIC := '0';
           clk: in STD_LOGIC;
           expired : out STD_LOGIC := '0');
end timer;

architecture Behavioral of timer is

    signal count: integer := 0;
    signal change: STD_LOGIC := '1';
    signal restart_timer: STD_LOGIC := '0';
    signal enable_checked: STD_LOGIC := '0';

begin

    PROCESS (clk)
    begin
        IF rising_edge(clk) THEN
            IF reset_sync = '1' OR start_t = '1' THEN
                IF restart_timer = '0' THEN
                    change <= '0';
                    restart_timer <= '1';
                END IF;
            ELSE
                restart_timer <= '0';
            END IF;
            
            IF change = '0' THEN
                count <= to_integer(unsigned(tp_val));
                change <= '1';
            END IF;
            
            expired <= '0';
            IF enable = '1' THEN
                IF enable_checked = '0' THEN
                    IF count = 1 THEN
                        expired <= '1';
                    END IF;
                    IF count > 0 THEN
                        count <= count - 1;
                    END IF;
                    enable_checked <= '1';
                END IF;
            ELSE
                enable_checked <= '0';
            END IF;
        END IF;
    END PROCESS;

end Behavioral;