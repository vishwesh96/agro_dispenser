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

entity dispenser is
    Port ( 
           rst : in  STD_LOGIC;
           dispense_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           dispensing : out  STD_LOGIC_VECtor(7 downto 0):="00000000");
end dispenser;

--0 barren
--1 1st tilling
--2 2nd tilling
--3 sowing
--4 watering
--5 seed sown
--6 watering after sowing
--7 cutting

architecture Behavioral of dispenser is
signal dispense_gnt_prev : STD_LOGIC_VECTOR(7 downto 0):="00000000";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if	rst='1' then
				dispensing<="00000000";
				land_state<=("000","000","000","000","000","000","000","000");				
			else
				dispensing<=dispense_gnt;				
			end if;
		end if;	
	end process;
end Behavioral;

