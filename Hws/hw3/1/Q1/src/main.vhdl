 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.complex_matrix.all;

entity m_test is
end entity;

architecture sim of m_test is
    -- Declare matrices
    signal a : matrix(0 to 1, 0 to 1);
    signal b : matrix(0 to 1, 0 to 1);
    signal c : matrix(0 to 1,0 to 1);
begin
    -- Fill matrices randomly
    fill_matrix(a);
    fill_matrix(b);
    
    -- Add matrices and print result
    c <= a_d(a, b);
    print_matrix(c);
    
end architecture;