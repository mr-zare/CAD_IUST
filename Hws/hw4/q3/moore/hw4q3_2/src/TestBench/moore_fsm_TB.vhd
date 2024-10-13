library ieee;
use ieee.std_logic_1164.all;

entity moore_fsm_tb is
end entity moore_fsm_tb;

architecture behavioral of moore_fsm_tb is

  signal clk    : std_logic := '0';
  signal reset  : std_logic := '1';
  signal input  : std_logic := '0';
  signal output : std_logic;
  
begin

  dut: entity work.moore_fsm
    port map (
      clk     => clk,
      reset   => reset,
      input   => input,
      output  => output
    );

  clk_process: process
  begin
    while now < 500 ns loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;
    wait;
  end process;

  reset_process: process
  begin
    reset <= '1';
    wait for 20 ns;
    reset <= '0';
    wait;
  end process;

  input_process: process
  begin
    input <= '0';
    wait for 50 ns;
    input <= '1';
    wait for 10 ns;
    input <= '1';
    wait for 10 ns;
    input <= '1';
    wait for 10 ns;
    input <= '0';
    wait for 10 ns;
    input <= '1';
    wait for 10 ns;
    input <= '0';
    wait for 10 ns;
    input <= '1';
    wait;
  end process;

end architecture behavioral;