LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
 
    COMPONENT trafficlights
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         cnt_en_i : IN  std_logic;
         lights : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal cnt_en_i : std_logic := '0';

 	--Outputs
   signal lights : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trafficlights PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
s          cnt_en_i => cnt_en_i,
          lights => lights
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 
		srst_n_i <= '1';
		cnt_en_i <= '1';
      wait;
   end process;

END;