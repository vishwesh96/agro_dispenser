--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:22 04/04/2016
-- Design Name:   
-- Module Name:   /home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/dispenser_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dispenser
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
 
ENTITY dispenser_test IS
END dispenser_test;
 
ARCHITECTURE behavior OF dispenser_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dispenser
    PORT(
         land_state : INOUT  eight_three;
         rst : IN  std_logic;
         dispense_gnt : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         dispensing : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal dispense_gnt : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal land_state : eight_three:= ("011","011","000","000","000","000","000","000");

 	--Outputs
   signal dispensing : std_logic_vector(7 downto 0):="00000000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dispenser PORT MAP (
          land_state => land_state,
          rst => rst,
          dispense_gnt => dispense_gnt,
          clk => clk,
          dispensing => dispensing
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

      wait for clk_period*10;
			dispense_gnt <= "00000001";

		wait for clk_period*10;
			rst <='1';
		wait for clk_period*10;
			rst <='0';
		wait for clk_period*10;
			dispense_gnt <= "00000000";
      wait for clk_period*10;
			dispense_gnt <= "00000010";
      wait for clk_period*10;
			dispense_gnt <= "00000000";									

      -- insert stimulus here 

      wait;
   end process;

END;
