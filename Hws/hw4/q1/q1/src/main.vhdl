library ieee;
use ieee.std_logic_1164.all;

entity statemachine is
    port (			  
		input : in  bit;
        clk   : in  std_logic;
        f_z_s : out integer;
        f_z_e   : out integer;
        l_z_s  : out integer;
        l_z_e    : out integer
    );
end entity;

architecture MY_ARCH of statemachine is
    type typeofstate is (s0, s1, s2, s3, s4);
    signal state : typeofstate := s0;
    signal index : integer := 0; 
begin
    process(clk)
		variable f_z_s_index : integer := 0;
	    variable f_z_e_index   : integer := 0;
	    variable l_z_s_index  : integer := 0;
	    variable l_z_e_index    : integer := 0;
    begin	  
		
		if clk'event and clk = '1' then
			index <= index + 1;
            case state is
				
                when s0 =>
                    if input = '1' then
                        state <= s1;
                    else
                        state <= s0;
                    end if;
					
                when s1 =>
                    if input = '1' then
                        state <= s1;
                    else
                        state <= s2;
						f_z_s_index := index;
                    end if;
					
                when s2 =>
                    if input = '0' then
                        state <= s2;
                    else
                        state <= s3;
						f_z_e_index := index-1;
                    end if;
					
                when s3 =>
                    if input = '1' then
                        state <= s3;
                    else
                        state <= s4;
						l_z_s_index := index;
                    end if;
					
                when s4 =>
                    if input = '0' then
                        state <= s4;
                    else
                        state <= s3;
						l_z_e_index := index -1;
                    end if;	
            end case;
			
			f_z_s <= f_z_s_index;
	        f_z_e   <= f_z_e_index;
	        l_z_s  <= l_z_s_index;
	        l_z_e    <= l_z_e_index;
			
        end if;
    end process;
end architecture my_arch;