----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:42:05 04/04/2016 
-- Design Name: 
-- Module Name:    humidity_checker - Behavioral 
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

entity humidity_checker is
    Port ( rst : in  STD_LOGIC;
			  humidity : in  eight_eight;
			  lower_humidity_thresholds : in eight_eight;
			  upper_humidity_thresholds : in eight_eight;
			  humidity_check : out eight_two;
           clk : in  STD_LOGIC);
end humidity_checker;

architecture Behavioral of humidity_checker is

begin
	process(clk,rst)
	begin
		if(rising_edge(clk)) then
			
			-- No reset is needed since it is a combinational block
			if(rst ='1') then
				--for i in 0 to 7 loop
					-- Reset => humidity value becomes upper thershold humidity.
					--humidity(i)<= upper_humidity_thresholds(i);
				--end loop;
			else
				for i in 0 to 7 loop
					if(humidity(i) >  lower_humidity_thresholds(i)) then
						humidity_check(i)(0) <= '0';
					else
						humidity_check(i)(0) <= '1';
					end if;
				end loop;
				
				for i in 0 to 7 loop
					if(humidity(i) >  upper_humidity_thresholds(i)) then
						humidity_check(i)(1) <= '1';
					else
						humidity_check(i)(1) <= '0';
					end if;
				end loop;
			end if;
		end if;
 	end process;
	

end Behavioral;

