--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:28:28 04/06/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/top_agro_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_agro
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
 
ENTITY top_agro_test IS
END top_agro_test;
 
ARCHITECTURE behavior OF top_agro_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_agro
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         humidity : IN  eight_eight;
         lower_humidity_thresholds : eight_eight;
         upper_humidity_thresholds : eight_eight;
         len : IN  std_logic_vector(7 downto 0);
         breadth : IN  std_logic_vector(7 downto 0);
         duration : IN  eight_ten;
         speed_dispenser : IN  std_logic_vector(7 downto 0);
         speed_tiller : IN  std_logic_vector(7 downto 0);
         speed_cutter : IN  std_logic_vector(7 downto 0);
         crop_count : IN  eight_eight;
         dead_probability : IN  std_logic;
         tilling : INOUT  std_logic_vector(7 downto 0);
         dispensing : INOUT  std_logic_vector(7 downto 0);
         watering : INOUT  std_logic_vector(7 downto 0);
         cutting : INOUT  std_logic_vector(7 downto 0);
         health_report : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal humidity : eight_eight := (others => (others => '0'));
   signal lower_humidity_thresholds : eight_eight :=( others=>(others => '0'));
   signal upper_humidity_thresholds : eight_eight := (others=>(others => '0'));
   signal len : std_logic_vector(7 downto 0) := (others => '0');
   signal breadth : std_logic_vector(7 downto 0) := (others => '0');
   signal duration : eight_ten := (others=>(others => '0'));
   signal speed_dispenser : std_logic_vector(7 downto 0) := (others => '0');
   signal speed_tiller : std_logic_vector(7 downto 0) := (others => '0');
   signal speed_cutter : std_logic_vector(7 downto 0) := (others => '0');
   signal crop_count : eight_eight :=(others => (others => '0'));
   signal dead_probability : std_logic := '0';

	--BiDirs
   signal tilling : std_logic_vector(7 downto 0);
   signal dispensing : std_logic_vector(7 downto 0);
   signal watering : std_logic_vector(7 downto 0);
   signal cutting : std_logic_vector(7 downto 0);

 	--Outputs
   signal health_report : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_agro PORT MAP (
          clk => clk,
          rst => rst,
          humidity => humidity,
          lower_humidity_thresholds => lower_humidity_thresholds,
          upper_humidity_thresholds => upper_humidity_thresholds,
          len => len,
          breadth => breadth,
          duration => duration,
          speed_dispenser => speed_dispenser,
          speed_tiller => speed_tiller,
          speed_cutter => speed_cutter,
          crop_count => crop_count,
          dead_probability => dead_probability,
          tilling => tilling,
          dispensing => dispensing,
          watering => watering,
          cutting => cutting,
          health_report => health_report
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
      wait for 40 ns;	
		rst<='1';
      wait for clk_period*2;
		rst<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
