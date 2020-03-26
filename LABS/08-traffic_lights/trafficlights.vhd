library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity trafficlights is
port (
	clk_i    	: in  std_logic;
	srst_n_i 	: in  std_logic;   -- Synchronous reset (active low)
	cnt_en_i 	: in  std_logic;	 -- stopwatch enable
	
	lights	: out std_logic_vector(5 downto 0) --(stav 1)
	);
end trafficlights;


architecture Behavioral of trafficlights is
signal s_en  : std_logic;
signal s_d1 : std_logic_vector(3 downto 0) := x"0";
signal s_1 : std_logic_vector(5 downto 0) := "000000";
begin
     


CL_ENABLE: entity work.clock_enable
        generic map (g_NPERIOD=>x"0004")
        port map (
                  clk_i=>clk_i,
                  srst_n_i=>srst_n_i,
                  clock_enable_o=>s_en
                 );
					  
					  
	p1 : process(clk_i, srst_n_i, cnt_en_i)
	-- variable s_d1 : std_logic_vector(3 downto 0) := x"0";
   -- variable s_1 : std_logic_vector(5 downto 0) := "000000";	
 
				
	begin
		
		   if s_en  = '1' and cnt_en_i = '1' then
			s_d1 <= s_d1 + x"1";
			if s_d1 < x"6" then s_1 <= "100001"; end if; 
			if (s_d1 = x"7") then s_1 <= "100010"; end if;
			if (s_d1 = x"8") then s_1 <= "100100"; end if; 			
			if (s_d1 > x"8" and s_d1 < x"d") then s_1 <= "001100"; end if;
			if (s_d1 = x"e") then s_1 <= "010100"; end if;
			if (s_d1 = x"f") then s_1 <= "100001";  end if;			
				
		end if;
		lights <= s_1;
		
		
	end process;
end Behavioral;