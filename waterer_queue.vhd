----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:12:27 04/03/2016 
-- Design Name: 
-- Module Name:    waterer_queue - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity waterer_queue is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  dts : std_logic_vector(21 downto 0);
			  humidity_check : eight_two;
			  watering : in  STD_LOGIC_VECTOR(7 downto 0);
           water_request : in  STD_LOGIC_VECTOR(7 downto 0);
           water_gnt : inout  STD_LOGIC_VECTOR(7 downto 0));
end waterer_queue;

architecture Behavioral of waterer_queue is
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
	signal counter : STD_LOGIC_VECTOR(21 downto 0):="0000000000000000000000";
	signal present : STD_LOGIC_VECTOR(7 downto 0):="00000000"; -- request present
	signal pop : STD_LOGIC_VECTOR(7 downto 0):="00000000"; 	  -- popped request
	signal read_counter : STD_LOGIC_VECTOR(2 downto 0):="000";
--	signal grant_counter : STD_LOGIC_VECTOR(2 downto 0):="000";
	signal rd_en_prev : STD_LOGIC:='0';
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
				water_gnt<="00000000";
				wr_en<='0';
				rd_en<='0';
				counter<="0000000000000000000000";
				present<="00000000";
				pop<="00000000";
				start<='0';	
				din<="00000000";
				read_counter<="000";
--				grant_counter<="000";
				rd_en_prev<='1';
			else
				if(rd_en='0' and rd_en_prev ='1') then-- and grant_counter="010") then
					water_gnt<=dout;
				end if;
				
				if rd_en='1' then 
					rd_en<='0';
				end if;

				pop<= dout;
				wr_en<='0';
				
				if (water_request(0)='1' and not(present(0)='1') ) then
					din<="00000001";
					present(0)<='1';
					wr_en<='1';
				elsif(water_request(1)='1' and not(present(1)='1')) then
					din<="00000010";
					present(1)<='1';
					wr_en<='1';
				elsif (water_request(2)='1' and not(present(2)='1')) then
					din<="00000100";
					present(2)<='1';
					wr_en<='1';
				elsif (water_request(3)='1' and not(present(3)='1')) then
					din<="00001000";
					present(3)<='1';
					wr_en<='1';
				elsif (water_request(4)='1' and not(present(4)='1')) then
					din<="00010000";
					present(4)<='1';
					wr_en<='1';
				elsif (water_request(5)='1' and not(present(5)='1')) then
					din<="00100000";
					present(5)<='1';
					wr_en<='1';
				elsif (water_request(6)='1' and not(present(6)='1')) then
					din<="01000000";
					present(6)<='1';
					wr_en<='1';
				elsif (water_request(7)='1' and not(present(7)='1')) then
					din<="10000000";
					present(7)<='1';
					wr_en<='1';
				end if;
				
				if start = '1' then							--incremented every second
					counter <=counter +'1';
				end if;
				--if read_counter="010" then
					for i in 0 to 7 loop
						if pop(i)='1' and water_gnt(i)='0' then
							present(i)<='0';
						end if;
					end loop;	
				--end if;

				for i in 0 to 7 loop
					if(watering(i)='1' and (counter=dts or (humidity_check(i)(1)='1'))) then			--for one day or untill upper threshold is reached
						water_gnt<="00000000";
						start<='0';
						counter<="0000000000000000000000";
						--dout<="00000000";
					end if;
				end loop;
	
				if (watering  = "00000000") and (empty='0') and (read_counter="100") then
					rd_en<='1';
					start<='1';
					read_counter<="000";
				elsif not (read_counter="100") then
					read_counter<=read_counter+1;
				end if;
			rd_en_prev<=rd_en;
			end if;				
		end if;
	end process;

end Behavioral;

