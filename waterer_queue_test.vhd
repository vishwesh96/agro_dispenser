--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:12:49 04/04/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/waterer_queue_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: waterer_queue
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.types.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY waterer_queue_test IS
END waterer_queue_test;
 
ARCHITECTURE behavior OF waterer_queue_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT waterer_queue
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         watering : IN  std_logic_vector(7 downto 0);
         water_request : IN  std_logic_vector(7 downto 0);
         water_gnt : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT waterer
	 PORT(
        clk : IN  std_logic;
        rst : IN  std_logic;
        watering : OUT  std_logic_vector(7 downto 0);
        water_gnt : IN  std_logic_vector(7 downto 0);
		  land_state : inout  eight_three	
	 );
    END COMPONENT;

   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal watering : std_logic_vector(7 downto 0) := (others => '0');
   signal water_request : std_logic_vector(7 downto 0) := (others => '0');
	signal land_state : eight_three:=(others =>(others => '0'));
   signal water_gnt : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: waterer_queue PORT MAP (
          clk => clk,
          rst => rst,
          watering => watering,
          water_request => water_request,
          water_gnt => water_gnt
        );
--	uus : waterer PORT MAP(
--		clk=>clk,
--		rst=> rst,
--		watering=> watering,
--		water_gnt=>water_gnt,
--		land_state=>land_state
--	);
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		rst<='1';
      wait for clk_period*2;
		rst<='0';
      wait for clk_period*2;
		water_request(0)<='1';
      wait for clk_period*2;
		water_request(1)<='1';
      wait for clk_period*2;
		water_request(0)<='0';
      wait for clk_period*2;
		water_request(1)<='0';
      wait for clk_period*10;
		water_request(1)<='1';		
      wait for clk_period*25;
		water_request(1)<='0';
		
      -- insert stimulus here 

      wait;
   end process;
	
	process(clk,water_gnt)
	begin
		if rising_edge(clk)then
			watering<=water_gnt;				
		end if;
	end process;

END;
