----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:13:52 04/03/2016 
-- Design Name: 
-- Module Name:    dispenser_queue - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.types.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dispenser_queue is
    Port ( 
			  mts : in STD_LOGIC_VECTOR(7 downto 0);
			  humidity_check : in  eight_three;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           speed_dispenser : in  STD_LOGIC_VECTOR(7 downto 0);			--in m/min
           dispensing : in  STD_LOGIC_VECTOR(7 downto 0);
           breadth : in  STD_LOGIC_VECTOR(7 downto 0);
			  area : in eight_sixteen;
           land_state : in  eight_three;
           dispense_gnt : inout  STD_LOGIC_VECTOR(7 downto 0));
end dispenser_queue;

architecture Behavioral of dispenser_queue is
COMPONENT fifo
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;
	signal empty : STD_LOGIC:='0';
	signal full : STD_LOGIC:='0';
	signal din : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal dout :STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal rd_en : STD_LOGIC:='0';
	signal wr_en : STD_LOGIC:='0';
	signal start : STD_LOGIC:='0';
	signal counter : STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
	signal present : STD_LOGIC_VECTOR(7 downto 0):="00000000"; -- request present
	signal pop : STD_LOGIC_VECTOR(7 downto 0):="00000000"; 	  -- popped request
	signal read_counter : STD_LOGIC_VECTOR(2 downto 0):="000";
	signal rd_en_prev : STD_LOGIC:='0';
	signal seconds_counter : STD_LOGIC_VECTOR(7 downto 0) :="00000000";
	signal land_state_prev : eight_three:=("000","000","000","000","000","000","000","000");
begin

fifo1 : fifo

PORT MAP(
    clk => clk,
    srst => rst,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty
);

process(clk)
	begin	
	if rising_edge(clk) then
		if rst='1' then 
			dispense_gnt<="00000000";
			wr_en<='0';
			rd_en<='0';
			counter<="0000000000000001";
			present<="00000000";
			pop<="00000000";
			start<='0';	
			din<="00000000";
			read_counter<="000";
			rd_en_prev<='1';
			seconds_counter<="00000000";
			land_state_prev<=("000","000","000","000","000","000","000","000");
		else
			if(rd_en='0' and rd_en_prev ='1') then
				dispense_gnt<=dout;
			end if;	
		
			if rd_en='1' then 
				rd_en<='0';
			end if;			
			
			pop<= dout;
			wr_en<='0';
			
			if ( land_state(0)="011" and land_state_prev(0) ="010" and not(present(0)='1')) then
				din<="00000001";
				present(0)<='1';
				wr_en<='1';
			elsif ( land_state(1)="011" and land_state_prev(1) ="010" and not(present(1)='1')) then
				din<="00000010";
				present(1)<='1';
				wr_en<='1';
			elsif ( land_state(2)="011" and land_state_prev(2) ="010" and not(present(2)='1')) then
				din<="00000100";
				present(2)<='1';
				wr_en<='1';
			elsif ( land_state(3)="011" and land_state_prev(3) ="010" and not(present(3)='1')) then
				din<="00001000";
				present(3)<='1';
				wr_en<='1';
			elsif( land_state(4)="011" and land_state_prev(4) ="010" and not(present(4)='1')) then
				din<="00010000";
				present(4)<='1';
				wr_en<='1';
			elsif ( land_state(5)="011" and land_state_prev(5) ="010" and not(present(5)='1')) then
				din<="00100000";
				present(5)<='1';
				wr_en<='1';
			elsif ( land_state(6)="011" and land_state_prev(6) ="010" and not(present(6)='1'))then
				din<="01000000";
				present(6)<='1';
				wr_en<='1';
			elsif ( land_state(7)="011" and land_state_prev(7) ="010" and not(present(7)='1')) then
				din<="10000000";
				present(7)<='1';
				wr_en<='1';
			end if;

			if start = '1' then
				if seconds_counter= mts then
					seconds_counter<="00000000";
					counter<=counter+speed_dispenser;		--increment by length(m) sown in 1 min incremented every mts seconds
				else
					seconds_counter<=seconds_counter+1;	
				end if;
			end if;
			
			--if read_counter="010" then
				for i in 0 to 7 loop
					if pop(i)='1' and dispense_gnt(i) ='0' then--and humidity_check(i)(0)='0' then
						present(i)<='0';
					end if;
				end loop;	
			--end if;
				
			for i in 0 to 7 loop
				if(dispensing(i)='1') then
					if humidity_check(i)(0)='1' then
						start<='0';				
					elsif(counter>=(area(i)+std_logic_vector(shift_right(unsigned(breadth),3)))) then				--untill the whole area is tilled
						dispense_gnt<="00000000";
						start<='0';
						counter<="0000000000000001";
					else 
						start<='1';
					end if;
				end if;
			end loop;

			if (dispensing  = "00000000") and (empty='0') and (read_counter="100") then
				rd_en<='1';
				start<='1';
				read_counter<="000";
			elsif not (read_counter="100") then
				read_counter<=read_counter+1;
			end if;
			rd_en_prev<=rd_en;
			land_state_prev <= land_state;
		end if;
	end if;

end process;


end Behavioral;

