--default libraries
library IEEE; 
library work;
library std;
use work.arrint.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  	
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multdot is
	port (
	A,B : in int_std;
	outp : out integer
		);
end multdot;

architecture ans of multdot is
begin
	process(A,B)
		variable sum:integer := 0;
	begin  
		for i in 0 to 7 loop
			sum :=sum + (A(i) * B(i));
		end loop;
		--wait;
		outp <= sum;
	end process;
end ans;
