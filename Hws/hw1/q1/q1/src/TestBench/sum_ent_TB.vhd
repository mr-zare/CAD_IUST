library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
library q1;
use q1.arr.all;	  
use IEEE.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sum_ent_tb is
end sum_ent_tb;

architecture TB_ARCHITECTURE of sum_ent_tb is
	-- Component declaration of the tested unit
	component sum_ent
	port(
		a : in arr2d;
		o : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : arr2d;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sum_ent
		port map (
			a => a,
			o => o
		);

	-- Add your stimulus here ...  
	process 	
	begin  
		a<=(("0001","0010","0000"),("0001","0100","0101"),("0011","1000","0000"));
		wait for 50ns;
		a<=(("0011","0011","0001"),("0000","0001","0001"),("0010","1000","0010"));
		wait for 50ns;
		a<=(("0111","0011","0001"),("0010","0001","0100"),("0001","0000","1000"));
		wait for 50ns;
		a<=(("1001","1010","0000"),("0101","0000","0010"),("0010","0001","0001"));
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sum_ent of sum_ent_tb is
	for TB_ARCHITECTURE
		for UUT : sum_ent
			use entity work.sum_ent(ans1);
		end for;
	end for;
end TESTBENCH_FOR_sum_ent;

