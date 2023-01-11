library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_7seg is
	port(
		input : in integer range 0 to 9;
		output : out std_logic_vector(6 downto 0));
		
end entity bin_to_7seg;

architecture rit of bin_to_7seg is

begin

	output <=	"1000000" when input = 0 else 
					"1111001" when input = 1 else 
					"0100100" when input = 2 else 
					"0110000" when input = 3 else 
					"0011001" when input = 4 else 
					"0010010" when input = 5 else 
					"0000010" when input = 6 else 
					"1111000" when input = 7 else 
					"0000000" when input = 8 else 
					"0010000" when input = 9;
		  
end architecture;