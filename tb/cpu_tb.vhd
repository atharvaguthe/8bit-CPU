

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.all;

entity cpu_tb is 
  end cpu_tb;

architecture sim of cpu_tb is 

  signal clk : std_logic := '0';
  signal reset : std_logic := '1';

  signal halted : std_logic;
  signal pc_debug : std_logic_vector(7 downto 0);
  signal instruction_debug : std_logic_vector(15 downto 0);
  signal r3_debug : std_logic_vector(7 downto 0);

begin 

  uut: entity work.cpu 
    port map (

    clk => clk,
    reset => reset,
    halted => halted,
    pc_debug => pc_debug,
    instruction_debug => instruction_debug,
    r3_debug => r3_debug
             );

  clk <= not clk after 5 ns;

  stimulus: process 
  begin 

    report "Starting CPU simulations..." severity note;

    --Keep CPU in reset for 20 ns 
    wait for 20 ns;
    reset <= '0';

    report "CPU reset released. executing program..." severity note;

    -- wait for halt 
    wait until halted = '1';
    wait for 1 ns;

    --verify r3 
    assert r3_debug = x"1E"
    report "CPU failed : r3 not 30"
    severity failure;

    report "success cpu executed the program correctly!!!"
    severity note;

    stop;
    wait;

  end process;


  timout: process
  begin
    wait for 1000 ns;

    assert halted = '1'
    report "timeout"
    severity failure;

    wait;

  end process;

end sim;


