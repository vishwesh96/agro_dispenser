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
use IEEE.NUMERIC_STD.ALL;

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
			  dts : in std_logic_vector(21 downto 0);		  
           len : in  STD_LOGIC_VECTOR(7 downto 0);
           breadth : in  STD_LOGIC_VECTOR(7 downto 0);
           land_state : in eight_three;
           barren_count : inout  eight_eight;
           humidity_check : in  eight_three;
			  cutting_request : inout STD_LOGIC_VECTOR(7 downto 0);
           duration : in  eight_ten;
           area : out  eight_sixteen;
           water_request  : out  STD_LOGIC_VECTOR(7 downto 0));
end land_monitor;

architecture Behavioral of land_monitor is
signal barren_counter :  eight_eight:=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
signal height_counter : eight_32:=("00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000"); 
signal height_rates : eight_32:=("00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000"); 
signal crop_ht : eight_three:=("000","000","000","000","000","000","000","000");
begin
	process(clk)
	begin
	if rising_edge(clk) then
		for i in 0 to 7 loop
			area(i)<=std_logic_vector(shift_right(unsigned(len*breadth),3)) ;
			height_rates(i)<=std_logic_vector(shift_right(unsigned(duration(i)*dts),3)) ;
		end loop;
		if rst='1' then
			water_request<="00000000";
			crop_ht<=("000","000","000","000","000","000","000","000");
			barren_count<=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
			cutting_request<="00000000";
			for i in 0 to 7 loop
				area(i)<=len*breadth;
			end loop;
		else
			for i in 0 to 7 loop
				if not (land_state(i)="000" or land_state(i)="001" or land_state(i)="010" ) then --barren or tilling states
					barren_count(i)<="00000000";
					barren_counter(i)<="00000000";
				else
					if not(barren_counter(i)= dts) then
						barren_counter(i)<=barren_counter(i)+1;
					else
						barren_counter(i)<="00000000";
						barren_count(i) <= barren_count(i)+1; 
					end if;
				end if;
				
				if not (land_state(i)="101" or land_state(i)="110") then
						crop_ht(i)<="000";
						cutting_request(i)<='0';
						height_counter(i)<="00000000000000000000000000000000";
				else
					if not(height_counter(i)= height_rates(i)) then
						if cutting_request(i)='0' then
							height_counter(i)<=height_counter(i)+1;
						end if;	
					else
						height_counter(i)<="00000000000000000000000000000000";					
						if crop_ht(i) ="111" then
							cutting_request(i)<='1';
						else					
							cutting_request(i)<='0';
							crop_ht(i)<=crop_ht(i)+1;
						end if;
					end if;
				end if;
				
				if land_state(i)="101" or land_state(i)="011" then							--water request is high only when land 
					if humidity_check(i)(0)='1' and humidity_check(i)(2)='0' then		-- state is seeds sown or sowing  and and humidity(i)(0)
						water_request(i)<='1';														-- is 1 and humidity(i)(2) is 0 (i.e. crop is not dead)
					else
						water_request(i)<='0';					
					end if;
				else
					water_request(i)<='0';				
				end if;
			end loop;
														--	else
														--		if not (falling_edge(clk)) then
														--			tilling<=till_gnt;													--		end if;
		end if;
	end if;
	end process;

end Behavioral;

