LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.Sorting.ALL;

 
ENTITY SortTb IS
END SortTb;
 
ARCHITECTURE behavior OF SortTb IS 
 
 
    COMPONENT Sort
    PORT(
         Input: in std_logic_array;
         Output: out std_logic_array
        );
    END COMPONENT;
    

   signal input: std_logic_array;

   signal Output : std_logic_array;

 
BEGIN
 

   uut: Sort PORT MAP (
          Input => Input,
          Output => Output
        );   


   stim_proc: process
   begin								
      wait for 100 ns;	

      input <= ( "11111111",
						"00111111",
						"01111111",
						"00000000",
						"00011111",
						"00000001",
						"00000011",
						"00000111",
						"00001111",
						"00000000");

      wait;
   end process;

END;
