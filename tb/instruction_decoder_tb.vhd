

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_decoder_tb is 
end instruction_decoder_tb;

architecture sim of instruction_decoder_tb is 

  signal instruction : std_logic_vector(15 downto 0) := (others => '0');

  signal opcode : std_logic_vector(2 downto 0);
  signal rd : std_logic_vector(2 downto 0);
  signal rs1 : std_logic_vector(2 downto 0);
  signal rs2 : std_logic_vector(2 downto 0);
  signal immediate : std_logic_vector(6 downto 0);

  signal alu_op : std_logic_vector(2 downto 0);

  signal reg_write : std_logic;
  signal load_imm : std_logic;
  signal jump : std_logic;
  signal halt : std_logic;

begin 

  uut: entity work.instruction_decoder 
    port map (
      
    instruction => instruction,

    opcode => opcode,
    rd => rd,
    rs1 => rs1,
    rs2 => rs2,
    immediate => immediate,

    alu_op => alu_op,

    reg_write => reg_write,
    load_imm => load_imm,
    jump => jump,
    halt => halt
             );

  stimulus: process 
  begin

    --Test 1 : add r1,r2,r3
    instruction <= "0000010100110000";
    wait for 10 ns;

    assert opcode = "000" and rd = "001" and rs1 = "010"
      and rs2 = "011" and alu_op = "000" and reg_write = '1'
      and load_imm = '0' and jump = '0' and halt = '0'
    report "Add test failed"
    severity error;

    -- Test 2 : sub
    instruction <= "0010111001000000";
    wait for 10 ns;
    
    assert alu_op = "001" and reg_write = '1'
    report "sub test failed"
    severity error;

    -- Test 3 : and
    instruction <= "0100010000100000";
    wait for 10 ns;
    
    assert alu_op = "010" and reg_write = '1'
    report "and test failed"
    severity error;

    -- Test 4 : or
    instruction <= "0110010000100000";
    wait for 10 ns;
    
    assert alu_op = "011" and reg_write = '1'
    report "or test failed"
    severity error;
    
    -- Test 5 : xor
    instruction <= "1000010000100000";
    wait for 10 ns;
    
    assert alu_op = "100" and reg_write = '1'
    report "or test failed"
    severity error;

    --Test 6 : load r2, immediate 42
    instruction <= "1010100010101010";
    wait for 10 ns;

    assert rd = "010" and immediate = "0101010" and
      load_imm = '1' and reg_write = '1'
    report "load test failed"
    severity error;

    --Test 7 : Jmp address 20
    instruction <="1100000000010100";
    wait for 10 ns;

    assert immediate = "0010100" and jump = '1' and
      reg_write = '0'
    report "jmp test failed"
    severity error;

    -- test 8 : halt
    instruction <= "1110000000000000";
    wait for 10 ns;

    assert halt = '1' and reg_write = '0' and jump = '0'
    report "halt test failed"
    severity error;

    report "all instruction decoder tests passed" severity note;

    wait;

  end process;

end sim;

