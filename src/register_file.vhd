

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
  port(
    clk : in std_logic;
    reset : in std_logic;
    
    we : in std_logic;
    
    read_addr1 : in std_logic_vector(2 downto 0);
    read_addr2 : in std_logic_vector(2 downto 0);

    write_addr : in std_logic_vector(2 downto 0);
    write_data : in std_logic_vector(7 downto 0);

    read_data1 : out std_logic_vector(7 downto 0);
    read_data2 : out std_logic_vector(7 downto 0);
    debug_r3 : out std_logic_vector(7 downto 0)

      );

end entity register_file;

architecture RTL of register_file is 

  type reg_array is array(0 to 7) of 
    std_logic_vector(7 downto 0);

  signal regs : reg_array;

begin

--Synchronous write process 
  process(clk)
  begin 

    if rising_edge(clk) then 

      if reset = '1' then
        regs <= (others => (others => '0'));
      elsif we = '1' then 
        regs(to_integer(unsigned(write_addr))) <= write_data;

      end if;

    end if;
  end process;

  --ASynchronous read ports
  read_data1 <= regs(to_integer(unsigned(read_addr1)));

  read_data2 <= regs(to_integer(unsigned(read_addr2)));

  debug_r3 <= regs(3);

end architecture RTL;


