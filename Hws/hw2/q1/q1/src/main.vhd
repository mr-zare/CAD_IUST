library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

package Sorting is
	type std_logic_array is array (9 downto 0) of std_logic_vector(7 downto 0);	
end Sorting;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.Sorting.ALL;

entity Sort is port(
	input: in std_logic_array;
	output: out std_logic_array
	);
end Sort;

architecture mySort of Sort is
	shared variable result: std_logic_array := Input;
	shared variable Max: std_logic_vector(7 downto 0);
begin		
	process( Input)
	begin
		for i in 0 to 9 loop
			Max := result(i);
			for j in i + 1 to 9 loop
				if Max < result(j) then
					Max := result(j);
					result(j) := result(i);
					result(i) := Max;
				end if;
			end loop;
		end loop;
	end process;
	Output <= result;
end mySort;

