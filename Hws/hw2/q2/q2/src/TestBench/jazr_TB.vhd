LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY jazr_TB IS
END jazr_TB;
 
ARCHITECTURE myJazr OF jazr_TB IS 														   
 
    COMPONENT SquareRootCalculator
    PORT(
         input : IN  std_logic_vector(9 downto 0);
         output : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    
   signal input : std_logic_vector(9 downto 0) := (others => '0');
				 
   signal output : std_logic_vector(4 downto 0);
 
 
BEGIN
 
   uut: SquareRootCalculator PORT MAP (
          input => input,
          output => output
        );

   stim_proc: process
   begin		

      wait for 100 ns;	

      Input <= "0000000100";

      wait;
   end process;

END;
