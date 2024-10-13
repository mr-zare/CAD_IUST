   library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity statemachine2 is
    Port ( rst : in std_logic;
            inp : in  std_logic;
            outp : out  std_logic;
            clk : in  std_logic);
end statemachine2;

architecture my_arch of statemachin2 is
    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7);
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
n_state<= s0;
    else
      outp <= '0';
n_state<= s1;
     end if;  
     when s1 =>        
if(inp ='0') then
      outp <= '0';
n_state<= s2;
    else
      outp <= '0';
n_state<= s1;
    end if;
    when s2 =>       
if(inp ='0') then
      outp <= '0';
n_state<= s3;
    else
      outp <= '0';
n_state<= s1;
    end if;
  when s3 =>        
if(inp ='0') then
      outp <= '0';
n_state<= s0;
    else
      outp <= '0';
n_state<= s4;
    end if;
    when s4 =>        
if(inp ='0') then
      outp <= '0';
n_state<= s5;
    else
      outp <= '0';
n_state<= s1;
    end if;
when s5 =>         
if(inp ='0') then
      outp <= '0';
n_state<= s6;
    else
      outp <= '0';
n_state<= s1;
    end if;
when s6 =>        
if(inp ='0') then
      outp <= '0';
n_state<= s0;
    else
      outp <= '1';
n_state<= s7;
    end if;
when s7 =>        
if(inp ='0') then
      outp <= '1';
n_state<= s7;
    else
      outp <= '1';
n_state<= s7;
    end if;        
  end case;
end process;
end my_arch;


