----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:48 04/05/2016 
-- Design Name: 
-- Module Name:    top_agro - Behavioral 
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

entity top_agro is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           humidity : in  eight_eight;
           lower_humidity_thresholds : in  eight_eight;
           upper_humidity_thresholds : in  eight_eight;
           len : in  STD_LOGIC_VECTOR(7 downto 0);
           breadth : in  STD_LOGIC_VECTOR(7 downto 0);
           duration : in  eight_ten;
           speed_dispenser : in  STD_LOGIC_VECTOR(7 downto 0);
           speed_tiller : in  STD_LOGIC_VECTOR(7 downto 0);
           speed_cutter : in  STD_LOGIC_VECTOR(7 downto 0);
           crop_count : in  eight_eight;
           dead_probability : in  STD_LOGIC;
           tilling : inout  STD_LOGIC_VECTOR(7 downto 0);
           dispensing : inout  STD_LOGIC_VECTOR(7 downto 0);
           watering : inout  STD_LOGIC_VECTOR(7 downto 0);
           cutting : inout  STD_LOGIC_VECTOR(7 downto 0);
           health_report : out  STD_LOGIC);
end top_agro;

architecture Behavioral of top_agro is

COMPONENT humidity_checker
	PORT(
		  rst : in  STD_LOGIC;
		  humidity : in  eight_eight;
		  lower_humidity_thresholds : in eight_eight;
		  upper_humidity_thresholds : in eight_eight;
		  humidity_check : out eight_two;
		  clk : in  STD_LOGIC	
	);
END COMPONENT;

COMPONENT land_monitor
	PORT(
		  rst : in  STD_LOGIC;
		  clk : in  STD_LOGIC;
		  len : in  STD_LOGIC_VECTOR(7 downto 0);
		  breadth : in  STD_LOGIC_VECTOR(7 downto 0);
		  land_state : in eight_three;
		  barren_count : inout  eight_eight;
		  humidity_check : in  eight_two;
		  cutting_request : inout STD_LOGIC_VECTOR(7 downto 0);
		  duration : in  eight_ten;
		  area : out  eight_sixteen;
		  water_request  : out  STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

COMPONENT health_monitor
	PORT(
		clk : in  STD_LOGIC;
		  dead_probability : in  STD_LOGIC;
		  land_state : in  eight_three;
		  health_report : out  STD_LOGIC;
		  rst : in  STD_LOGIC
	);
END COMPONENT;

COMPONENT tilling_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  land_state : inout  eight_three;
		  tilling : inout  STD_LOGIC_VECtor(7 downto 0);
		  barren_count : in eight_eight;
		  speed_tiller : in STD_LOGIC_VECtor(7 downto 0);
		  area : in eight_sixteen
	);
END COMPONENT;

COMPONENT dispensing_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  humidity_check : in  eight_two;
		  speed_dispenser : in  STD_LOGIC_VECtor(7 downto 0);
		  breadth : in  STD_LOGIC_VECtor(7 downto 0);
		  area : in  eight_sixteen;
		  land_state : inout  eight_three;
		  dispensing : inout  STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT watering_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  land_state : inout  eight_three;
		  watering : inout  STD_LOGIC_VECtor(7 downto 0);
		  water_request : in STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT cutting_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  land_state : inout  eight_three;
		  cutting : inout  STD_LOGIC_VECtor(7 downto 0);
		  speed_cutter : in STD_LOGIC_VECtor(7 downto 0);
		  area : in  eight_sixteen;
		  crop_count : in  eight_eight;
		  cutting_request : in STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;



--signals
	signal humidity_check : eight_two;
	signal land_state : eight_three;
	signal barren_count : eight_eight;
	signal cutting_request : STD_LOGIC_VECTOR(7 downto 0);
	signal water_request: STD_LOGIC_VECTOR(7 downto 0);
	signal area : eight_sixteen;
	signal crop_ht : eight_three;

begin

humidity_checker1 : humidity_checker
	PORT MAP(
		  rst=>rst,
		  humidity=>humidity,
		  lower_humidity_thresholds=>lower_humidity_thresholds,
		  upper_humidity_thresholds=>upper_humidity_thresholds,
		  humidity_check=>humidity_check,
		  clk=>clk
	);

land_monitor1 : land_monitor
	PORT MAP(
		  rst=>rst,
		  clk=>clk,
		  len=>len,
		  breadth=>breadth,
		  land_state=>land_state,
		  barren_count=>barren_count,
		  humidity_check=>humidity_check,
		  cutting_request=>cutting_request,
		  duration=>duration,
		  area=>area,
		  water_request=>water_request
	);

health_monitor1 : health_monitor
	PORT MAP(
		  clk=>clk,
		  dead_probability=>dead_probability,
		  land_state=>land_state,
		  health_report=>health_report,
		  rst=>rst
	);

tilling_system1 : tilling_system
	PORT MAP(
		 clk=>clk,
		  rst=>rst, 
		  land_state=>land_state, 
		  tilling=>tilling,
		  barren_count=>barren_count,
		  speed_tiller=>speed_tiller,
		  area=>area 
	);
	
dispensing_system1 : dispensing_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  humidity_check=>humidity_check,
		  speed_dispenser=>speed_dispenser, 
		  breadth=>breadth,
		  area=>area,
		  land_state=>land_state, 
		  dispensing=>dispensing
	);

watering_system1 : watering_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  land_state=>land_state,
		  watering=>watering,
		  water_request=>water_request
	);

cutting_system1 : cutting_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  land_state=>land_state,
		  cutting=>cutting,
		  speed_cutter=>speed_cutter,
		  area=>area,
		  crop_count=>crop_count,
		  cutting_request=>cutting_request
	);

end Behavioral;


