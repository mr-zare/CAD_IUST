library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity main is
  port (rst, inp, clk: in std_logic;
  result : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end entity;

architecture my_main of main is
signal mstate : std_logic;
signal mstate2 : std_logic;
signal number: std_logic_vector(31 downto 0);
component statemachine is
    Port ( rst : in  STD_LOGIC;
            inp : in  STD_LOGIC;
            output : out  STD_LOGIC;
            clk : in  STD_LOGIC);
end component;

component statemachine2 is
    Port ( rst : in  STD_LOGIC;
            inp : in  STD_LOGIC;
            output : out  STD_LOGIC;
            clk : in  STD_LOGIC);
end component;
signal sm1_out : std_logic;	  
signal sm2_out : std_logic;	
begin
  L1: statemachine port map (rst, inp, sm1_out, clk);
  L2: statemachine2 port map (rst, inp, sm2_out, clk);
  result <= not number when (sm1_out= '1') else
        std_logic_vector(unsigned(number) - 1) when (sm1_out='1') else
        number;
process (clk)
variable index : integer:= 0;
begin
if (rising_edge(clk)) then
	if inp'event then
      number(index)<= inp ;
      index := index + 1;
	  end if ;
end if;
end process;

end; 




