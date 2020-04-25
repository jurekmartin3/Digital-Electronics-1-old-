--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:59:59 04/25/2020
-- Design Name:   
-- Module Name:   C:/Users/barbo/Documents/Xilinx/cv8/ALU/Testbench.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Testbench IS
END Testbench;
 
ARCHITECTURE behavior OF Testbench IS 
  
    COMPONENT alu
    PORT(
         clk_i : IN  std_logic;
         reset : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         enable : IN  std_logic;
         opcode : IN  std_logic_vector(3 downto 0);
         alu_out : OUT  std_logic_vector(7 downto 0)
			disp_seg_o	:out std_logic_vector(6 downto 0);
			disp_dig_o	:out std_logic_vector(3 downto 0);
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal reset : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal enable : std_logic := '0';
   signal opcode : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal alu_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          clk_i => clk_i,
          reset => reset,
          A => A,
          B => B,
          enable => enable,
          opcode => opcode,
          alu_out => alu_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk_i <= '0';
		wait for clk_period/2;
		clk_i <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;
		wait for clk_period/2;
		
		reset <= '1'; enable <= '0';
		wait for clk_period;
		reset <= '0';
		
		wait for clk_period;
		A <= "0010" ; B <= "0001" ; enable <= '1';
		opcode <= "0001" ;
		
		wait for clk_period;
		opcode <= "0010" ;
		
		wait for clk_period;
		A <= "1111" ; B <= "0111";
		opcode <= "0011";
		
		wait for clk_period;
		A <= "0100" ; B <= "0010";
		opcode <= "0100";
		
		wait for clk_period*2;
      wait;
   end process;
	
 hex_to_7seg : entity alu.hex_to_7seg
    port map (
    	hex_i => opcode,
        seg_o => disp_seg_o
    );
END;
