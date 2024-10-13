library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
library q5;
use q5.complex.all;
library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity soal5_tb is
end soal5_tb;

architecture TB_ARCHITECTURE of soal5_tb is
	-- Component declaration of the tested unit
	component soal5
	port(
		a : in arr2d;
		b : in arr2d;
		mmul : in STD_LOGIC;
		msum : in STD_LOGIC;
		msub : in STD_LOGIC;
		out1 : out arr2d );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : arr2d;
	signal b : arr2d;
	signal mmul : STD_LOGIC;
	signal msum : STD_LOGIC;
	signal msub : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal out1 : arr2d;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : soal5
		port map (
			a => a,
			b => b,
			mmul => mmul,
			msum => msum,
			msub => msub,
			out1 => out1
		);

	-- Add your stimulus here ...
	process 
		
	begin
		a<=(1,2);
		b<=(5,0);
		mmul<='0';
		msum<='0';	
		msub<='1';
		wait for 100ns;
		a<=(5,3);
		b<=(1,2);
		mmul<='0';
		msum<='1';
		msub<='0';
		wait for 100ns;
		a<=(2,1);
		b<=(1,3);
		mmul<='1';
		msum<='0';
		msub<='0';
		wait for 100ns;
		a<=(4,3);
		b<=(3,3);
		mmul<='0';
		msum<='0';
		msub<='1';	
		wait for 100ns;
		a<=(7,2);
		b<=(6,4);
		mmul<='0';
		msum<='1';
		msub<='0';
		wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_soal5 of soal5_tb is
	for TB_ARCHITECTURE
		for UUT : soal5
			use entity work.soal5(t5);
		end for;
	end for;
end TESTBENCH_FOR_soal5;

