library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity main_tb is
end main_tb;

architecture TB_ARCHITECTURE of main_tb is
	-- Component declaration of the tested unit
	component main
	port(
		rst : in STD_LOGIC;
		inp : in STD_LOGIC;
		clk : in STD_LOGIC;
		res : out STD_LOGIC_VECTOR(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the inp and inout ports of tested entity
	signal rst : STD_LOGIC;
	signal inp : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal res : STD_LOGIC_VECTOR(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : main
		port map (
			rst => rst,
			inp => inp,
			clk => clk,
			res => res
		);

	-- Add your stimulus here ...	 
	
			 process
       
        begin
            rst<= '0';
            clk <= '0' ;
            wait for 100ns ;
            inp <= '1';
            clk <= '1' ;
            wait for 100ns;
             clk <= '0' ;
            wait for 100ns;
            inp <= '0';
            clk <= '1' ;
            wait for 100ns;
             clk <= '0' ;
            wait for 100ns;
            inp <= '0';
            clk <= '1' ;
            wait for 100ns;
             clk <= '0' ;
            wait for 100ns;
            inp <= '1';
            clk <= '1' ;
            wait for 100ns;
             clk <= '0' ;
            wait for 100ns;
            inp <= '0';
            clk <= '1' ;
            wait for 100ns; 
			clk <= '0' ;
            wait for 100ns;
            inp <= '0';
            clk <= '1' ;
            wait for 100ns;
			clk <= '0' ;
            wait for 100ns;
            inp <= '1';
            clk <= '1' ;
            wait for 100ns;
        end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_main of main_tb is
	for TB_ARCHITECTURE
		for UUT : main
			use entity work.main(my_main);
		end for;
	end for;
end TESTBENCH_FOR_main;

