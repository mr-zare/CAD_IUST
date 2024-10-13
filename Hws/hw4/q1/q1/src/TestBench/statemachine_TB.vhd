library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity statemachine_tb is
end statemachine_tb;

architecture TB_ARCHITECTURE of statemachine_tb is
	-- Component declaration of the tested unit
	component statemachine
	port(
		input : in BIT;
		clk : in STD_LOGIC;
		f_z_s : out INTEGER;
		f_z_e : out INTEGER;
		l_z_s : out INTEGER;
		l_z_e : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : BIT;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal f_z_s : INTEGER;
	signal f_z_e : INTEGER;
	signal l_z_s : INTEGER;
	signal l_z_e : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : statemachine
		port map (
			input => input,
			clk => clk,
			f_z_s => f_z_s,
			f_z_e => f_z_e,
			l_z_s => l_z_s,
			l_z_e => l_z_e
		);

	-- Add your stimulus here ... 
		 process
         begin

        -- Test 1: input = 11111111000000001111111100000000
     
       
        wait for 10 ns;	
		
        
      
        for i in 1 to 8 loop
            clk <= '0';
            wait for 10 ns;
			input <= '1' ;
            clk <= '1';
            wait for 10 ns;
        end loop;
        
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        for i in 1 to 8 loop
            clk <= '0';
            wait for 10 ns;
			 input <= '0' ;
            clk <= '1';
            wait for 10 ns;
        end loop;	
		
		 for i in 1 to 8 loop
            clk <= '0';
            wait for 10 ns;
			 input <= '1' ;
            clk <= '1';
            wait for 10 ns;
        end loop;
		
		for i in 1 to 8 loop
            clk <= '0';
            wait for 10 ns;
			 input <= '0' ;
            clk <= '1';
            wait for 10 ns;
        end loop;
       
       		assert f_z_s = 0 and f_z_e = 0 and
       l_z_s = 49 and l_z_e = 64
       report "Test 2 failed" severity error;

        wait;
    end process;
	
	
	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_statemachine of statemachine_tb is
	for TB_ARCHITECTURE
		for UUT : statemachine
			use entity work.statemachine(my_arch);
		end for;
	end for;
end TESTBENCH_FOR_statemachine;

