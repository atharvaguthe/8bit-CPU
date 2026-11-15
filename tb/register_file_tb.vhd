

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file_tb is
end entity register_file_tb;

architecture sim of register_file_tb is

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal we : std_logic := '0';

  signal read_addr1 : std_logic_vector(2 downto 0) := "000";
  signal read_addr2 : std_logic_vector(2 downto 0) := "000";

  signal write_addr : std_logic_vector(2 downto 0) := "000";
  signal write_data : std_logic_vector(7 downto 0) := x"00";

  signal read_data1 : std_logic_vector(7 downto 0);
  signal read_data2 : std_logic_vector(7 downto 0);
  signal debug_r3 : std_logic_vector(7 downto 0);

begin 

  DUT: entity work.register_file 
    port map (
    
    clk => clk,
    reset => reset,
    we => we,

    read_addr1 => read_addr1,
    read_addr2 => read_addr2,

    write_addr => write_addr,
    write_data => write_data,

    read_data1 => read_data1,
    read_data2 => read_data2,
    debug_r3 => open
         );

  clk <= not clk after 5 ns;

  stimulus: process 
  begin 

    -- Test 1 : reset
    reset <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;

    reset <= '0';

    read_addr1 <= "000";
    read_addr2 <= "001";
    wait for 1 ns;

    assert read_data1 = x"00" and read_data2 = x"00"
      report "Reset test failed"
      severity error;

    --Test 2 
    we <= '1';
    write_addr <= "011";
    write_data <= x"19";

    wait until rising_edge(clk);
    wait for 1 ns;

    assert read_data1 = x"00"
      report "unexpected change in r0"
      severity error;


    --test 3 
    we <= '0';
    read_addr1 <= "011";
    wait for 1 ns;

    assert read_data1 = x"19"
      report "REad R3 failed"
      severity error;

    -- test 4 : write 100 into R5
    we <= '1';
    write_addr <= "101";
    write_data <= x"64";

    wait until rising_edge(clk);
    wait for 1 ns;

    -- test 5 : simultanous read 
    we <= '0';
    read_addr1 <= "011";
    read_addr2 <= "101";
    wait for 1 ns;

    assert read_data1 = x"19" and read_data2 = x"64"
      report "Dual read test failed"
      severity error;

    -- test 6 : writing disabled 
    we <= '0';
    write_addr <= "011";
    write_data <= x"64";

    wait until rising_edge(clk);
    wait for 1 ns;

    assert read_data1 = x"19"
      report "Write enable test failed"
      severity error;

    report "All register file tests passed!!!"
    severity note;

    wait;

  end process;

end architecture sim;


