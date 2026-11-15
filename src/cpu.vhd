

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu is 
  Port (

  clk : in std_logic;
  reset : in std_logic;

  halted : out std_logic;
  pc_debug : out std_logic_vector(7 downto 0);
  instruction_debug : out std_logic_vector(15 downto 0);
  r3_debug : out std_logic_vector(7 downto 0)
       );
end cpu;

architecture STRUCTURAL of cpu is 

  --Program counter 
  signal pc_current : std_logic_vector(7 downto 0);
  -- Instruction memory
  signal rom_instruction : std_logic_vector(15 downto 0);
  --Instruction register
  signal ir_instruction : std_logic_vector(15 downto 0);
  
  --Decoder outputs 
  signal opcode : std_logic_vector(2 downto 0);
  signal rd : std_logic_vector(2 downto 0);
  signal rs1 : std_logic_vector(2 downto 0);
  signal rs2 : std_logic_vector(2 downto 0);
  signal immediate : std_logic_vector(6 downto 0);

  signal alu_op : std_logic_vector(2 downto 0);
  signal decoder_write : std_logic;
  signal decoder_load : std_logic;
  signal decoder_jump : std_logic;
  signal decoder_halt : std_logic;

  --Regiseter files
  signal reg_data1 : std_logic_vector(7 downto 0);
  signal reg_data2 : std_logic_vector(7 downto 0);
  signal write_data : std_logic_vector(7 downto 0);
  signal reg3_debug : std_logic_vector(7 downto 0);

  --ALU 
  signal alu_result : std_logic_vector(7 downto 0);
  signal alu_zero : std_logic;
  signal alu_carry : std_logic;

  --Control unit 
  signal ir_load : std_logic;
  signal pc_enable : std_logic;
  signal pc_load : std_logic;
  signal cu_write : std_logic;
  signal cu_load : std_logic;
  signal cu_halt : std_logic;

  --Combined register write enable 
  signal actual_reg_write : std_logic;

begin

  --------------------------------------- 
  --1. Program counter
  --------------------------------------- 

  PC: entity work.program_counter 
    port map (

    clk => clk,
    reset => reset,
    enable => pc_enable,
    pc_load => pc_load,
    load_addr => '0' & immediate,
    pc_out => pc_current
             );

  --------------------------------------- 
  --2. Instruction memory
  --------------------------------------- 

    IMEM: entity work.instruction_memory
      port map(
      address => pc_current,
      instruction => rom_instruction
              );

  --------------------------------------- 
  --3. Instruction register
  --------------------------------------- 
  IR: entity work.instruction_register 
    port map (

    clk => clk,
    reset => reset,
    load_en => ir_load,
    instruction_in => rom_instruction,
    instruction_out => ir_instruction
             );

  --------------------------------------- 
  --4. Instruction decoder
  --------------------------------------- 
  DECODER: entity work.instruction_decoder 
    port map (

    instruction => ir_instruction,

    opcode => opcode,
    rd => rd,
    rs1 => rs1,
    rs2 => rs2,
    immediate => immediate,

    alu_op => alu_op,

    reg_write => decoder_write,
    load_imm => decoder_load,
    jump => decoder_jump,
    halt => decoder_halt
             );

  --------------------------------------- 
  --5. Regiseter file
  --------------------------------------- 
  RF: entity work.register_file 
    port map (

    clk => clk,
    reset => reset,
    we => actual_reg_write,

    read_addr1 => rs1,
    read_addr2 => rs2,

    write_addr => rd,
    write_data => write_data,

    read_data1 => reg_data1,
    read_data2 => reg_data2,
    debug_r3 => reg3_debug
             );

  --------------------------------------- 
  --6. ALU
  --------------------------------------- 
  ALU_UNIT: entity work.alu 
    port map (

    a => reg_data1,
    b => reg_data2,
    alu_op => alu_op,

    result => alu_result,
    zero => alu_zero,
    carry => alu_carry
  );

  --------------------------------------- 
  --7. Control unit
  --------------------------------------- 
  CU: entity work.control_unit 
    port map (

    clk => clk,
    reset => reset,
    opcode => opcode,

    ir_load => ir_load,
    pc_enable => pc_enable,
    pc_load => pc_load,

    reg_write => cu_write,
    load_imm => cu_load,

    halt => cu_halt
  );

  --------------------------------------- 
  --8. writeback logic
  --------------------------------------- 
  actual_reg_write <= cu_write and decoder_write;

  write_data <= ('0' & immediate) when cu_load = '1' else alu_result;

  --------------------------------------- 
  --9. debug outputs
  --------------------------------------- 
  halted <= cu_halt;
  pc_debug <= pc_current;
  instruction_debug <= ir_instruction;
  r3_debug <= reg3_debug;

end STRUCTURAL;
