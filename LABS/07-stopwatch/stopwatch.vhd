library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is
port(
  hth_l_o : out std_logic_vector(4-1 downto 0) := (others => '0');
  hth_h_o : out std_logic_vector(4-1 downto 0) := (others => '0');
  sec_l_o : out std_logic_vector(4-1 downto 0) := (others => '0');
  sec_h_o : out std_logic_vector(4-1 downto 0) := (others => '0');
  ce_100Hz_i : in std_logic := '0';
  cnt_en_i : in std_logic := '0';
  clk_i : in std_logic := '0';
  srst_n_i : in std_logic:= '1');

end entity stopwatch;	
	
architecture Behavioral of stopwatch is

signal and_dc0, and_dc1, and_dc2, and_dc3, and_dc4 :std_logic := '0';
    
begin
  
Counter0 : entity work.Counter
	generic map (
    				g_NBIT => 9
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => and_dc0,
    cnt_o => hth_l_o,
    carry_o => and_dc1
	);
    
Counter1 : entity work.Counter
    generic map (
                        g_NBIT => 9
                                )
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => and_dc1,
    cnt_o => hth_h_o,
    carry_o => and_dc2
	);
    
Counter2 : entity work.Counter
	generic map (
    				g_NBIT => 5
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => and_dc2,
    cnt_o => sec_h_o,
    carry_o => and_dc3
	);
    
Counter3 : entity work.Counter
	generic map (
    				g_NBIT => 9 
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => and_dc3,
    cnt_o => sec_l_o,
    carry_o => and_dc4
	);  
  
   Counters : process(clk_i)
   begin
   
   if rising_edge(clk_i) then
     if srst_n_i = '0' then  -- Synchronous reset (active low)
     and_dc0 <= '0';  
     else
     	and_dc0 <= ce_100Hz_i and cnt_en_i;     
     end if;
   end if;
  
   
   end process Counters;

end architecture Behavioral;