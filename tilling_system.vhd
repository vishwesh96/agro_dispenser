----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:26:18 04/05/2016 
-- Design Name: 
-- Module Name:    tilling_system - Behavioral 
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
entity tilling_system is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           tilling : inout  STD_LOGIC_VECtor(7 downto 0);
			  barren_count : in eight_eight;
			  speed_tiller : in STD_LOGIC_VECtor(7 downto 0);
			  area : in eight_sixteen);
end tilling_system;

architecture Behavioral of tilling_system is
COMPONENT tiller
	PORT(
		  rst : in  STD_LOGIC;
		  till_gnt : in  STD_LOGIC_VECtor(7 downto 0);
		  clk : in  STD_LOGIC;
		  tilling : out  STD_LOGIC_VECtor(7 downto 0)
	);
END COMPONENT;

COMPONENT tiller_queue
	PORT(
			  speed_tiller : in  STD_LOGIC_VECTOR(7 downto 0);  --m2 per sec
           barren_count : in  eight_eight;
           tilling : in  STD_LOGIC_VECTOR(7 downto 0);
           area : in  eight_sixteen;
           rst  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           till_gnt : out  STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

--signals
signal till_gnt : STD_LOGIC_VECTOR(7 downto 0);

begin
tiller1 :tiller

	PORT MAP(
	  rst=>rst,
	  till_gnt=>till_gnt,
	  clk=>clk,
	  tilling=>tilling
	);

tiller_queue1 :tiller_queue

	PORT MAP(
			  clk=>clk, 
			  rst=>rst,
			  speed_tiller=>speed_tiller, --m2 per sec
           barren_count=>barren_count,
           tilling=>tilling,
           area=>area,
           till_gnt=>till_gnt
	);


end Behavioral;


