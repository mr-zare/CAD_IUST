library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;
use work.pkg.all;

entity Convolution is
port(
	input : in input_type_c;
	filter: in filter_type_c;
	con_output : out integer
);
end Convolution;

architecture Behavioral of Convolution is
	variable sum : integer :=0;
begin
	for i in 0 to 8 generate
		sum = sum + input(i)*filter(i);
	end generate;
	con_output <= sum;
end Behavioral;

