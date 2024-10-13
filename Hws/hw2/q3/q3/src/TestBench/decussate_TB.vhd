LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DecussateTb IS
END DecussateTb;
 
ARCHITECTURE behavior OF DecussateTb IS 
 
 
    COMPONENT Decussate
    PORT(
         Input : IN  std_logic_vector(15 downto 0);
         Output : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   signal Input : std_logic_vector(15 downto 0);

   signal Output : std_logic_vector(1 downto 0);
   
 
BEGIN										   
   uut: Decussate PORT MAP ( Input,Output);

   stim_proc: process
   begin								
      wait for 100 ns;	
		Input <= "1111000011110000";
									

      wait;
   end process;

END;
