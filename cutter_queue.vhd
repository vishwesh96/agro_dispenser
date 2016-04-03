----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:20 04/03/2016 
-- Design Name: 
-- Module Name:    cutter_queue - Behavioral 
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

entity cutter_queue is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           crop_ht : in  eighth_three;
           cutting : in  STD_LOGIC_VECTOR(7 downto 0);
           crop_count : in  eight_eight;
           area : in  eight_sixteen;
           speed_cutter : in  STD_LOGIC_VECTOR(7 downto 0);
           cut_gnt : out  STD_LOGIC_VECTOR(7 downto 0));
end cutter_queue;

architecture Behavioral of cutter_queue is

begin


end Behavioral;

