
library ieee;
use ieee.std_logic_1164.all;




entity code_converter is
	port(
	
	enable: in std_logic;
	x,clk: in std_logic ;
	z: out std_logic ) ;
	
end  code_converter;

architecture behavioral of code_converter is

type state_type is (s0, s1,s2, s3, s4, s5, s6);
signal state, nextstate : state_type ;

begin 
	
	process(state, x)
	begin
		case state is 
			when s0 =>
			   if x= '0' then z <= '1';  nextstate <= s1 ;
			   else z<= '0'; nextstate <= s2;end if;  
			when s1 =>
			    if x= '0' then z <= '1'; nextstate <= s3 ;
		     	else z <= '0'; nextstate <= s4; end if;	  
		    when s2 =>
			if x= '0' then  z <= '0' ; nextstate <= s4;
			else z <= '1'; nextstate <= s4 ; end if ;
				when s3 =>
				if x = '0' then z <='0'; nextstate  <= s5;
				else z <='1' ; nextstate <= s5 ; end if;
				when s4 =>
				if x='0' then z <=	'1' ; nextstate <= s5;
				else z <= '0'; nextstate <= s6 ; end if;
					
				when s5 =>
				if x='0' then z <= '0'; nextstate <= s0 ;
				else z <='1' ; nextstate <= s0; end if;
					
				when s6 =>
				if x='0' then z<='1'; nextstate <= s0;			
				else  z <= '0'; nextstate <= s0;end if ; 
					when others => null;
				end case;
				end process;  
				
				
				
				process (enable, clk)
				begin
					if enable = '0' then
						state <= s0;
					elsif rising_edge (clk) then
						state <= nextstate;
					end if;
					end process;
					
					end behavioral;
		   		
				
				
				
				
				
				