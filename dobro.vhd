----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:03 10/25/2022 
-- Design Name: 
-- Module Name:    dobro - Behavioral 
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

entity dobro is
	
	port (x: in std_logic_vector(3 downto 0);     --vetores de entrada
	     carryin : in std_logic;                    --carry in geral
	     s : out std_logic_vector(3 downto 0);      --soma
	     carryout : out std_logic);                  --carry out geral
	
	end dobro;
	

	architecture hardware of dobro is

		
		
	 component somador1bit                         -- 'buscando' somador de 1 bit\
		
	 port (a, b, cin : in std_logic;               -- entradas e carry in do somador
	       c, cout : out std_logic);               -- soma e carry out do somador
		
	 end component;
	

	 signal v: std_logic_vector(3 downto 1);
	

	begin
	
	 soma0 : somador1bit PORT MAP(  x(0), x(0) , '0', s(0),  v(1));

	 soma1 : somador1bit PORT MAP(  x(1), x(1) , v(1), s(1), v(2));
	
	 soma2 : somador1bit PORT MAP(  x(2), x(2) , v(2), s(2), v(3));
	
	 soma3 : somador1bit PORT MAP(  x(3), x(3) , v(3), s(3), carryout);
end architecture;
