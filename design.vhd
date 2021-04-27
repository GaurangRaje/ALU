-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity alu is 
port(
	a, b : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(2 downto 0);
    res : out std_logic_vector(3 downto 0)
);
end alu;

architecture arch of alu is
begin
	process(a, b, sel) is
    begin
		case sel is
			when "000" => 
				res <= a + b;
            when "001" => 
				res <= a - b; 
            when "010" => 
				res <= a * b;
			when "011" =>
				res <= a and b;
			when "100" =>
				res <= a or b;
			when "101" =>
				res <= not a;
			when "110" =>
				res <= a nand b;
			when "111" =>
				res <= a nor b;

		
			when others => res <= "0000";
			
		end case ;
    end process;
end arch;