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
use ieee.std_logic_unsigned.all;
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
			dead_humidity_thresholds : in eight_eight;
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
         health_report : OUT  std_logic;
			mts : in  std_logic_vector(7 downto 0);
			dts : in std_logic_vector(21 downto 0)  
			
        );
    END COMPONENT;


	COMPONENT pseudo_random_signal_generator
		PORT(
			clk : in std_logic;
			random_num : out std_logic 
		);
	END COMPONENT;    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal humidity : eight_eight := (others => ("11110001"));
   signal dead_humidity_thresholds : eight_eight :=( others=>("00000010"));	
   signal lower_humidity_thresholds : eight_eight :=( others=>("00100000"));
   signal upper_humidity_thresholds : eight_eight := (others=>("11111111"));
   signal len : std_logic_vector(7 downto 0) := ("00001000");
   signal breadth : std_logic_vector(7 downto 0) := ("00001000");
   signal duration : eight_ten :=(others => ("0000010000"));
   signal speed_dispenser : std_logic_vector(7 downto 0) := ("00000001");
   signal speed_tiller : std_logic_vector(7 downto 0) := ("00000010");
   signal speed_cutter : std_logic_vector(7 downto 0) := ("00000010");
   signal crop_count : eight_eight :=(others => ("00001000"));
   signal dead_probability : std_logic := '0';
	signal humidity_decrease_rate : std_logic_vector(7 downto 0) :="00000001";  --rate of decrease of humidity if not watered
	signal humidity_increase_rate : std_logic_vector(7 downto 0) :="00000001";  --rate of increase of humidity if not watered	
	signal mts : std_logic_vector(7 downto 0) :="00000111";
	signal dts : std_logic_vector(21 downto 0) :="0000000000000000011111";
	
	--BiDirs
   signal tilling : std_logic_vector(7 downto 0);
   signal dispensing : std_logic_vector(7 downto 0);
   signal watering : std_logic_vector(7 downto 0);
   signal cutting : std_logic_vector(7 downto 0);
	signal random_num :std_logic;
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
			 dead_humidity_thresholds => dead_humidity_thresholds,
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
          health_report => health_report,
			 mts=>mts,
			 dts=>dts
        );
pseudo_random_signal_generator1 : pseudo_random_signal_generator
	PORT MAP(
		  clk=>clk,
		  random_num=>random_num
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
      wait for 40 ns;	
		rst<='1';
      wait for clk_period*2;
		rst<='0';
      -- insert stimulus here 

      wait;
   end process;
	
	
process(clk)
	begin
			for i in 0 to 7 loop				
				if (watering(i)='1') then
					humidity(i)<=humidity(i)+humidity_increase_rate-humidity_decrease_rate;
				else
					humidity(i)<=humidity(i)-humidity_decrease_rate;					
				end if;
				if cutting(i)='1' then
					if humidity(i) < dead_humidity_thresholds(i) then
						dead_probability<='1';
					else
						dead_probability<=random_num;
					end if;
				else 
					dead_probability<='0';
				end if;
			end loop;
			
						
	end process;

END;
