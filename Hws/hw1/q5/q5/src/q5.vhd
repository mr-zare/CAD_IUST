--default libraries
library IEEE; 
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  	
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.complex.all;

entity soal5 is
	port (
	a,b : in arr2d ;
	mmul,msum,msub: in std_logic;
	out1: out arr2d
		);
end soal5;


architecture t5 of soal5 is
signal tmp : std_logic_vector(2 downto 0);
signal res : arr2d;
begin
	tmp <= mmul & msum & msub ;
	res <= (a(0) * b(0),a(1)*b(1)) when tmp="100" else
			(a(0) + b(0),a(1) + b(1)) when tmp="010" else	
			(a(0) - b(0),a(1) - b(1)) when tmp="001"; 
	out1 <= res;
end t5;	
