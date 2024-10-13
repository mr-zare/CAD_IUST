library ieee;
use ieee.std_logic_1164.all;

entity mealy_fsm is
  port (
    clk     : in  std_logic;
    reset   : in  std_logic;
    input   : in  std_logic;
    output  : out std_logic
  );
end entity mealy_fsm;

architecture behavioral of mealy_fsm is

  type state_type is (S0, S1, S2, S3);
  signal current_state, next_state : state_type;
  
begin

  process(clk, reset)
  begin
    if reset = '1' then
      current_state <= S0;
    elsif rising_edge(clk) then
      current_state <= next_state;
    end if;
  end process;

  -- Output logic
  process(current_state, input)
  begin
    case current_state is
      when S0 =>
        if input = '1' then
          next_state <= S1;
        else
          next_state <= S0;
        end if;
        output <= '0';
        
      when S1 =>
        if input = '1' then
          next_state <= S2;
        else
          next_state <= S1;
        end if;
        output <= '0';
        
      when S2 =>
        if input = '1' then
          next_state <= S3;
        else
          next_state <= S1;
        end if;
        output <= '0';
        
      when S3 =>
        if input = '0' then
          next_state <= S0;
          output <= '1';
        else
          next_state <= S1;
          output <= '0';
        end if;
        
      when others =>
        next_state <= S0;
    end case;
  end process;

end architecture behavioral;