----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:25 10/25/2022 
-- Design Name: 
-- Module Name:    somador1bit - Behavioral 
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

entity somador1bit is

	port ( a : in STD_LOGIC;
	

	      b : in  STD_LOGIC;
	

	      cin : in STD_LOGIC;
	

	      c : out STD_LOGIC;
	

	      cout : out STD_LOGIC) ;
	
	end somador1bit;
	

	architecture Behavioral of somador1bit is
	
	begin
	

	c <= (a xor b) xor cin;
	

	cout <= (a and b)or(cin and (a xor b));
	
	end Behavioral;

