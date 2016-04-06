<<<<<<< HEAD
-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT <component name>
          PORT(
                  <port1> : IN std_logic;
                  <port2> : IN std_logic_vector(3 downto 0);       
                  <port3> : OUT std_logic_vector(3 downto 0)
                  );
          END COMPONENT;

          SIGNAL <signal1> :  std_logic;
          SIGNAL <signal2> :  std_logic_vector(3 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: <component name> PORT MAP(
                  <port1> => <signal1>,
                  <port3> => <signal2>
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
=======
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:04:49 04/05/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/dispenser_queue_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dispenser_queue
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dispenser_queue_test IS
END dispenser_queue_test;
 
ARCHITECTURE behavior OF dispenser_queue_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dispenser_queue
    PORT(
         humidity_check : IN  std_logic_vector(0 to 7);
         rst : IN  std_logic;
         clk : IN  std_logic;
         speed_dispenser : IN  std_logic_vector(7 downto 0);
         dispensing : IN  std_logic_vector(7 downto 0);
         breadth : IN  std_logic_vector(7 downto 0);
         area : IN  std_logic_vector(0 to 7);
         land_state : IN  std_logic_vector(0 to 7);
         dispense_gnt : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal humidity_check : std_logic_vector(0 to 7) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal speed_dispenser : std_logic_vector(7 downto 0) := (others => '0');
   signal dispensing : std_logic_vector(7 downto 0) := (others => '0');
   signal breadth : std_logic_vector(7 downto 0) := (others => '0');
   signal area : std_logic_vector(0 to 7) := (others => '0');
   signal land_state : std_logic_vector(0 to 7) := (others => '0');

 	--Outputs
   signal dispense_gnt : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dispenser_queue PORT MAP (
          humidity_check => humidity_check,
          rst => rst,
          clk => clk,
          speed_dispenser => speed_dispenser,
          dispensing => dispensing,
          breadth => breadth,
          area => area,
          land_state => land_state,
          dispense_gnt => dispense_gnt
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

      -- insert stimulus here 

      wait;
   end process;

END;
>>>>>>> 427aad0fe69dc08d5f7c7ebe1044b0f9e61547c3
