--vhdl code
--default libraries
library IEEE; 
library work;
library std;
use work.arrint.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  	
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multdot is
	port (
	A,B : in int_std;
	outp : out integer
		);
end multdot;

architecture ans of multdot is
begin
	process(A,B)
		variable sum:integer := 0;
	begin  
		for i in 0 to 7 loop
			sum :=sum + (A(i) * B(i));
		end loop;
		--wait;
		outp <= sum;
	end process;
end ans;

--package code
package arrint is
	type int_std is array (7 downto 0) of integer;	
end arrint;

--testbench
library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
library q4;
use q4.arrint.all;
library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity multdot_tb is
end multdot_tb;

architecture TB_ARCHITECTURE of multdot_tb is
	-- Component declaration of the tested unit
	component multdot
	port(
		A : in int_std;
		B : in int_std;
		outp : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : int_std;
	signal B : int_std;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : multdot
		port map (
			A => A,
			B => B,
			outp => outp
		);

	-- Add your stimulus here ...	
	process 
		
	begin  
	A<=(0,2,3,1,5,0,1,2);
	B<=(1,1,2,0,3,4,7,2);
	wait for 50 ns;
	A<=(1,3,8,0,1,0,1,0);
	B<=(4,1,4,7,0,1,4,5);
	wait for 50 ns;
	A<=(5,1,3,2,1,0,1,5);
	B<=(7,2,4,1,0,3,2,1);
	wait for 50 ns;
	A<=(0,1,6,1,5,8,3,0);
	B<=(5,4,1,0,2,0,1,9);
	wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multdot of multdot_tb is
	for TB_ARCHITECTURE
		for UUT : multdot
			use entity work.multdot(ans);
		end for;
	end for;
end TESTBENCH_FOR_multdot;

