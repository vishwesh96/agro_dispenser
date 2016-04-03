----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:09 04/03/2016 
-- Design Name: 
-- Module Name:    dispenser - Behavioral 
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

entity dispenser is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           dipense_gnt : in  STD_LOGIC_VECTOR(7 downto 0);
           land_state : inout  eight_three;
           dispensing : out  STD_LOGIC_VECTOR(7 downto 0));
end dispenser;

architecture Behavioral of dispenser is

begin


end Behavioral;

