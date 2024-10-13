--vhd code

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

--testbench code

library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		A : in STD_LOGIC_VECTOR(1 downto 0);
		B : in STD_LOGIC_VECTOR(1 downto 0);
		sel : in STD_LOGIC_VECTOR(1 downto 0);
		ans : out STD_LOGIC_VECTOR(1 downto 0);
		carry : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(1 downto 0);
	signal B : STD_LOGIC_VECTOR(1 downto 0);
	signal sel : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ans : STD_LOGIC_VECTOR(1 downto 0);
	signal carry : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			A => A,
			B => B,
			sel => sel,
			ans => ans,
			carry => carry
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 50ns;
		a<="11";
		b<="10";
		sel<="00";
		wait for 50ns;
		a<="11";
		b<="10";
		sel<="01";
		wait for 50ns;
		a<="11";
		b<="10";
		sel<="10";
		wait for 50ns;
		a<="11";
		b<="10";
		sel<="11";
		
		wait for 50ns;
		a<="10";
		b<="01";
		sel<="00";
		wait for 50ns;
		a<="10";
		b<="01";
		sel<="01";
		wait for 50ns;
		a<="10";
		b<="01";
		sel<="10";
		wait for 50ns;
		a<="10";
		b<="01";
		sel<="11";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(ans_alu);
		end for;
	end for;
end TESTBENCH_FOR_alu;

