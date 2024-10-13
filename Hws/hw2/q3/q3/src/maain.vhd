library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Decussate is port(
	Input: in std_logic_vector(15 downto 0);
	Output: out std_logic_vector(1 downto 0)
	);
end Decussate;

architecture Behavioral of Decussate is
	shared variable sum1: integer;
	shared variable sum2: integer := 0;
begin
	process(Input)
	begin 
		
		if Input(0) = '1' then
			sum1 := 1;
		end if;
			
		for i in 1 to 15 loop
			if i mod 2 = 0 then
				if Input(i) = '1' then
					sum1 := sum1 + 1;
				end if;
			else
				if Input(i) = '1' then
					sum2 := sum2 + 1;
				end if;				
			end if;
		end loop;
		
		if sum1 /= 0 then 
			sum1:= sum1 mod 3; 
		end if;
		
		if sum2 /= 0 then 
			sum2:= sum1 mod 5; 
		end if;	
		
		if sum1 = 0 then
			null; 
		else
			sum1 := 1;
		end if;

		if sum2 = 0 then 
			null; 
		else 
			sum2 := 1;
		end if;
		
	end process;
	
	Output <= std_logic_vector(to_unsigned(sum1,1)) & std_logic_vector(to_unsigned(sum2,1));
	
end Behavioral;

