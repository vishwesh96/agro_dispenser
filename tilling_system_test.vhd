--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:19:52 04/05/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/tilling_system_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tilling_system
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
 
ENTITY tilling_system_test IS
END tilling_system_test;
 
ARCHITECTURE behavior OF tilling_system_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tilling_system
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         land_state : INOUT  eight_three;
         tilling : inOUT  std_logic_vector(7 downto 0);
         barren_count : IN  eight_eight;
         speed_tiller : IN  std_logic_vector(7 downto 0);
         area : IN  eight_sixteen
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal barren_count : eight_eight := (others => (others=>'0'));
   signal speed_tiller : std_logic_vector(7 downto 0) := (others => '0');
   signal area : eight_sixteen := (others =>(others => '0'));

	--BiDirs
   signal land_state : eight_three := (others => (others=>'0'));

 	--Outputs
   signal tilling : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tilling_system PORT MAP (
          clk => clk,
          rst => rst,
          land_state => land_state,
          tilling => tilling,
          barren_count => barren_count,
          speed_tiller => speed_tiller,
          area => area
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
      wait for 100 ns;	
		rst<='1';
      wait for clk_period*4;
		rst<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
