

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tb is
end entity alu_tb;

architecture sim of alu_tb is 

  signal a : std_logic_vector(7 downto 0);
  signal b : std_logic_vector(7 downto 0);
  signal alu_op : std_logic_vector(2 downto 0);

  signal result : std_logic_vector(7 downto 0);
  signal zero : std_logic;
  signal carry : std_logic;

begin

  DUT: entity work.alu 
    port map (
      a => a,
      b => b,
      alu_op => alu_op,
      result => result,
      zero => zero,
      carry => carry
    );

  stimulus: process 
  begin 

    -- Test 1 : add 
    a <= x"0A";
    b <= x"14";
    alu_op <= "000";
    wait for 10 ns;

    assert result = x"1E" and zero = '0' and carry = '0'
      report "ADD test failed"
      severity error;

    --Test 2 : carry 
    a <= x"FF";
    b <= x"01";
    alu_op <= "000";
    wait for 10 ns;

    assert result = x"00" and zero = '1' and carry = '1'
      report "ADD carry test failed"
      severity error;

    -- Test 3 : sub 
    a <= x"14";
    b <= x"0A";
    alu_op <= "001";
    wait for 10 ns;

    assert result = x"0A" and zero = '0' and carry = '0'
      report "SUB test failed"
      severity error;


    -- Test 4 : sub borrow
    a <= x"0A";
    b <= x"14";
    alu_op <= "001";
    wait for 10 ns;

    assert result = x"F6" and zero = '0' and carry = '1'
      report "SUB borrow test failed"
      severity error;

    -- Test 5 : AND 
    a <= x"0A";
    b <= x"0C";
    alu_op <= "010";
    wait for 10 ns;

    assert result = x"08" and carry = '0'
      report "AND test failed"
      severity error;

    -- Test 6 : OR 
    a <= x"0A";
    b <= x"0C";
    alu_op <= "011";
    wait for 10 ns;

    assert result = x"0E" and carry = '0'
      report "0R test failed"
      severity error;

    -- Test 7 : XOR 
    a <= x"0A";
    b <= x"0C";
    alu_op <= "100";
    wait for 10 ns;

    assert result = x"06" and carry = '0'
      report "X0R test failed"
      severity error;

    -- Test 8 : NOt 
    a <= x"0A";
    alu_op <= "101";
    wait for 10 ns;

    assert result = x"F5" and carry = '0'
      report "NOT test failed"
      severity error;

    -- Test 9 : shift left 
    a <= x"80";
    alu_op <= "110";
    wait for 10 ns;

    assert result = x"00" and carry = '1' and zero = '1'
      report "Shift left test failed"
      severity error;

    -- Test 10 : shift right 
    a <= x"05";
    alu_op <= "111";
    wait for 10 ns;

    assert result = x"02" and carry = '1' and zero = '0'
      report "Shift right test failed"
      severity error;

    report "ALL alu test passed!!!!" severity note;

    wait;
  end process;
end architecture sim;
