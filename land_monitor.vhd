----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:03 04/03/2016 
-- Design Name: 
-- Module Name:    land_monitor - Behavioral 
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
use work.types.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity land_monitor is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           len : in  STD_LOGIC_VECTOR(7 downto 0);
           breadth : in  STD_LOGIC_VECTOR(7 downto 0);
           land_state : in  eight_three;
           barren_count : inout  eight_eight;
           humidity_check : in  eight_eight;
           crop_ht : inout  eight_three;
           duration : in  eight_ten;
           area : out  eight_sixteen;
           water_request  : out  STD_LOGIC_VECTOR(7 downto 0));
end land_monitor;

architecture Behavioral of land_monitor is
signal barren_counter :  eight_eight:=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
begin
	process(clk)
	begin
	if rising_edge(clk) then
		if rst='1' then
			water_request<="00000000";
			crop_ht<=("000","000","000","000","000","000","000","000");
			barren_count<=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
			land_state<=("000","000","000","000","000","000","000","000");
			for i in 0 to 7 loop
				area(i)<=len*breadth;
			end loop;
		else
			for i in 0 to 7 loop
				if not (land_state(i)="000" or land_state(i)="001" or land_state(i)="010" ) then
					barren_counter(i)<="00000000";
				else
					if not(barren_counter(i)="00001111") then
						barren_counter(i)<=barren_counter(i)+1;
					else
						barren_counter(i)<="00000000";
						for i in 0 to 7 loop
							barren_count(i) <= barren_count(i)+1; 
						end loop	;	
					end if;
				end if;
			end loop;
														--	else
														--		if not (falling_edge(clk)) then
														--			tilling<=till_gnt;			
														--		end if;
		end if;
	end if;
	end process;

end Behavioral;

