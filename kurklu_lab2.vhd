library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kurklu_lab2 is
	port(
		clk : in std_logic := '0';
		reset_n : in std_logic :='0';
		segment1 : out std_logic_vector(6 downto 0));
		
end entity kurklu_lab2;



architecture rit of kurklu_lab2 is
	component kurklu_lab2_sys is
        port (
            clk_clk                         : in  std_logic                    := 'X'; -- clk
            reset_reset_n                   : in  std_logic                    := 'X'; -- reset_n      
            seg1_external_connection_export : out std_logic_vector(3 downto 0)         -- export
        );
    end component kurklu_lab2_sys;
	 
	component bin_to_7seg is
			port(
				input : in std_logic_vector(3 downto 0):= (others => 'X');
				output : out std_logic_vector(6 downto 0));
			
	end component bin_to_7seg;

signal tmp : std_logic_vector(3 downto 0);
begin



	u0 : component kurklu_lab2_sys
        port map (
            clk_clk                         => clk,                         --                      clk.clk
            reset_reset_n                   => reset_n,                   --                    reset.reset_n
            seg1_external_connection_export => tmp  -- seg1_external_connection.export
        );
		  

	convert : component bin_to_7seg
			port map (
				input => tmp,
				output => segment1);
		  
end architecture;


