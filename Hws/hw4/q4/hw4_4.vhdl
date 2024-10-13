library ieee;
use ieee.std_logic_1164.all;

package util_p is
	function d_one(input_vector : std_logic_vector(7 downto 0)) return std_logic_vector;
	function ad_one_front(input_vector : std_logic_vector(7 downto 0)) return std_logic_vector;
end package;

package body util_p is
	 function d_one(input_vector : std_logic_vector(7 downto 0)) return std_logic_vector is
	    variable ones_count : integer := 0;
	    variable out_vec : std_logic_vector(7 downto 0) := (others => '0');
	begin
	    -- Count the number of ones 
	    for i in 0 to 7 loop
	        if input_vector(i) = '1' then
	            ones_count := ones_count + 1;
	        end if;
	    end loop;
		
		if ones_count = 0 then
			return out_vec;
		end if;
	
	    -- Double the number of ones 
	    for i in 0 to (ones_count * 2)-1 loop
	    	out_vec(i + ones_count) := '1';
	    end loop;
	
	    return out_vec;
	end function;
	
	function ad_one_front(input_vector : std_logic_vector(7 downto 0)) return std_logic_vector is
	    variable out_vec : std_logic_vector(7 downto 0) := (0 => '1', others => '0');
	begin
	    for i in 0 to 6 loop
	        out_vec(i+1) := input_vector(i);
	    end loop;
	    return out_vec;
	end function; 
	
end package body;
	
library ieee;
use ieee.std_logic_1164.all;
use work.util_p.all;


entity btou is
    port (
        bin : in  std_logic_vector(2 downto 0);
        u  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of btou is
begin
    process(bin)
	variable outp : std_logic_vector(7 downto 0) := (others => '0');
    begin
		for i in 0 to 2 loop
			if bin(i) = '1' then
				outp := ad_one_front(outp);
			end if;
			if i /= 2 then
				outp := d_one(outp);
			end if;
		end loop;
		u <= outp;
    end process;
end architecture behavioral;