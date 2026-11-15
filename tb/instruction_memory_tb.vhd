

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_memory_tb is 
  end instruction_memory_tb;

architecture sim of instruction_memory_tb is 
  signal address : std_logic_vector(7 downto 0) := (others => '0');
  signal instruction : std_logic_vector(15 downto 0);

begin 

  uut: entity work.instruction_memory 
    port map (
    
    address => address,
    instruction => instruction
             );

  stimulus: process 
  begin

    -- Test 1: address 0 - load R1, 10
    address <= x"00";
    wait for 10 ns;
    
    assert instruction = "1010010000001010"
    report "ROM address 0 failed"
    severity error;

    -- Test 2: address 1 - load R2, 20
    address <= x"01";
    wait for 10 ns;

    assert instruction = "1010100000010100"
    report "Rom address 1 failed"
    severity error;

    -- Test 3: address 2 - load R3, R1,R2
    address <= x"02";
    wait for 10 ns;

    assert instruction = "0000110010100000"
    report "Rom address 2 failed"
    severity error;

    -- Test 4: address 3 halt
    address <= x"03";
    wait for 10 ns;

    assert instruction = "1110000000000000"
    report "Rom address 3 failed"
    severity error;

    -- Test 5: unused address halt
    address <= x"10";
    wait for 10 ns;

    assert instruction = "1110000000000000"
    report "Rom default value failed"
    severity error;

    report "all instruction memory test passed" severity note;

    wait;

  end process;

end sim;
