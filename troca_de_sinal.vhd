----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:51 10/25/2022 
-- Design Name: 
-- Module Name:    troca_de_sinal - Behavioral 
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


	entity troca_de_sinal is
	

	port (x: in std_logic_vector(3 downto 0);     --vetores de entrada
	

	     carryin : in std_logic;                    --carry in geral
	

	     s : out std_logic_vector(3 downto 0);      --soma
	

	     carryout : out std_logic);                  --carry out geral
	

	end troca_de_sinal;
	

	



	

	architecture hardware of troca_de_sinal is
	

	


	 component somador1bit                         -- 'buscando' somador de 1 bit
	

	 port (a, b, cin : in std_logic;               -- entradas e carry in do somador
	

	       c, cout : out std_logic);               -- soma e carry out do somador
	

	 end component;
	

	 signal v: std_logic_vector(3 downto 1);
	
	

	begin
	


	 soma0 : somador1bit PORT MAP(  not(x(0)), '0' , '1', s(0),  v(1));
	

	 soma1 : somador1bit PORT MAP(  not(x(1)), '0' , v(1), s(1), v(2));
	

	 soma2 : somador1bit PORT MAP(  not(x(2)), '0' , v(2), s(2), v(3));
	

	 soma3 : somador1bit PORT MAP(  not(x(3)), '0' , v(3), s(3), carryout);
	

	

	end hardware;

