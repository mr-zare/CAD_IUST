--default libraries
library IEEE; 
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  
use ieee.std_logic_unsigned.all;
use work.arr.all;
--use IEEE.std_logic_arith;


entity sum_ent is
	port (
	a : in arr2d;
	o : out std_logic_vector(3 downto 0)
		);
end sum_ent;




architecture ans1 of sum_ent is 
			  
begin
	o <= STD_LOGIC_VECTOR (
                        (a(0,0)) + (a(0,1)) + (a(0,2)) +
                        (a(1,0)) + (a(1,1)) + (a(1,2)) +
                        (a(2,0)) + (a(2,1)) + (a(2,2)));
	
end ans1;