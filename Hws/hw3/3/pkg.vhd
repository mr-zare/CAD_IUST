library IEEE;
use IEEE.STD_LOGIC_1164.all;

package pkg is
	Type input_type_c is Array (0 to 8) of integer;
	Type filter_type_c is Array (0 to 8) of integer;
	Type input_type is Array (0 to 127, 0 to 127) of integer;
	Type filter_type is Array (0 to 2, 0 to 2) of filter_type_c;
	Type n_filters is Array (0 to 4 ) of filter_type;
end pkg;

package body pkg is
end pkg;
