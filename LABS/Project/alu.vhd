----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:32 04/25/2020 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity alu is
port ( clk_i: 			in std_logic;
		reset: 			in std_logic;
		
		A		: 			in std_logic_vector (3 downto 0);
		B		: 			in std_logic_vector (3 downto 0);
		enable: 			in std_logic;
		opcode: 			in std_logic_vector (3 downto 0);
		alu_out: 		out std_logic_vector (7 downto 0)
		);
end alu;

architecture alu of alu is
	signal alu_out_reg : std_logic_vector (7 downto 0) := "00000000";
begin
alu_out <= alu_out_reg WHEN (enable ='1') ELSE "ZZZZZZZZ";

process(clk_i)
begin
	if (reset = '1') then
		alu_out_reg <= x"00";
	elsif (rising_edge (clk_i) ) then
		case opcode is
			when "0001" =>
				alu_out_reg <= "0000" & (A + B);
			when "0010" =>
				alu_out_reg <= "0000" & (A - B);
			when "0011" =>
				alu_out_reg <= "0000" & not(A);
			when "0100" =>
				alu_out_reg <=		A * B;
			when "0101" =>
				alu_out_reg <= "0000" & (A AND B);
			when "0110" =>
				alu_out_reg <= "0000" & (A OR B);
			when "0111" =>
				alu_out_reg <= "0000" & (A NAND B);
			when "1000" =>
				alu_out_reg <= "0000" & (A XOR B);
			when others =>
				alu_out_reg <= X"00";
		end case;
	end if;
end process;
end alu;
