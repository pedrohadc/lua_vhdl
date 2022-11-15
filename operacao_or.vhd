----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:12 10/25/2022 
-- Design Name: 
-- Module Name:    operacao_or - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operacao_or is

	port ( aor : in bit_vector(3 downto 0);
	

	      bor : in  bit_vector(3 downto 0);
	

	      cor : out bit_vector(3 downto 0)); 
	
	end operacao_or;
	

	architecture Behavioral of operacao_or is

	begin

	cor(0) <= aor(0) or bor(0);
	

	cor(1) <=  aor(1) or bor(1);
	

	cor(2) <=  aor(2) or bor(2);
	

	cor(3) <=  aor(3) or bor(3);

	end Behavioral;
