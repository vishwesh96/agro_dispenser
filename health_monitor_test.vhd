--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:35:01 04/04/2016
-- Design Name:   
-- Module Name:   /home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/health_monitor_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: health_monitor
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY health_monitor_test IS
END health_monitor_test;
 
ARCHITECTURE behavior OF health_monitor_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT health_monitor
    PORT(
         clk : IN  std_logic;
         dead_probability : IN  std_logic;
         land_state : IN  eight_three;
         health_report : OUT  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dead_probability : std_logic := '0';
   signal land_state : eight_three := ("000","000","000","000","000","000","000","111");
   signal rst : std_logic := '0';

 	--Outputs
   signal health_report : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: health_monitor PORT MAP (
          clk => clk,
          dead_probability => dead_probability,
          land_state => land_state,
          health_report => health_report,
          rst => rst
        );

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
      wait for clk_period*10;
			rst<='1';
		wait for clk_period*5;
			rst<='0';
      wait for clk_period*10;
			land_state(4)<="111";
      wait for clk_period*10;
			dead_probability <= '1';
		wait for clk_period*10;
      -- insert stimulus here 
		wait;
   end process;

END;
