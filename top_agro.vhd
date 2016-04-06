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
			  mts : in std_logic_vector(7 downto 0);
			  dts : in std_logic_vector(21 downto 0);
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
		  humidity_check : out eight_three;
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
		  dts : in std_logic_vector(21 downto 0);
		  barren_count : inout  eight_eight;
		  humidity_check : in  eight_three;
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
		  land_state: in eight_three;
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
		  land_state : in eight_three;
		  mts : in std_logic_vector(7 downto 0);
		  humidity_check : in  eight_three;
		  speed_dispenser : in  STD_LOGIC_VECtor(7 downto 0);
		  breadth : in  STD_LOGIC_VECtor(7 downto 0);
		  area : in  eight_sixteen;
		  dispensing : inout  STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT watering_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  dts: std_logic_vector(21 downto 0);
		  watering : inout  STD_LOGIC_VECtor(7 downto 0);
		  water_request : in STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT cutting_system
	PORT(
		clk : in  STD_LOGIC;
		  rst : in  STD_LOGIC;
		  cutting : inout  STD_LOGIC_VECtor(7 downto 0);
		  speed_cutter : in STD_LOGIC_VECtor(7 downto 0);
		  area : in  eight_sixteen;
		  crop_count : in  eight_eight;
		  cutting_request : in STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;


COMPONENT land_state_changer
	PORT(
		  clk : in std_logic;
		  rst : in std_logic;
		  tilling : in  STD_LOGIC_vector(7 downto 0);
		  cutting : in  STD_LOGIC_vector(7 downto 0);
		  dispensing : in  STD_LOGIC_vector(7 downto 0);
		  watering : in  STD_LOGIC_vector(7 downto 0);
		  land_state : inout  eight_three
	);
END COMPONENT;

--signals
	signal humidity_check : eight_three;
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
		  dts=>dts,
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
		  tilling=>tilling,
		  land_state=>land_state,
		  barren_count=>barren_count,
		  speed_tiller=>speed_tiller,
		  area=>area 
	);
	
dispensing_system1 : dispensing_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  mts=>mts,
		  land_state=>land_state,
		  humidity_check=>humidity_check,
		  speed_dispenser=>speed_dispenser, 
		  breadth=>breadth,
		  area=>area,
		  dispensing=>dispensing
	);

watering_system1 : watering_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  dts=>dts,
		  watering=>watering,
		  water_request=>water_request
	);

cutting_system1 : cutting_system
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  cutting=>cutting,
		  speed_cutter=>speed_cutter,
		  area=>area,
		  crop_count=>crop_count,
		  cutting_request=>cutting_request
	);

land_state_changer1 : land_state_changer 
	PORT MAP(
		  clk=>clk,
		  rst=>rst,
		  tilling=>tilling,
		  cutting=>cutting,
		  dispensing=>dispensing, 
		  watering=>watering,
		  land_state=>land_state
	);
end Behavioral;


