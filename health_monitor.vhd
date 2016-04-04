----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:14 04/04/2016 
-- Design Name: 
-- Module Name:    health_monitor - Behavioral 
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
use work.types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity health_monitor is
    Port ( clk : in  STD_LOGIC;
			  dead_probability : in  STD_LOGIC;
			  land_state : in  eight_three;
			  health_report : out  STD_LOGIC;
           rst : in  STD_LOGIC);
end health_monitor;

architecture Behavioral of health_monitor is

begin
process(clk)
begin
	if(rising_edge(clk)) then
		if rst='1' then
			health_report<='0';
		else
			if(land_state(0) = "111" and dead_probability = '1') then
				health_report <= '1';
			elsif(land_state(1) = "111" and dead_probability = '1') then
				health_report <= '1';
			elsif(land_state(2) = "111" and dead_probability = '1')then
				health_report <= '1';
			elsif(land_state(3) = "111" and dead_probability = '1')then
				health_report <= '1';
			elsif(land_state(4) = "111" and dead_probability = '1')then
				health_report <= '1';
			elsif(land_state(5) = "111" and dead_probability = '1')then
				health_report <= '1';
			elsif(land_state(6) = "111" and dead_probability = '1')then
				health_report <= '1';
			elsif(land_state(7) = "111" and dead_probability = '1')then
				health_report <= '1';
			else
				health_report <= '0';
			end if;
		end if;
	end if;
end process;
end Behavioral;

