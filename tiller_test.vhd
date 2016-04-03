--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:50:24 03/24/2016
-- Design Name:   
-- Module Name:   /home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/tiller_test.vhd
-- Project Name:  Agro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tiller_queue
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
use  work.types.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tiller_test IS
END tiller_test;
 
ARCHITECTURE behavior OF tiller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tiller_queue
    PORT(
         speed_tiller : IN  std_logic_vector(7 downto 0);
         barren_count : IN  eight_eight;
         tilling : IN  std_logic_vector(7 downto 0);
         area : IN  eight_sixteen;
         rst : IN  std_logic;
         clk : IN  std_logic;
         till_gnt : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal speed_tiller : std_logic_vector(7 downto 0) := "00000100";
   signal barren_count : eight_eight :=("00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");
   signal tilling : std_logic_vector(7 downto 0) := "00000000";
   signal area : eight_sixteen := ("0000000000010000","0000000000010000","0000000000010000","0000000000010000","0000000000010000","0000000000010000","0000000000010000","0000000000010000");
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
	signal start : std_logic :='0';

 	--Outputs
   signal till_gnt : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tiller_queue PORT MAP (
          speed_tiller => speed_tiller,
          barren_count => barren_count,
          tilling => tilling,
          area => area,
          rst => rst,
          clk => clk,
          till_gnt => till_gnt
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
	--		if(start='1') then
		--		till_gnt<="00000000";
			--	start <='0';
				--wait for 100 ns;
			--end if;
			rst<='1';
			wait for 15 ns;
			rst<='0';
			wait for 1000 ns;
   end process;

	process(clk,till_gnt)
	variable counter : INTEGER RANGE 0 TO 15 :=0;
	begin
		if rising_edge(clk) then
				if counter /=15 then 
					counter := counter +1;
				else 
					counter :=0;
					for i in 0 to 7 loop
						barren_count(i) <= barren_count(i)+1; 
					end loop;				
				end if;
		else
			if not (falling_edge(clk)) then
				tilling<=till_gnt;			
			end if;
		end if;
	end process;
END;