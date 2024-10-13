--default libraries
library IEEE; 
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  	
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
	port (
	A,B : in std_logic_vector(1 downto 0);
	sel : in std_logic_vector(1 downto 0);
	ans: out std_logic_vector(1 downto 0);
	carry : out std_logic
		);
end alu;

architecture ans_alu of alu is	
	signal alu_res :std_logic_vector(1 downto 0);
	signal temp : std_logic_vector(2 downto 0);
	
begin
	process(A,B,sel) 
		
	begin  
		case sel is
			when "00" => --ADD
		
				alu_res <= A + B ;
		
			when "01" =>  --subtract
		
				alu_res <= A - B ;
		
			when "10" =>  --and
		
				alu_res <= A and B ;
		
			when "11" =>  --or
		
				alu_res <= A or B ;	
			
			when others => alu_res <= A or B ;
		end case;		
	end process;
	ans <= alu_res; --alu ans
	temp <= ('0' & A) +	('0' & B);
	carry <= temp(2); --carry flag
	
end ans_alu;
