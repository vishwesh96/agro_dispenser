----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:06 04/02/2016 
-- Design Name: 
-- Module Name:    tiller - Behavioral 
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

entity tiller is
    Port ( land_state : inout  eight_three:= ("000","010","000","000","000","000","000","000");
           rst : in  STD_LOGIC;
           till_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           tilling : out  STD_LOGIC_VECtor(7 downto 0):="00000000");
end tiller;

--0 barren
--1 1st tilling
--2 2nd tilling
--3 sowing
--4 watering
--5 seed sown
--6 watering after sowing
--7 cutting

architecture Behavioral of tiller is
signal till_gnt_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if	rst='1' then
				tilling<="00000000";
			else
				tilling<=till_gnt;				
				for i in 0 to 7 loop
					if(till_gnt(i) = '1') then
						if(land_state(i) = "000") then
							land_state(i) <= "001";
						end if;
					else
						if(till_gnt_prev(i) = '1') then
							if(land_state(i) <= "001") then
								land_state(i) <= "010";
							elsif(land_state(i) <= "010") then
								land_state(i) <= "011";
							end if;
						end if;
					end if;
				end loop;
			end if;
			till_gnt_prev <= till_gnt;
		end if;	
	end process;
end Behavioral;

