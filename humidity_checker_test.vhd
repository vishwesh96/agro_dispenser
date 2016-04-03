--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:14:14 04/04/2016
-- Design Name:   
-- Module Name:   /home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/humidity_checker_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: humidity_checker
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
 
ENTITY humidity_checker_test IS
END humidity_checker_test;
 
ARCHITECTURE behavior OF humidity_checker_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT humidity_checker
    PORT(
         rst : IN  std_logic;
         humidity : IN  eight_eight;
         lower_humidity_thresholds : IN  eight_eight;
         upper_humidity_thresholds : IN  eight_eight;
         humidity_check : OUT  eight_two;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal humidity : eight_eight := ("00000001","00000001","00000001","00000001","00000001","00000001","00000011","00000001");
   signal lower_humidity_thresholds : eight_eight := ("00000000","00000000","00000000","00000000","00000000","00000000","00000001","00001000");
   signal upper_humidity_thresholds : eight_eight := ("11111111","11111111","11111111","11111111","11111111","11111111","00000010","11111000");
   signal clk : std_logic := '0';

 	--Outputs
   signal humidity_check : eight_two;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: humidity_checker PORT MAP (
          rst => rst,
          humidity => humidity,
          lower_humidity_thresholds => lower_humidity_thresholds,
          upper_humidity_thresholds => upper_humidity_thresholds,
          humidity_check => humidity_check,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		
      wait for clk_period*1;
		humidity(7)<="11111111";
		humidity(6)<="00000000";
      -- insert stimulus here 
		wait for clk_period*10;
		humidity(7)<="11111111";
		wait for clk_period*10;
      wait;
   end process;

END;
