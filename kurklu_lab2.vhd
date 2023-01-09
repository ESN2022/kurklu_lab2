library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kurklu_lab2 is
	port(
		clk : in std_logic := '0';
		reset_n : in std_logic :='0';
		segment1 : out std_logic_vector(6 downto 0);
		segment2 : out std_logic_vector(6 downto 0);
		segment3 : out std_logic_vector(6 downto 0));
		
end entity kurklu_lab2;

architecture rit of kurklu_lab2 is
	component kurklu_lab2_sys is
        port (
            clk_clk                         : in  std_logic                    := 'X'; -- clk
            reset_reset_n                   : in  std_logic                    := 'X'; -- reset_n
            seg2_external_connection_export : out std_logic_vector(6 downto 0);        -- export
            seg3_external_connection_export : out std_logic_vector(6 downto 0);        -- export
            seg1_external_connection_export : out std_logic_vector(6 downto 0)         -- export
        );
    end component kurklu_lab2_sys;

begin
	u0 : component kurklu_lab2_sys
        port map (
            clk_clk                         => clk,                         --                      clk.clk
            reset_reset_n                   => reset_n,                   --                    reset.reset_n
            seg2_external_connection_export => segment2, -- seg2_external_connection.export
            seg3_external_connection_export => segment3, -- seg3_external_connection.export
            seg1_external_connection_export => segment1  -- seg1_external_connection.export
        );
		  
end architecture;
