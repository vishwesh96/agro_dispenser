--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:22 04/04/2016
-- Design Name:   
-- Module Name:   /home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/tiller_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tiller
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
 
ENTITY tiller_test IS
END tiller_test;
 
ARCHITECTURE behavior OF tiller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tiller
    PORT(
         land_state : INOUT  eight_three;
         rst : IN  std_logic;
         till_gnt : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         tilling : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal till_gnt : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal land_state : eight_three:= ("000","010","000","000","000","000","000","000");

 	--Outputs
   signal tilling : std_logic_vector(7 downto 0):="00000000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tiller PORT MAP (
          land_state => land_state,
          rst => rst,
          till_gnt => till_gnt,
          clk => clk,
          tilling => tilling
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

      wait for clk_period*10;
			till_gnt <= "00000001";

		wait for clk_period*10;
			rst <='1';
		wait for clk_period*10;
			rst <='0';
		wait for clk_period*10;
			till_gnt <= "00000000";
      wait for clk_period*10;
			till_gnt <= "00000010";
      wait for clk_period*10;
			till_gnt <= "00000000";									

      -- insert stimulus here 

      wait;
   end process;

END;
