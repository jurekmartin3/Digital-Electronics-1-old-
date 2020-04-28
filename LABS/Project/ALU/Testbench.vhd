
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Testbench IS
  
    PORT(
--         A : IN  std_logic_vector(3 downto 0);
--         B : IN  std_logic_vector(3 downto 0);
--         ALU_Sel : IN  std_logic_vector(3 downto 0);
         ALU_Out : OUT  std_logic_vector(3 downto 0);
         Carryout : OUT  std_logic
			
			BTN0, BTN1 : in std_logic;
			disp_dp    : out std_logic; -- Decimal point
			disp_seg_o : out std_logic_vector(7-1 downto 0);
			disp_dig_o : out std_logic_vector(4-1 downto 0)
        );
END ENTITY Testbench;
    
ARCHITECTURE behavior OF Testbench IS  
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');
	signal s_seg		:std_logic_vector(3 downto 0);
	signal ALU_Out :  std_logic_vector(3 downto 0);
   signal Carryout :  std_logic;
	

 	--Outputs
--   signal ALU_Out : std_logic_vector(3 downto 0);
--   signal Carryout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
	
    --------------------------------------------------------------------

	
    clock_enable : entity work.clock_enable
    port map (
    	clk_i => clk_i,
        reset => BTN0,
        clock_enable_o => s_clock_en
    );
	 
	     hex_to_7seg : entity work.hex_to_7seg
    port map (
    	hex_i => s_seg,
        seg_o => disp_seg_o
    );
	 
	-- Instantiate the Unit Under Test (UUT)
    ALU : entity work.ALU
	 PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;

