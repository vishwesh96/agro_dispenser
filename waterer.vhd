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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity waterer is
    Port ( land_state : inout  eight_three;
           rst : in  STD_LOGIC;
           water_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           watering : out  STD_LOGIC_VECtor(7 downto 0));
end waterer;

--0 barren
--1 1st tilling
--2 2nd tilling
--3 sowing
--4 watering
--5 seed sown
--6 cutting
--7 watering

architecture Behavioral of waterer is
begin
	process(clk,water_gnt)
	begin
		if rising_edge(clk) then
			if	rst='1' then
				watering<="00000000";
			else
				--land state
				watering<=water_gnt;
			end if;
		else
		
		end if;	
	end process;
end Behavioral;

