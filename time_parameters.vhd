----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 07:42:03 PM
-- Design Name: 
-- Module Name: time_parameters - Behavioral
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

entity time_parameters is
    Port ( tp_sel : in STD_LOGIC_VECTOR (1 downto 0);
           t_val : in STD_LOGIC_VECTOR (3 downto 0);
           prog_sync : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk: in STD_LOGIC;
           interval : in STD_LOGIC_VECTOR (1 downto 0) := "00";
           tp_val : out STD_LOGIC_VECTOR (3 downto 0));
end time_parameters;

architecture Behavioral of time_parameters is

signal t_b: STD_LOGIC_VECTOR (3 downto 0) := "0110";
signal t_e: STD_LOGIC_VECTOR (3 downto 0) := "0011";
signal t_y: STD_LOGIC_VECTOR (3 downto 0) := "0010";

begin

    PROCESS(clk)
    begin
        IF rising_edge(clk) THEN
            IF interval = "00" THEN
                tp_val <= t_b;
            ELSIF interval = "01" THEN
                tp_val <= t_e;
            ELSIF interval = "10" THEN
                tp_val <= t_y;
            END IF;
        
            IF reset = '1' THEN
                t_b <= "0110";
                t_e <= "0011";
                t_y <= "0010";
            END IF;
            
            IF prog_sync = '1' THEN
                IF tp_sel = "00" THEN
                    t_b <= t_val;
                ELSIF tp_sel = "01" THEN
                    t_e <= t_val;
                ELSIF tp_sel = "10" THEN
                    t_y <= t_val;
                END IF;
            END IF;
        END IF;
    end PROCESS;    

end Behavioral;
