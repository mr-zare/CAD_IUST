

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package cm is
    -- Complex number data type
    type complex is record
        real : real;
        imag : real;
    end record complex;
    

    type matrix is array  (natural range <>, natural range <>) of complex;
    

    function a_m(a : matrix; b : matrix) return matrix;
    

    function m_m(a : matrix; b : matrix) return matrix;
    

    procedure fill_matrix( signal  m :inout matrix);
    
	
    procedure print_matrix(m : matrix);
    
end package cm;

package body cm is

    function a_m(a : matrix; b : matrix) return matrix is	
	variable rows : integer  := a'length(1);	 
	variable cls : integer  := a'length(2);	
			
       variable c : matrix(0 to rows-1, 0 to cls-1);
    begin
        for i in 0 to rows-1 loop
            for j in 0 to cls-1 loop
                c(i,j).real := a(i,j).real + b(i,j).real;
                c(i,j).imag := a(i,j).imag + b(i,j).imag;
            end loop;
        end loop;
        return c;
    end function;
    

    function m_m(a : matrix; b : matrix) return matrix is   
	variable rws : natural := a'length(1) ;
    variable cls : natural := b'length(2) ;
	
        variable c : matrix(0 to rws-1, 0 to cls-1);
    begin
        for i in 0 to rws-1 loop
            for j in 0 to cls-1 loop
                c(i,j).real := 0.0;
                c(i,j).imag := 0.0;
                for k in 0 to cls-1 loop
                    c(i,j).real := c(i,j).real + (a(i,k).real * b(k,j).real) - (a(i,k).imag * b(k,j).imag);
                    c(i,j).imag := c(i,j).imag + (a(i,k).real * b(k,j).imag) + (a(i,k).imag * b(k,j).real);
                end loop;
            end loop;
        end loop;
        return c;
    end function;													 
    
    -- Procedure to fill a matrix randomly    procedure fill_matrix(out m : matrix) is
    procedure fill_matrix(signal  m :inout matrix ) is		 
	
		   variable rand_num : real;
    begin
        for i in m'range(1) loop
            for j in m'range(2) loop	  
				
				
                m(i,j).real <= 	3.0;
               	   m(i,j).imag <= 	3.0;
            end loop;
        end loop;
    end procedure;
	
	
function to_string(c : complex) return string is
begin
    return "( &(c.real) ,  &(c.imag)  )";
end function;
	
	
	
	
	
    -- Procedure to print out a matrix
    procedure print_matrix(m : matrix) is
    begin
        for i in m'range(1) loop
            for j in m'range(2) loop
                report to_string(m(i,j));
            end loop;
            report "";
        end loop;
    end procedure;
    
end package body;