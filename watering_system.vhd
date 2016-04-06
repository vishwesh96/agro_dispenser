----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:32 04/05/2016 
-- Design Name: 
-- Module Name:    watering_system - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity watering_system is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  dts : in  std_logic_vector(21 downto 0) :="0000000000000000011111";
           watering : inout  STD_LOGIC_VECtor(7 downto 0);
			  water_request : in STD_LOGIC_VECtor(7 downto 0));
end watering_system;

architecture Behavioral of watering_system is
COMPONENT waterer
	PORT(
           rst : in  STD_LOGIC;
           water_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           watering : out  STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT waterer_queue
	PORT(
			 clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  dts :  std_logic_vector(21 downto 0);
			  watering : in  STD_LOGIC_VECTOR(7 downto 0);
           water_request : in  STD_LOGIC_VECTOR(7 downto 0);
           water_gnt : inout  STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

--signals
signal water_gnt : STD_LOGIC_VECTOR(7 downto 0);

begin
waterer1 :waterer

	PORT MAP(
	  rst=>rst,
	  water_gnt=>water_gnt,
	  clk=>clk,
	  watering=>watering 
	);

waterer_queue1 :waterer_queue

	PORT MAP(
			 clk=>clk, 
			  rst=>rst,
			  watering=>watering, 
			  dts=>dts,
           water_request=>water_request, 
           water_gnt=>water_gnt
	);


end Behavioral;

