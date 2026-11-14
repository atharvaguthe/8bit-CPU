

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter_tb is
end entity program_counter_tb;

architecture sim of program_counter_tb is 

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal enable : std_logic := '0';

  signal pc_load : std_logic := '0';
  signal load_addr : std_logic_vector(7 downto 0) := x"00";

  signal pc_out : std_logic_vector(7 downto 0);

begin

  DUT: entity work.program_counter 
    port map (

    clk => clk,
    reset => reset,
    enable => enable,
    pc_load => pc_load,
    load_addr => load_addr,
    pc_out => pc_out
             );

  clk <= not clk after 5 ns;

  stimulus: process 
  begin
    
    -- Test 1 : reset
    reset <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"00"
      report "Reset test failed"
      severity error;

    reset <= '0';

    -- Test 2 : increment 
    enable <= '1';

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"01"
      report "increment test 1 failed"
      severity error;

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"02"
      report "increment test 2 failed"
      severity error;

    -- Test 3 : hold 
    enable <= '0';

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"02"
      report "hold test failed"
      severity error;

    -- Test 4 : load address 
    pc_load <= '1';
    load_addr <= x"28";

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"28"
      report "load test failed"
      severity error;

    -- Test 5 : increment after load 
    pc_load <= '0';
    enable <= '1';

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"29"
      report "Post load increment failed"
      severity error;

    -- Test 6 : load priority 
    pc_load <= '1';
    load_addr <= x"40";

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"40"
      report "Load priority test failed"
      severity error;

    -- Test 7 : Overflow 
    pc_load <= '1';
    load_addr <= x"FF";

    wait until rising_edge(clk);
    wait for 1 ns;

    pc_load <= '0';
    enable <= '1';

    wait until rising_edge(clk);
    wait for 1 ns;

    assert pc_out = x"00"
      report "Overflow test failed"
      severity error;


    report "All program counter tests passed !!!"
      severity note;

    wait;

  end process;

end architecture sim;
