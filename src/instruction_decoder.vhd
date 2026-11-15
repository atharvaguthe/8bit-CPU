
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_decoder is 
  port (

    instruction : in std_logic_vector(15 downto 0);

    opcode : out std_logic_vector(2 downto 0);
    rd : out std_logic_vector(2 downto 0);
    rs1 : out std_logic_vector(2 downto 0);
    rs2 : out std_logic_vector(2 downto 0);
    immediate : out std_logic_vector(6 downto 0);

    alu_op : out std_logic_vector(2 downto 0);
    
    reg_write : out std_logic;
    load_imm : out std_logic;
    jump : out std_logic;
    halt : out std_logic
       );
end instruction_decoder;

architecture RTL of instruction_decoder is 

begin

  --Extract instruction fields
  opcode <= instruction(15 downto 13);
  rd <= instruction(12 downto 10);
  rs1 <= instruction(9 downto 7);
  rs2 <= instruction(6 downto 4);
  immediate <= instruction(6 downto 0);

  process(all)
  begin 

    --Default values 
    alu_op <= "000";
    reg_write <= '0';
    load_imm <= '0';
    jump <= '0';
    halt <= '0';

    case instruction(15 downto 13) is 

      when "000" => --Add
        alu_op <= "000";
        reg_write <= '1';

      when "001" => --sub
        alu_op <= "001";
        reg_write <= '1';

      when "010" => --And 
        alu_op <= "010";
        reg_write <= '1';

      when "011" => --or
        alu_op <= "011";
        reg_write <= '1';

      when "100" => --xor
        alu_op <= "100";
        reg_write <= '1';

      when "101" => --load immediate
        load_imm <= '1';
        reg_write <= '1';

      when "110" => --jmp
        jump <= '1';

      when "111" => --halt
        halt <= '1';

      when others =>
        null;

    end case;
  end process;
end RTL;
