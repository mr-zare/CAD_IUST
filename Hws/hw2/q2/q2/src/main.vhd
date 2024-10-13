library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Jazr is
    Port (
        input : in std_logic_vector(9 downto 0);
        output : out std_logic_vector(4 downto 0)
    );
end Jazr;

architecture myJazr of Jazr is
    signal input_int : integer range 0 to 1023;
    signal output_int : integer range 0 to 31;
begin

    input_int <= to_integer(unsigned(input));
    
    process(input_int)
    begin
        output_int <= integer(SQRT(real(input_int)));        
    end process;
	 output <= std_logic_vector(to_unsigned(output_int, output'length));

end myJazr;
