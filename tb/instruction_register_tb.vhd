

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register_tb is 
end entity instruction_register_tb;

architecture sim of instruction_register_tb is 

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal load_en : std_logic := '0';

  signal instruction_in : std_logic_vector(15 downto 0) := (others => '0');
  signal instruction_out : std_logic_vector(15 downto 0);

begin 

  DUT: entity work.instruction_register 
    port map(
    
    clk => clk,
    reset => reset,
    load_en => load_en,
    instruction_in => instruction_in,
    instruction_out => instruction_out
            );

  clk <= not clk after 5 ns;

  stimulus: process 
  begin

    -- test 1 : reset 
    reset <= '1';

    wait until rising_edge(clk);
    wait for 1 ns;

    assert instruction_out = x"0000"
      report "reset test failed"
      severity error;

    reset <= '0';

    -- test 2 : load instruction 
    load_en <= '1';
    instruction_in <= x"3A20";

    wait until rising_edge(clk);
    wait for 1 ns;

    assert instruction_out = x"3A20"
      report "load instruction test failed"
      severity error;

      -- test 3 : hold instruction 
      load_en <= '0';
      instruction_in <= x"FFFF";

      wait until rising_edge(clk);
      wait for 1 ns;

      assert instruction_out = x"3A20"
        report "Hold instruction test failed"
        severity error;

      -- Test 4 : load new instruction 
      load_en <= '1';
      instruction_in <= x"A515";

      wait until rising_edge(clk);
      wait for 1 ns;

      assert instruction_out = x"A515"
        report "New instruction test failed"
        severity error;

      -- test 5 : reset again
      reset <= '1';

      wait until rising_edge(clk);
      wait for 1 ns;

      assert instruction_out = x"0000"
        report "Second reset test failed"
        severity error;

      report "All instructions registers test passed !!"
        severity note;

      wait;

    end process;

end architecture sim;

