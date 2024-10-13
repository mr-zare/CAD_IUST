		   library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity statemachine is
    Port ( rst : in  std_logic;  
	        clk : in  std_logic	;
            inp : in  std_logic;
            outp : out std_logic );
end statemachine;

architecture my_arch of statemachine is
    type state_type is (s0,s1,s2,s3,s4,s5);  --type of state machine.
    signal p_state,n_state: state_type;
begin
process (clk,rst)
begin
if (rst='1') then
    p_state<= s0; 
    elsif (rising_edge(clk)) then
    p_state<= n_state;   
end if;
end process;
process (p_state,inp)
begin
  case p_state is
     when s0 =>      
   if(inp ='0') then
      outp <= '0';
  n_state<= s1;
    else
      outp <= '0';
   n_state<= s0;
     end if;  
     when s1 =>       
   if(inp ='0') then
      outp <= '0';
   n_state<= s2;
    else
      outp <= '0';
   n_state<= s0;
    end if;
    when s2 =>       
   if(inp ='0') then
      outp <= '0';
    n_state<= s2;
    else
      outp <= '0';
   n_state<= s3;
    end if;
  when s3 =>       
    if(inp ='0') then
      outp <= '0';
    n_state<= s4;
    else
      outp <= '0';
    n_state<= s0;
    end if;
   when s4 =>       
    if(inp ='0') then
      outp <= '1';
      n_state<= s5;
      else
      outp <= '0';
      n_state<= s0;
    end if;
   when s5 =>        
    if(inp ='0') then
      outp <= '1';
      n_state<= s5;
    else
      outp <= '1';
      n_state<= s5;
    end if;
  end case;
end process;
end my_arch;

