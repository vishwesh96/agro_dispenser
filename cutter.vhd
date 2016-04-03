----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:20:39 04/03/2016 
-- Design Name: 
-- Module Name:    cutter - Behavioral 
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

entity cutter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           land_state : inout  eight_three;
           cut_gnt : in  STD_LOGIC_VECTOR(7 downto 0);
           cutting : out  STD_LOGIC_VECTOR(7 downto 0));
end cutter;

architecture Behavioral of cutter is

begin


end Behavioral;

