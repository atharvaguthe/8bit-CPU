

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
  port (

  clk : in std_logic;
  reset : in std_logic;
  enable : in std_logic;

  pc_load : in std_logic;
  load_addr : in std_logic_vector(7 downto 0);

  pc_out : out std_logic_vector(7 downto 0)
       );

end entity program_counter;

architecture RTL of program_counter is 

  signal pc : unsigned(7 downto 0) := (others => '0');

begin

  process(clk)
  begin

    if rising_edge(clk) then 

      if reset = '1' then 
        pc <= (others => '0');
      elsif pc_load = '1' then 
        pc <= unsigned(load_addr);
      elsif enable = '1' then 
        pc <= pc + 1;
      end if;

    end if;

  end process;

  pc_out <= std_logic_vector(pc);

end architecture RTL;
