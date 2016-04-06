----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:05 04/05/2016 
-- Design Name: 
-- Module Name:    cutting_system - Behavioral 
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


entity cutting_system is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cutting : inout  STD_LOGIC_VECtor(7 downto 0);
			  speed_cutter : in STD_LOGIC_VECtor(7 downto 0);
           area : in  eight_sixteen;
           crop_count : in  eight_eight;
			  cutting_request : in STD_LOGIC_VECtor(7 downto 0));
end cutting_system;

architecture Behavioral of cutting_system is

COMPONENT cutter
	PORT(
           rst : in  STD_LOGIC;
           cut_gnt : in  STD_LOGIC_VECtor(7 downto 0);
           clk : in  STD_LOGIC;
           cutting : out  STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT cutter_queue
	PORT(
			 clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
           area : in  eight_sixteen;
           crop_count : in  eight_eight;
			  cutting : in  STD_LOGIC_VECTOR(7 downto 0);			  
			  speed_cutter : in  STD_LOGIC_VECTOR(7 downto 0);
           cutting_request : in  STD_LOGIC_VECTOR(7 downto 0);
           cut_gnt : inout  STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

--signals
signal cut_gnt : STD_LOGIC_VECTOR(7 downto 0);

begin
cutter1 :cutter

	PORT MAP(
	  rst=>rst,
	  cut_gnt=>cut_gnt,
	  clk=>clk,
	  cutting=>cutting 
	);

cutter_queue1 :cutter_queue

	PORT MAP(
			  clk=>clk, 
			  rst=>rst,
           area=>area,
           crop_count=>crop_count,
			  cutting=>cutting,
			  speed_cutter=>speed_cutter,
           cutting_request=>cutting_request,
           cut_gnt=>cut_gnt
	);


end Behavioral;
