-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT (Device Under Test) component
component stopwatch is
port (
	clk_i : in std_logic := '0';
	srst_n_i : in std_logic:= '1';
	ce_100Hz_i : in std_logic := '0';
	cnt_en_i : in std_logic := '0';
	sec_h_o : out std_logic_vector(3 downto 0) := (others => '0');
	sec_l_o : out std_logic_vector(3 downto 0) := (others => '0');
	hth_h_o : out std_logic_vector(3 downto 0) := (others => '0');
	hth_l_o : out std_logic_vector(3 downto 0) := (others => '0'));
end component;
	signal clk_s : std_logic := '0';
	signal srst_n_s : std_logic := '0';
	signal ce_100Hz_s : std_logic := '0';
	signal cnt_en_s : std_logic := '0';
	signal sec_h_s : std_logic_vector(3 downto 0);
	signal sec_l_s : std_logic_vector(3 downto 0);
	signal hth_h_s : std_logic_vector(3 downto 0);
	signal hth_l_s : std_logic_vector(3 downto 0);

begin

	-- Connect DUT
  	DUT: stopwatch port map(clk_s, srst_n_s, ce_100Hz_s, cnt_en_s,sec_h_s, sec_l_s, hth_h_s, hth_l_s);
    
    EnableDelay: process
    begin
    srst_n_s <= '1';
    wait for 10 ps;
    cnt_en_s <= '1';
    wait for 100 ps;
    cnt_en_s <= '0';
    wait for 100 ps;
    cnt_en_s <= '1';
    
    wait for 100 ps;
    srst_n_s <= '0';
    wait for 20 ps;
    srst_n_s <= '1';
    wait;
    end process;

    
    Clk_gen: process
  	begin
      while true loop
        clk_s <= not clk_s;
        wait for 10 us;
      end loop;
	end process Clk_gen;
    
    CE_100Hz_GEN: process
    begin
      while true loop
        ce_100Hz_s <= not ce_100Hz_s;
        wait for 10 ps;
      end loop;
    end process CE_100Hz_GEN;
 end tb;