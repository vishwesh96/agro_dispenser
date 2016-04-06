--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package types is

type eight_eight is array (0 to 7) of STD_LOGIC_VECTOR (7 downto 0);
type eight_ten is array (0 to 7) of STD_LOGIC_VECTOR (9 downto 0);
type eight_three is array (0 to 7) of STD_LOGIC_VECTOR (2 downto 0);
type eight_two is array (0 to 7) of STD_LOGIC_VECTOR (1 downto 0);
type eight_sixteen is array (0 to 7) of STD_LOGIC_VECTOR (15 downto 0);
type eight_32 is array (0 to 7) of STD_LOGIC_VECTOR (31 downto 0);

end;

package body types is 
end package body;

