

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register is
  port (

  clk : in std_logic;
  reset : in std_logic;
  load_en : in std_logic;

  instruction_in : in std_logic_vector(15 downto 0);
  instruction_out : out std_logic_vector(15 downto 0)
       );

end entity instruction_register;

architecture RTL of instruction_register is 
  signal instruction : std_logic_vector(15 downto 0) := (others => '0');

begin 

  process(clk)
  begin 

    if rising_edge(clk) then 
      if reset = '1' then
        instruction <= (others => '0');

      elsif load_en = '1' then
        instruction <= instruction_in;

      end if; 
    end if;

  end process;

  instruction_out <= instruction;

end architecture RTL;

