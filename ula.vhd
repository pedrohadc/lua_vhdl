----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:55 10/25/2022 
-- Design Name: 
-- Module Name:    ula - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ula is


port (--x, y: in std_logic_vector(3 downto 0);     --vetores de entrada
      --cin : in std_logic;
     sel : in std_logic_vector (2 downto 0);                    --seletor
	  clk : in std_logic;
	  switch_key : in std_logic;
     saida : out std_logic_vector(3 downto 0);
	  carryout : out std_logic;
	  overflow : out std_logic;
	  zero : out std_logic;
	  negative : out std_logic);
end ula;

architecture hardware of ula is


 component somador4bits                        -- 'buscando' somador de 4 bit
 port (x, y : in std_logic_vector(3 downto 0);               
       carryin : in std_logic;
		 s : out std_logic_vector(3 downto 0);
		 carryout : out std_logic);               -- soma e carry out do somador
 end component;
 
 component subtracao                      -- 'buscando' subtrator de 4 bit
 port (x, y : in std_logic_vector(3 downto 0);               
       carryin : in std_logic;
		 s : out std_logic_vector(3 downto 0);
		 carryout : out std_logic);               -- diferença e carry out do subtrator
 end component;



 component troca_de_sinal                        -- 'buscando' operação
 port (x : in std_logic_vector(3 downto 0);               
       carryin : in std_logic;
		 s : out std_logic_vector(3 downto 0);
		 carryout : out std_logic);               -- resultado e carry out da operação
 end component;

 component incremento_1                      -- 'buscando' operação
 port (x : in std_logic_vector(3 downto 0);               
       carryin : in std_logic;
		 s : out std_logic_vector(3 downto 0);
		 carryout : out std_logic);               -- resultado e carry out da operação
 end component;
 
 component operacao_or                       -- 'buscando' operação
 port (aor, bor : in std_logic_vector(3 downto 0);               -- entradas e carry in do somador
       cor : out std_logic_vector(3 downto 0));               -- resultado e carry out da operação
  end component;
  
 component operacao_and                        -- 'buscando' operação
 port (aa, ba : in std_logic_vector(3 downto 0);               -- entradas e carry in do somador
       ca: out std_logic_vector(3 downto 0));               -- resultado e carry out da operação
   end component;
	
  component dobro                       -- 'buscando' operação
 port (x : in std_logic_vector(3 downto 0);
		 carryin : in std_logic;               -- entradas e carry in do somador
       s : out std_Logic_vector(3 downto 0);
		 carryout : out std_logic);               -- resultado e carry out da operação
 end component;
 

 component comparador                      -- 'buscando' operação
 port (a, b : in std_logic_vector;               -- entradas e carry in do somador
       s : out std_logic_vector(3 downto 0));
 end component;
 
component contador is
    generic(t_max : integer := 100000000); 
    port(CLOCK_50: in std_logic;
    counter_out: out unsigned(3 downto 0) := "0000"
    );
end component;		
		
 
 
signal x : std_logic_vector(3 downto 0);   
signal y : std_logic_vector(3 downto 0) := "1010";
signal s1, s2, s3, s4, s5, s6, s7 : std_logic_vector(3 downto 0);
signal s8 : std_logic_vector(3 downto 0);        
signal cout1, cout2, cout3, cout4, cout7 : std_logic;
signal r : std_logic_vector(3 downto 0);
signal cont_tmp : unsigned(3 downto 0);

begin 
cont : contador port map(clk, cont_tmp);
x <= std_logic_vector(cont_tmp) when switch_key = '1' else x;

soma: somador4bits PORT MAP( x, y, '0', s1, cout1);
subtracaao : subtracao PORT MAP ( x, y, '1', s2, cout2);
troca : troca_de_sinal PORT MAP ( x, '1', s3, cout3);
incr : incremento_1 PORT MAP ( x, '1', s4, cout4);
orbit : operacao_or PORT MAP ( x, y, s5);
andbit : operacao_and PORT MAP ( x, y, s6);
dobroo : dobro PORT MAP ( x, '0', s7, cout7);
comp : comparador PORT MAP ( x, y, s8);

  r <= s1 WHEN (sel= "000")else
           s2 WHEN (sel="001")else
           s3 WHEN (sel="010")else
           s4 WHEN (sel="011")else
           s5 WHEN (sel="100")else
           s6 WHEN (sel="101")else
           s7 WHEN (sel="110")else
           s8;
			  
			  
	carryout <= cout1 WHEN (sel= "000")else
        cout2 WHEN (sel="001")else
          cout3 WHEN (sel="010")else
           cout4 WHEN (sel="011")else
           cout7 WHEN (sel="110")else
			  '0';
				
	saida <= r;

	overflow <= ((not x(3)) and (not y(3)) and (r(3))) or 
	((x(3)) and (y(3)) and (not r(3))) when (sel= "000" or sel="001" or sel="010"
	or sel="011" or sel="110") else
	'0';
	
	zero <= '1' when (r = "0000") else
	'0';
	
	negative <= '1' when (r(3)= '1') else
	'0';
	
			  
			  
			  
			  
end architecture;
