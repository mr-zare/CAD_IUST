library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Recursive_Functions is

  function BCD_to_Binary(Bin: std_logic_vector(3 downto 0)) return std_logic_vector;
  -- Recursive function to convert a BCD number to binary
  
  function Binary_Reverser(Bin: std_logic_vector) return std_logic_vector;
  -- Recursive function to reverse a binary number
  
end Recursive_Functions;

package body Recursive_Functions is

  function BCD_to_Binary(Bin: std_logic_vector(3 downto 0)) return std_logic_vector is
  begin
    case Bin is
      when "0000" =>
        return "0000";
      when "0001" =>
        return "0001";
      when "0010" =>
        return "0010";
      when "0011" =>
        return "0011";
      when "0100" =>
        return "0100";
      when "0101" =>
        return "0101";
      when "0110" =>
        return "0110";
      when "0111" =>
        return "0111";
      when "1000" =>
        return "1000";
      when "1001" =>
        return "1001";
      when others =>
        return std_logic_vector(unsigned(BCD_to_Binary(Bin(3 downto 0))) * 10 + unsigned(BCD_to_Binary(Bin(7 downto 4))));
    end case;
  end BCD_to_Binary;

  function Binary_Reverser(Bin: std_logic_vector) return std_logic_vector is
    variable Len: integer := Bin'length;
  begin
    if Len = 1 then
      return Bin;
    else
      return Binary_Reverser(Bin(Len-1 downto 0)) & Bin(Len);
    end if;
  end Binary_Reverser;

end Recursive_Functions;