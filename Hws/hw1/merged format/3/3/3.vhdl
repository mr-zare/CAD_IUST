--code vhdl
--default libraries
library IEEE; 
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  	
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity un_to_bi is
	port (
	inp : in std_logic_vector(15 downto 0);
	outp : out std_logic_vector(3 downto 0)
		);
end un_to_bi;					

architecture ans of un_to_bi is
begin
	outp <= "0000" when (inp="0000000000000000") else
	"0001" when (inp="0000000000000001") else
	"0010" when (inp="0000000000000011") else
	"0011" when (inp="0000000000000111") else
	"0100" when (inp="0000000000001111") else
	"0101" when (inp="0000000000011111") else
	"0110" when (inp="0000000000111111") else
	"0111" when (inp="0000000001111111") else
	"1000" when (inp="0000000011111111") else
	"1001" when (inp="0000000111111111") else
	"1010" when (inp="0000001111111111") else
	"1011" when (inp="0000011111111111") else
	"1100" when (inp="0000111111111111") else
	"1101" when (inp="0001111111111111") else
	"1110" when (inp="0011111111111111") else
	"1111";
		
end ans;
--testbench
library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity un_to_bi_tb is
end un_to_bi_tb;

architecture TB_ARCHITECTURE of un_to_bi_tb is
	-- Component declaration of the tested unit
	component un_to_bi
	port(
		inp : in STD_LOGIC_VECTOR(15 downto 0);
		outp : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inp : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : un_to_bi
		port map (
			inp => inp,
			outp => outp
		);
	process
	begin
		wait for 50ns;
		inp<="0000000000000000";
		wait for 50ns;
		inp<="0000000000000001";
		wait for 50ns;
		inp<="0000000000000011";
		wait for 50ns;
		inp<="0000000000000111";
		wait for 50ns;
		inp<="0000000000001111";
		wait for 50ns;
		inp<="0000000000011111";
		wait for 50ns;
		inp<="0000000000111111";
		wait for 50ns;
		inp<="0000000001111111";
		wait for 50ns;		  
		inp<="0000000011111111";
		wait for 50ns;
		inp<="0000000111111111";
		wait for 50ns;
		inp<="0000001111111111";
		wait for 50ns;
		inp<="0000011111111111";
		wait for 50ns;
		inp<="0000111111111111";
		wait for 50ns;
		inp<="0001111111111111";
		wait for 50ns;
		inp<="0011111111111111";
		wait for 50ns;
		inp<="0111111111111111";
		wait;
	end process;
	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_un_to_bi of un_to_bi_tb is
	for TB_ARCHITECTURE
		for UUT : un_to_bi
			use entity work.un_to_bi(ans);
		end for;
	end for;
end TESTBENCH_FOR_un_to_bi;

