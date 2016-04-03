----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:45 03/23/2016 
-- Design Name: 
-- Module Name:    tiller_queue - Behavioral 
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
use  work.types.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity tiller_queue is
    Port ( speed_tiller : in  STD_LOGIC_VECTOR(7 downto 0);
           barren_count : in  eight_eight;
           tilling : in  STD_LOGIC_VECTOR(7 downto 0);
           area : in  eight_sixteen;
           rst  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           till_gnt : out  STD_LOGIC_VECTOR(7 downto 0));
end tiller_queue;

architecture Behavioral of tiller_queue is
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
	signal  empty : STD_LOGIC:='0';
	signal  full : STD_LOGIC:='0';
	signal din : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal dout : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal rd_en : STD_LOGIC;
	signal wr_en : STD_LOGIC;
	signal start : STD_LOGIC:='0';
	signal counter : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	signal top : STD_LOGIC_VECTOR(7 downto 0):="00000000"; -- requests present
	signal pop : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	
 	
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

process(clk,barren_count,tilling)
	variable t : eight_eight;
	begin	
	if rising_edge(clk) then
	
		if rst='1' then 
			till_gnt<="00000000";
			wr_en<='0';
			rd_en<='0';
			counter<="00000000";
			top<="00000000";
			pop<="00000000";
			start<='0';	
			din<="00000000";
			full<='0';
		else
--			if(rd_en='1') then
--				till_gnt<=dout;
--			end if;
			rd_en<='0';
			pop<= dout;
			wr_en<='0';
			if (to_integer(unsigned(barren_count(0))) = 3 or to_integer(unsigned(barren_count(0)))=30) and not(top(0)='1') then
				din<="00000001";
				top(0)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(1))) = 3 or to_integer(unsigned(barren_count(1)))=30)  and not(top(1)='1') then
				din<="00000010";
				top(1)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(2))) = 3 or to_integer(unsigned(barren_count(2)))=30)  and not(top(2)='1') then
				din<="00000100";
				top(2)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(3))) = 3 or to_integer(unsigned(barren_count(3)))=30) and not(top(3)='1') then
				din<="00001000";
				top(3)<='1';
				wr_en<='1';
			elsif(to_integer(unsigned(barren_count(4))) = 3 or to_integer(unsigned(barren_count(4)))=30)  and not(top(4)='1') then
				din<="00010000";
				top(4)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(5))) = 3 or to_integer(unsigned(barren_count(5)))=30) and not(top(5)='1') then
				din<="00100000";
				top(5)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(6))) = 3 or to_integer(unsigned(barren_count(6)))=30)  and not(top(6)='1')then
				din<="01000000";
				top(6)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(7))) = 3 or to_integer(unsigned(barren_count(7)))=30)  and not(top(7)='1') then
				din<="10000000";
				top(7)<='1';
				wr_en<='1';
			end if;
			if(rd_en='1') then
				till_gnt<=dout;
			end if;

			if start = '1' then
				counter <=counter +'1';
			end if;
			
			for i in 0 to 7 loop
				t(i) := "00000100"+1;
				if pop(i)='1' then
					top(i)<='0';
				end if;
			end loop;	

			for i in 0 to 7 loop
				if(tilling(i)='1' and counter=t(i)) then
					till_gnt<="00000000";
					start<='0';
					counter<="00000000";
					--dout<="00000000";
				end if;
			end loop;
			
			if (tilling = "00000000") and (empty='0') then
				rd_en<='1';
				start<='1';
			end if;
			--if tilling ="00000000" and empty='1' then
			--	till_gnt<="00000000";
			--end if;
		end if;
	else
		if not (falling_edge(clk)) then
			if (to_integer(unsigned(barren_count(0))) = 3 or to_integer(unsigned(barren_count(0)))=30) and not(top(0)='1') then
				din<="00000001";
				top(0)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(1))) = 3 or to_integer(unsigned(barren_count(1)))=30)  and not(top(1)='1') then
				din<="00000010";
				top(1)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(2))) = 3 or to_integer(unsigned(barren_count(2)))=30)  and not(top(2)='1') then
				din<="00000100";
				top(2)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(3))) = 3 or to_integer(unsigned(barren_count(3)))=30) and not(top(3)='1') then
				din<="00001000";
				top(3)<='1';
				wr_en<='1';
			elsif(to_integer(unsigned(barren_count(4))) = 3 or to_integer(unsigned(barren_count(4)))=30)  and not(top(4)='1') then
				din<="00010000";
				top(4)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(5))) = 3 or to_integer(unsigned(barren_count(5)))=30) and not(top(5)='1') then
				din<="00100000";
				top(5)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(6))) = 3 or to_integer(unsigned(barren_count(6)))=30)  and not(top(6)='1')then
				din<="01000000";
				top(6)<='1';
				wr_en<='1';
			elsif (to_integer(unsigned(barren_count(7))) = 3 or to_integer(unsigned(barren_count(7)))=30)  and not(top(7)='1') then
				din<="10000000";
				top(7)<='1';
				wr_en<='1';
			end if;
				
			if (tilling = "00000000") and (empty='0') then
				rd_en<='1';
				start<='1';
			end if;
			
		end if;
	end if;

	end process;

end Behavioral;

