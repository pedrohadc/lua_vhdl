----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:05 10/25/2022 
-- Design Name: 
-- Module Name:    operacao_and - Behavioral 
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

entity operacao_and is
	
	port ( aa : in bit_vector(3 downto 0);
	

	      ba : in  bit_vector(3 downto 0);
	

	
	      ca : out bit_vector(3 downto 0));
	

	end operacao_and;
	
	architecture Behavioral of operacao_and is

	begin

	ca(0) <= aa(0) and ba(0);

	ca(1) <= aa(1) and ba(1);

	ca(2) <= aa(2) and ba(2);

	ca(3) <= aa(3) and ba(3);

end Behavioral; 




	

	

	


