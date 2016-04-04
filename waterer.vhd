----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:06 04/02/2016 
-- Design Name: 
-- Module Name:    waterer - Behavioral 
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

entity waterer is
    Port ( land_state : inout  eight_three:= ("011","101","000","000","000","000","000","000");
           rst : in  STD_LOGIC;
           water_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           watering : out  STD_LOGIC_VECtor(7 downto 0):="00000000");
end waterer;

--0 barren
--1 1st tilling
--2 2nd tilling
--3 sowing
--4 watering
--5 seed sown
--6 watering after sowing
--7 cutting

architecture Behavioral of waterer is
begin
	process(clk,water_gnt)
	begin
		if rising_edge(clk) then
			if	rst='1' then
				watering<="00000000";
			else
				watering<=water_gnt;				
				for i in 0 to 7 loop
					if(water_gnt(i) = '1') then
						if(land_state(i) = "011") then
							land_state(i) <= "100";
						elsif(land_state(i) = "101") then
							land_state(i) <= "110";

						else
						end if;
					end if;
				end loop;
			end if;
		else
		
		end if;	
	end process;
end Behavioral;

