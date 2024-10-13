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

