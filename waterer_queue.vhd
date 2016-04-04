----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:12:27 04/03/2016 
-- Design Name: 
-- Module Name:    waterer_queue - Behavioral 
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

entity waterer_queue is
    Port ( watering : in  STD_LOGIC_VECTOR(7 downto 0);
           water_request : in  STD_LOGIC_VECTOR(7 downto 0);
           water_gnt : out  STD_LOGIC_VECTOR(7 downto 0));
end waterer_queue;

architecture Behavioral of waterer_queue is

begin


end Behavioral;

