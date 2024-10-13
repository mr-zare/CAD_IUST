library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;
use work.pkg.all;

entity CNNAccelerator is
port(
	input : in input_type;
	filters : in n_filters;
	output : out output_type
);
generic(
	number_of_filters: integer := 5;
	stride : integer := 1;
	window_size : integer := (128 - 3)/stride +1
	);
type output_filtered is array (0 to window_size, 0 to window_size) of integer;
type output_type is array (0 to number_of_filters) of output_filtered;
end CNNAccelerator;

architecture Structure of CNNAccelerator is
	component Convolution
		port(
			input : in input_type_c;
			filter: in filter_type_c;
			con_output : out real
		);
	end component;	
begin
	for i in 0 to number_of_filters generate
		for j in 0 to window_size generate
			for t in 0 to window_size generate
				instance: Convolution port map(
					 (
						input(j,t),input(j,t+1),input(j,t+2),
						input(j+1,t),input(j+1,t+1),input(j+1,t+2),
						input(j+2,t),input(j+2,t+1),input(j+2,t+2)
					)
					,(
						filter(i,0,0),filter(i,0,1),filter(i,0,2),
						filter(i,1,0),filter(i,1,1),filter(i,1,2),
						filter(i,2,0),filter(i,2,1),filter(i,2,2)
					)
					,output(i,j,t));
			end generate;
		end generate;
	end generate;	
end Structure;

