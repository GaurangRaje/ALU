-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testbench is
    
end testbench;

architecture tb of testbench is
    component alu is
    port(
        a, b : in std_logic_vector(3 downto 0);
        sel : in std_logic_vector(2 downto 0);
        res : out std_logic_vector(3 downto 0) 
    );
    end component;

    signal a_i, b_i, res_o : std_logic_vector(3 downto 0);
    signal sel_line : std_logic_vector(2 downto 0);
begin
    DUT: alu port map(a_i, b_i, sel_line, res_o);

    process
    begin
        a_i <= "0111";
        b_i <= "0001";

        sel_line <= "000";
        wait for 10ps;
        assert(res_o="1000") report "Fail 0/0" severity error; 
        
        sel_line <= "001";
        wait for 10ps;
        assert(res_o="0110") report "Fail 0/0" severity error;
        
        -- sel_line <= "010";
        -- wait for 10ps;
        -- assert(res_o="1110") report "Fail 0/0" severity error; 

        sel_line <= "011";
        wait for 10ps;
        assert(res_o="0001") report "Fail 0/0" severity error;
        
        sel_line <= "100";
        wait for 10ps;
        assert(res_o="0111") report "Fail 0/0" severity error; 

        sel_line <= "101";
        wait for 10ps;
        assert(res_o="1000") report "Fail 0/0" severity error; 

        sel_line <= "110";
        wait for 10ps;
        assert(res_o="1110") report "Fail 0/0" severity error; 

        sel_line <= "111";
        wait for 10ps;
        assert(res_o="1000") report "Fail 0/0" severity error; 

        a_i <= "0000";
        b_i <= "0000";
        sel_line <= "000";

        assert false report "Test done." severity note;
        wait;
    end process;
end tb;