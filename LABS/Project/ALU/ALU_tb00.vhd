LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb00 IS
END ALU_tb00;
 
ARCHITECTURE behavior OF ALU_tb00 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         ALU_Sel : IN  std_logic_vector(3 downto 0);
         ALU_Out : OUT  std_logic_vector(3 downto 0);
         Carryout : OUT  std_logic;
			clk_i		: in std_logic;
			srst_n_i   : in  std_logic;
			disp_seg_o	:out std_logic_vector(6 downto 0);
			disp_dig_o	:out std_logic_vector(3 downto 0);
			SW0_CPLD, SW1_CPLD, SW2_CPLD, SW3_CPLD : in std_logic; -- Input 0
			SW4_CPLD, SW5_CPLD, SW6_CPLD, SW7_CPLD : in std_logic; -- Input 1
			SW8_CPLD, SW9_CPLD, SW10_CPLD, SW11_CPLD : in std_logic -- Input 2
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Out : std_logic_vector(3 downto 0);
   signal Carryout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   cconstant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );
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
--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	

	A(0) <= SW0_CPLD;
   A(1) <= SW1_CPLD;
   A(2) <= SW2_CPLD;
   A(3) <= SW3_CPLD;

	B(0) <= SW4_CPLD;
   B(1) <= SW5_CPLD;
   B(2) <= SW6_CPLD;
   B(3) <= SW7_CPLD;
    
   ALU_Sel(0) <= SW8_CPLD;
   ALU_Sel(1) <= SW9_CPLD;
   ALU_Sel(2) <= SW10_CPLD;
   ALU_Sel(3) <= SW11_CPLD;
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
