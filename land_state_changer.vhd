----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:52:02 04/06/2016 
-- Design Name: 
-- Module Name:    land_state_changer - Behavioral 
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

entity land_state_changer is
    Port ( tilling : in  STD_LOGIC_vector(7 downto 0);
			  clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           cutting : in  STD_LOGIC_vector(7 downto 0);
           dispensing : in  STD_LOGIC_vector(7 downto 0);
           watering : in  STD_LOGIC_vector(7 downto 0);
           land_state : inout  eight_three:= ("000","000","000","000","000","000","000","000"));
end land_state_changer;

architecture Behavioral of land_state_changer is
signal tilling_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
signal cutting_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
signal watering_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
signal dispensing_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
signal land_state_prev : STD_LOGIC_VECTOR(2 downto 0):="000";

begin
process(clk)
begin
if(rising_edge(clk)) then
	if(rst= '1') then
		land_state <= ("000","000","000","000","000","000","000","000");
		tilling_prev <= "00000000";
		watering_prev <= "00000000"; 
		cutting_prev <= "00000000";
		dispensing_prev <= "00000000";
	else
			for i in 0 to 7 loop
					if(watering(i) = '1') then
						if(land_state(i) = "011") then
							land_state(i) <= "100";
							land_state_prev <= "011";
						elsif(land_state(i) = "101") then
							land_state(i) <= "100";
							land_state_prev <= "101";
						end if;
					else
						if(watering_prev(i) = '1') then
							land_state(i) <= land_state_prev;
						end if;
					end if;
					
					if(dispensing_prev(i) = '1' and dispensing(i) = '0') then
						land_state(i) <= "101";
					end if;
					
					if(tilling(i) = '1') then
						if(land_state(i) = "000") then
							land_state(i) <= "001";
						end if;
					else
						if(tilling_prev(i) = '1') then
							if(land_state(i) <= "001") then
								land_state(i) <= "010";
							elsif(land_state(i) <= "010") then
								land_state(i) <= "011";
							end if;
						end if;
					end if;
					
					if(cutting(i) = '1') then
						if(land_state(i) = "110") then
							land_state(i) <= "111";
						elsif(land_state(i) = "101") then
							land_state(i) <= "111";
						end if;
					else
						if(cutting_prev(i) = '1') then
							land_state(i) <= "000";
						end if;
					end if;
			end loop;
			cutting_prev <= cutting;
			tilling_prev <= tilling;
			dispensing_prev <= dispensing;
			watering_prev <= watering;
		end if;
	end if;
end process;

end Behavioral;

