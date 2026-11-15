

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is 
  Port (

  clk : in std_logic;
  reset : in std_logic;

  opcode : in std_logic_vector(2 downto 0);

  ir_load : out std_logic;
  pc_enable : out std_logic;
  pc_load : out std_logic;

  reg_write : out std_logic;
  load_imm : out std_logic;

  halt : out std_logic
       );

end control_unit;

architecture FSM of control_unit is 

  type state_type is (
    FETCH,
    DECODE,
    EXECUTE,
    WRITEBACK,
    LOAD,
    JUMP,
    HALTED);

    signal current_state : state_type := FETCH;
    signal next_state : state_type := FETCH;

begin 

  -- Sequential state reg_write
  process(clk)
  begin
    if rising_edge(clk) then 
      if reset = '1' then 
        current_state <= FETCH;

      else 
        current_state <= next_state;
      end if;

    end if;

  end process;

  process(all)
  begin

    next_state <= current_state;

    case current_state is 

      when FETCH =>
        next_state <= DECODE;

      when DECODE =>

        case opcode is 

          when "000" | "001" |
               "010" | "011" |
               "100" =>
                 next_state <= EXECUTE;

          when "101" =>
            next_state <= LOAD;

          when "110" =>
            next_state <= JUMP;
      
          when "111" =>
            next_state <= HALTED;

          when others =>
            next_state <= HALTED;

        end case;

      when EXECUTE =>
        next_state <= WRITEBACK;

      when WRITEBACK =>
        next_state <= FETCH;

      when LOAD =>
        next_state <= FETCH;

      when JUMP =>
        next_state <= FETCH;

      when HALTED =>
        next_state <= HALTED;

    end case;

  end process;

  --OUtput logic 
  process(all)
  begin

    --Default control signal
    ir_load <= '0';
    pc_enable <= '0';
    pc_load <= '0';

    reg_write <= '0';
    load_imm <= '0';

    halt <= '0';

    case current_state is 
      when FETCH =>
        ir_load <= '1';
        pc_enable <= '1';

      when WRITEBACK =>
        reg_write <= '1';

      when LOAD =>
        reg_write <= '1';
        load_imm <= '1';

      when JUMP =>
        pc_load <= '1';

      when HALTED =>
        halt <= '1';

      when others =>
        null;

    end case;

  end process;

end FSM;
