----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:39 04/05/2016 
-- Design Name: 
-- Module Name:    dispensing_system - Behavioral 
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

entity dispensing_system is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  mts : in STD_LOGIC_VECTOR(7 downto 0);
           humidity_check : in  eight_three;
           speed_dispenser : in  STD_LOGIC_VECtor(7 downto 0);
           breadth : in  STD_LOGIC_VECtor(7 downto 0);
           area : in  eight_sixteen;
			  land_state : in eight_three;
           dispensing : inout  STD_LOGIC_VECtor(7 downto 0));
end dispensing_system;

architecture Behavioral of dispensing_system is

COMPONENT dispenser
	PORT(
         rst : in  STD_LOGIC;
         dispense_gnt : in  STD_LOGIC_VECtor(7 downto 0);
         clk : in  STD_LOGIC;
         dispensing : out  STD_LOGIC_VECtor(7 downto 0)	
	);
END COMPONENT;

COMPONENT dispenser_queue
	PORT( mts : in STD_LOGIC_VECTOR(7 downto 0);
		  humidity_check : in  eight_three;
		  rst : in  STD_LOGIC;
		  clk : in  STD_LOGIC;
		  land_state : in eight_three;
		  speed_dispenser : in  STD_LOGIC_VECTOR(7 downto 0);			--in m/min
		  dispensing : in  STD_LOGIC_VECTOR(7 downto 0);
		  breadth : in  STD_LOGIC_VECTOR(7 downto 0);
		  area : in eight_sixteen;
		  dispense_gnt : inout  STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

--signals
signal dispense_gnt : std_logic_vector(7 downto 0);

begin

dispenser1 :dispenser

	PORT MAP(
	clk=>clk,
	rst=>rst,
	dispense_gnt=>dispense_gnt,
	dispensing=>dispensing
	);

dispenser_queue1 :dispenser_queue

	PORT MAP(
		  humidity_check=>humidity_check,
		  rst=>rst,
		  clk=>clk,
		  land_state=>land_state,
		  mts=>mts,
		  speed_dispenser=>speed_dispenser,		--in m/min
		  dispensing=>dispensing, 
		  breadth=>breadth,
		  area=>area,
		  dispense_gnt=>dispense_gnt
	);

end Behavioral;

