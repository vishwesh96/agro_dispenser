--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:38 04/03/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/land_monitor_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: land_monitor
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
USE work.types.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY land_monitor_test IS
END land_monitor_test;
 
ARCHITECTURE behavior OF land_monitor_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT land_monitor
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         len : IN   std_logic_vector(7 downto 0);
         breadth : IN  std_logic_vector(7 downto 0);
         land_state : IN  eight_three;
         barren_count : INOUT  eight_eight;
         humidity_check : IN  eight_eight;
         duration : IN  eight_ten;
         area : OUT  eight_sixteen;
			cutting_request : inout STD_LOGIC_VECTOR(7 downto 0);
         water_request : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal len : STD_LOGIC_VECTOR(7 downto 0) :="00001010";
   signal breadth : std_logic_vector(7 downto 0) := "00000011";
   signal humidity_check : eight_eight:= (others => (others => '0'));
   signal duration : eight_ten := ("0000000001","0000000001","0000000001","0000000001","0000000001","0000000001","0000000001","0000000001");

	--BiDirs
   signal land_state : eight_three;
   signal barren_count : eight_eight;
	signal cutting_request : std_logic_vector(7 downto 0);
 	--Outputs
   signal area : eight_sixteen;
   signal water_request : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: land_monitor PORT MAP (
          rst => rst,
          clk => clk,
          len => len,
          breadth => breadth,
          land_state => land_state,
          barren_count => barren_count,
          humidity_check => humidity_check,
          duration => duration,
          area => area,
			 cutting_request=>cutting_request,
          water_request => water_request
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
		for i in 0 to 7 loop
			land_state(i)<="000";
		end loop;
		rst<='1';
      wait for clk_period*3;
		rst<='0';
		wait for clk_period*38;
		land_state(0)<="101";
		humidity_check(0)(0)<='1';
		wait for clk_period*6;
		humidity_check(0)(0)<='0';
 		wait for clk_period*38;
		land_state(0)<="111";
      -- insert stimulus here 

      wait;
		
   end process;

END;
