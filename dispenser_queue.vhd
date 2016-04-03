----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:13:52 04/03/2016 
-- Design Name: 
-- Module Name:    dispenser_queue - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dispenser_queue is
    Port ( humidity_check : in  eight_eight;
           tilling : in  STD_LOGIC_VECTOR(7 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           speed_dispenser : in  STD_LOGIC_VECTOR(7 downto 0);
           dispensing : in  STD_LOGIC_VECTOR(7 downto 0);
           len : in  STD_LOGIC_VECTOR(7 downto 0);
           breadth : in  STD_LOGIC_VECTOR(7 downto 0);
           land_state : inout  eight_three;
           water_request : out  STD_LOGIC_VECTOR(7 downto 0);
           dispense_gnt : out  STD_LOGIC_VECTOR(7 downto 0));
end dispenser_queue;

architecture Behavioral of dispenser_queue is

begin


end Behavioral;

