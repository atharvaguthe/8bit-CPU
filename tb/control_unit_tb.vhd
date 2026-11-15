

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit_tb is 
  end control_unit_tb;

architecture sim of control_unit_tb is 

  signal clk : std_logic := '0';
  signal reset : std_logic := '0';

  signal opcode : std_logic_vector(2 downto 0) := "000";

  signal ir_load : std_logic;
  signal pc_enable : std_logic;
  signal pc_load : std_logic;
  signal reg_write : std_logic;
  signal load_imm : std_logic;
  signal halt : std_logic;

begin 

  uut: entity work.control_unit 
    port map (

    clk => clk,
    reset => reset,
    opcode => opcode,
    ir_load => ir_load,
    pc_enable => pc_enable,
    reg_write => reg_write,
    load_imm => load_imm,
    halt => halt
             );

  -- 10 ns clock
  clk <= not clk after 5 ns;
  stimulus: process 
  begin

    -- reset
    reset <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;

    assert ir_load = '1' and pc_enable = '1'
    report "FETCH state failed"
    severity error;

    reset <= '0';

    -- Decode :add 
    wait until rising_edge(clk);
    wait for 1 ns;

    assert ir_load = '0' and pc_enable = '0' and reg_write = '0'
    report "DECODE state failed"
    severity error;

    -- EXECUTE 
    wait until rising_edge(clk);
    wait for 1 ns;

    assert reg_write = '0'
    report "EXECUTE state failed"
    severity error;

    -- WRTITEBACK 
    wait until rising_edge(clk);
    wait for 1 ns;

    assert reg_write = '1'
    report "WRTITEBACK state failed"
    severity error;

    -- back to FETCH
    wait until rising_edge(clk);
    wait for 1 ns;

    assert ir_load = '1' and pc_enable = '1'
    report "return to FETCH state failed"
    severity error;

    -- LOAD instruction
    opcode <= "101";
    wait until rising_edge(clk);
    wait for 1 ns;

    --DECODE
    wait until rising_edge(clk);
    wait for 1 ns;

    --LOAD state
    assert load_imm = '1' and reg_write = '1'
    report "LOAD state failed"
    severity error;

    -- REturn to FETCH
    wait until rising_edge(clk);
    wait for 1 ns;

    assert ir_load = '1'
    report "LOAD return to FETCH state failed"
    severity error;

    --JUMP
    opcode <= "110";

    wait until rising_edge(clk);
    wait for 1 ns;

    -- DECODE
    wait until rising_edge(clk);
    wait for 1 ns;

    -- JUMP state 
    assert pc_load = '1' and reg_write = '0'
    report "JUMP state failed"
    severity error;

    -- Return to fetch
    wait until rising_edge(clk);
    wait for 1 ns;

    assert ir_load = '1'
    report "JUMP return to fetch state failed"
    severity error;

    -- HALT instruction
    opcode <= "111";

    wait until rising_edge(clk);
    wait for 1 ns;

    -- DECODE
    wait until rising_edge(clk);
    wait for 1 ns;

    --HALTED state
    assert halt = '1'
    report "HALT state failed"
    severity error;

    -- check if halt is active
    wait until rising_edge(clk);
    wait for 1 ns;

    assert halt = '1'
    report "HALT persistance failed"
    severity error;

    report "all tests passed" severity note;

    wait;

  end process;

end sim;
