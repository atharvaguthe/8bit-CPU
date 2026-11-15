library IEEE;
use IEEE.std_logic_1164.all;
entity cpu is
  port (
    clk: in std_logic;
    reset: in std_logic;
    halted: out std_logic;
    pc_debug: out std_logic_vector (7 downto 0);
    instruction_debug: out std_logic_vector (15 downto 0);
    r3_debug: out std_logic_vector (7 downto 0)
  );
end cpu;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_Bfsm is
  port (
    clk : in std_logic;
    reset : in std_logic;
    opcode : in std_logic_vector (2 downto 0);
    ir_load : out std_logic;
    pc_enable : out std_logic;
    pc_load : out std_logic;
    reg_write : out std_logic;
    load_imm : out std_logic;
    halt : out std_logic);
end entity control_unit_Bfsm;

architecture rtl of control_unit_Bfsm is
  signal current_state : std_logic_vector (2 downto 0);
  signal next_state : std_logic_vector (2 downto 0);
  signal n279 : std_logic_vector (2 downto 0);
  signal n285 : std_logic;
  signal n287 : std_logic;
  signal n289 : std_logic;
  signal n290 : std_logic;
  signal n292 : std_logic;
  signal n293 : std_logic;
  signal n295 : std_logic;
  signal n296 : std_logic;
  signal n298 : std_logic;
  signal n299 : std_logic;
  signal n301 : std_logic;
  signal n303 : std_logic;
  signal n305 : std_logic;
  signal n306 : std_logic_vector (3 downto 0);
  signal n312 : std_logic_vector (2 downto 0);
  signal n314 : std_logic;
  signal n316 : std_logic;
  signal n318 : std_logic;
  signal n320 : std_logic;
  signal n322 : std_logic;
  signal n324 : std_logic;
  signal n325 : std_logic_vector (6 downto 0);
  signal n333 : std_logic_vector (2 downto 0);
  signal n338 : std_logic;
  signal n340 : std_logic;
  signal n342 : std_logic;
  signal n344 : std_logic;
  signal n346 : std_logic;
  signal n347 : std_logic_vector (4 downto 0);
  signal n350 : std_logic;
  signal n354 : std_logic;
  signal n358 : std_logic;
  signal n363 : std_logic;
  signal n367 : std_logic;
  signal n371 : std_logic;
  signal n374 : std_logic_vector (2 downto 0) := "000";
begin
  ir_load <= n350;
  pc_enable <= n354;
  pc_load <= n358;
  reg_write <= n363;
  load_imm <= n367;
  halt <= n371;
  -- src/control_unit.vhd:37:12
  current_state <= n374; -- (isignal)
  -- src/control_unit.vhd:38:12
  next_state <= n333; -- (isignal)
  -- src/control_unit.vhd:46:7
  n279 <= next_state when reset = '0' else "000";
  -- src/control_unit.vhd:64:7
  n285 <= '1' when current_state = "000" else '0';
  -- src/control_unit.vhd:71:11
  n287 <= '1' when opcode = "000" else '0';
  -- src/control_unit.vhd:71:22
  n289 <= '1' when opcode = "001" else '0';
  -- src/control_unit.vhd:71:22
  n290 <= n287 or n289;
  -- src/control_unit.vhd:71:30
  n292 <= '1' when opcode = "010" else '0';
  -- src/control_unit.vhd:71:30
  n293 <= n290 or n292;
  -- src/control_unit.vhd:72:22
  n295 <= '1' when opcode = "011" else '0';
  -- src/control_unit.vhd:72:22
  n296 <= n293 or n295;
  -- src/control_unit.vhd:72:30
  n298 <= '1' when opcode = "100" else '0';
  -- src/control_unit.vhd:72:30
  n299 <= n296 or n298;
  -- src/control_unit.vhd:76:11
  n301 <= '1' when opcode = "101" else '0';
  -- src/control_unit.vhd:79:11
  n303 <= '1' when opcode = "110" else '0';
  -- src/control_unit.vhd:82:11
  n305 <= '1' when opcode = "111" else '0';
  -- src/control_unit.vhd:69:9
  n306 <= n305 & n303 & n301 & n299;
  -- src/control_unit.vhd:69:9
  with n306 select n312 <=
    "110" when "1000",
    "101" when "0100",
    "100" when "0010",
    "010" when "0001",
    "110" when others;
  -- src/control_unit.vhd:67:7
  n314 <= '1' when current_state = "001" else '0';
  -- src/control_unit.vhd:90:7
  n316 <= '1' when current_state = "010" else '0';
  -- src/control_unit.vhd:93:7
  n318 <= '1' when current_state = "011" else '0';
  -- src/control_unit.vhd:96:7
  n320 <= '1' when current_state = "100" else '0';
  -- src/control_unit.vhd:99:7
  n322 <= '1' when current_state = "101" else '0';
  -- src/control_unit.vhd:102:7
  n324 <= '1' when current_state = "110" else '0';
  -- src/control_unit.vhd:62:5
  n325 <= n324 & n322 & n320 & n318 & n316 & n314 & n285;
  -- src/control_unit.vhd:62:5
  with n325 select n333 <=
    "110" when "1000000",
    "000" when "0100000",
    "000" when "0010000",
    "000" when "0001000",
    "011" when "0000100",
    n312 when "0000010",
    "001" when "0000001",
    "XXX" when others;
  -- src/control_unit.vhd:124:7
  n338 <= '1' when current_state = "000" else '0';
  -- src/control_unit.vhd:128:7
  n340 <= '1' when current_state = "011" else '0';
  -- src/control_unit.vhd:131:7
  n342 <= '1' when current_state = "100" else '0';
  -- src/control_unit.vhd:135:7
  n344 <= '1' when current_state = "101" else '0';
  -- src/control_unit.vhd:138:7
  n346 <= '1' when current_state = "110" else '0';
  -- src/control_unit.vhd:123:5
  n347 <= n346 & n344 & n342 & n340 & n338;
  -- src/control_unit.vhd:123:5
  with n347 select n350 <=
    '0' when "10000",
    '0' when "01000",
    '0' when "00100",
    '0' when "00010",
    '1' when "00001",
    '0' when others;
  -- src/control_unit.vhd:123:5
  with n347 select n354 <=
    '0' when "10000",
    '0' when "01000",
    '0' when "00100",
    '0' when "00010",
    '1' when "00001",
    '0' when others;
  -- src/control_unit.vhd:123:5
  with n347 select n358 <=
    '0' when "10000",
    '1' when "01000",
    '0' when "00100",
    '0' when "00010",
    '0' when "00001",
    '0' when others;
  -- src/control_unit.vhd:123:5
  with n347 select n363 <=
    '0' when "10000",
    '0' when "01000",
    '1' when "00100",
    '1' when "00010",
    '0' when "00001",
    '0' when others;
  -- src/control_unit.vhd:123:5
  with n347 select n367 <=
    '0' when "10000",
    '0' when "01000",
    '1' when "00100",
    '0' when "00010",
    '0' when "00001",
    '0' when others;
  -- src/control_unit.vhd:123:5
  with n347 select n371 <=
    '1' when "10000",
    '0' when "01000",
    '0' when "00100",
    '0' when "00010",
    '0' when "00001",
    '0' when others;
  -- src/control_unit.vhd:45:5
  process (clk)
  begin
    if rising_edge (clk) then
      n374 <= n279;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_Brtl is
  port (
    a : in std_logic_vector (7 downto 0);
    b : in std_logic_vector (7 downto 0);
    alu_op : in std_logic_vector (2 downto 0);
    result : out std_logic_vector (7 downto 0);
    zero : out std_logic;
    carry : out std_logic);
end entity alu_Brtl;

architecture rtl of alu_Brtl is
  signal n208 : std_logic_vector (8 downto 0);
  signal n210 : std_logic_vector (8 downto 0);
  signal n211 : std_logic_vector (8 downto 0);
  signal n212 : std_logic_vector (7 downto 0);
  signal n213 : std_logic;
  signal n215 : std_logic;
  signal n217 : std_logic_vector (8 downto 0);
  signal n219 : std_logic_vector (8 downto 0);
  signal n220 : std_logic_vector (8 downto 0);
  signal n221 : std_logic_vector (7 downto 0);
  signal n222 : std_logic;
  signal n225 : std_logic;
  signal n227 : std_logic;
  signal n228 : std_logic_vector (7 downto 0);
  signal n230 : std_logic;
  signal n231 : std_logic_vector (7 downto 0);
  signal n233 : std_logic;
  signal n234 : std_logic_vector (7 downto 0);
  signal n236 : std_logic;
  signal n237 : std_logic_vector (7 downto 0);
  signal n239 : std_logic;
  signal n241 : std_logic_vector (7 downto 0);
  signal n242 : std_logic;
  signal n244 : std_logic;
  signal n246 : std_logic_vector (7 downto 0);
  signal n247 : std_logic;
  signal n249 : std_logic;
  signal n250 : std_logic_vector (7 downto 0);
  signal n253 : std_logic;
  signal n259 : std_logic_vector (7 downto 0);
  signal n262 : std_logic;
  signal n265 : std_logic;
begin
  result <= n259;
  zero <= n265;
  carry <= n253;
  -- src/alu.vhd:39:22
  n208 <= '0' & a;
  -- src/alu.vhd:39:44
  n210 <= '0' & b;
  -- src/alu.vhd:39:37
  n211 <= std_logic_vector (unsigned (n208) + unsigned (n210));
  -- src/alu.vhd:41:20
  n212 <= n211 (7 downto 0);
  -- src/alu.vhd:42:22
  n213 <= n211 (8);
  -- src/alu.vhd:38:7
  n215 <= '1' when alu_op = "000" else '0';
  -- src/alu.vhd:46:22
  n217 <= '0' & a;
  -- src/alu.vhd:46:44
  n219 <= '0' & b;
  -- src/alu.vhd:46:37
  n220 <= std_logic_vector (unsigned (n217) - unsigned (n219));
  -- src/alu.vhd:48:20
  n221 <= n220 (7 downto 0);
  -- src/alu.vhd:50:24
  n222 <= '1' when unsigned (a) < unsigned (b) else '0';
  -- src/alu.vhd:50:9
  n225 <= '0' when n222 = '0' else '1';
  -- src/alu.vhd:45:7
  n227 <= '1' when alu_op = "001" else '0';
  -- src/alu.vhd:56:27
  n228 <= a and b;
  -- src/alu.vhd:55:7
  n230 <= '1' when alu_op = "010" else '0';
  -- src/alu.vhd:60:27
  n231 <= a or b;
  -- src/alu.vhd:59:7
  n233 <= '1' when alu_op = "011" else '0';
  -- src/alu.vhd:64:27
  n234 <= a xor b;
  -- src/alu.vhd:63:7
  n236 <= '1' when alu_op = "100" else '0';
  -- src/alu.vhd:68:25
  n237 <= not a;
  -- src/alu.vhd:67:7
  n239 <= '1' when alu_op = "101" else '0';
  -- src/alu.vhd:72:16
  n241 <= std_logic_vector (shift_left (unsigned (a), to_integer (unsigned'("0000000000000000000000000000001"))));
  -- src/alu.vhd:73:19
  n242 <= a (7);
  -- src/alu.vhd:71:7
  n244 <= '1' when alu_op = "110" else '0';
  -- src/alu.vhd:77:16
  n246 <= std_logic_vector (shift_right (unsigned (a), to_integer(unsigned'("0000000000000000000000000000001"))));
  -- src/alu.vhd:78:19
  n247 <= a (0);
  -- src/alu.vhd:76:7
  n249 <= '1' when alu_op = "111" else '0';
  -- src/alu.vhd:35:5
  n250 <= n249 & n244 & n239 & n236 & n233 & n230 & n227 & n215;
  -- src/alu.vhd:35:5
  with n250 select n253 <=
    n247 when "10000000",
    n242 when "01000000",
    '0' when "00100000",
    '0' when "00010000",
    '0' when "00001000",
    '0' when "00000100",
    n225 when "00000010",
    n213 when "00000001",
    '0' when others;
  -- src/alu.vhd:35:5
  with n250 select n259 <=
    n246 when "10000000",
    n241 when "01000000",
    n237 when "00100000",
    n234 when "00010000",
    n231 when "00001000",
    n228 when "00000100",
    n221 when "00000010",
    n212 when "00000001",
    "00000000" when others;
  -- src/alu.vhd:88:12
  n262 <= '1' when n259 = "00000000" else '0';
  -- src/alu.vhd:88:5
  n265 <= '0' when n262 = '0' else '1';
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file_Brtl is
  port (
    clk : in std_logic;
    reset : in std_logic;
    we : in std_logic;
    read_addr1 : in std_logic_vector (2 downto 0);
    read_addr2 : in std_logic_vector (2 downto 0);
    write_addr : in std_logic_vector (2 downto 0);
    write_data : in std_logic_vector (7 downto 0);
    read_data1 : out std_logic_vector (7 downto 0);
    read_data2 : out std_logic_vector (7 downto 0);
    debug_r3 : out std_logic_vector (7 downto 0));
end entity register_file_Brtl;

architecture rtl of register_file_Brtl is
  signal regs : std_logic_vector (63 downto 0);
  signal n143 : std_logic_vector (2 downto 0);
  signal n146 : std_logic_vector (63 downto 0);
  signal n148 : std_logic_vector (63 downto 0);
  signal n153 : std_logic_vector (2 downto 0);
  signal n158 : std_logic_vector (2 downto 0);
  signal n161 : std_logic_vector (7 downto 0);
  signal n162 : std_logic_vector (63 downto 0);
  signal n163 : std_logic;
  signal n164 : std_logic;
  signal n165 : std_logic;
  signal n166 : std_logic;
  signal n167 : std_logic;
  signal n168 : std_logic;
  signal n169 : std_logic;
  signal n170 : std_logic;
  signal n171 : std_logic;
  signal n172 : std_logic;
  signal n173 : std_logic;
  signal n174 : std_logic;
  signal n175 : std_logic;
  signal n176 : std_logic;
  signal n177 : std_logic;
  signal n178 : std_logic;
  signal n179 : std_logic;
  signal n180 : std_logic;
  signal n181 : std_logic_vector (7 downto 0);
  signal n182 : std_logic_vector (7 downto 0);
  signal n183 : std_logic_vector (7 downto 0);
  signal n184 : std_logic_vector (7 downto 0);
  signal n185 : std_logic_vector (7 downto 0);
  signal n186 : std_logic_vector (7 downto 0);
  signal n187 : std_logic_vector (7 downto 0);
  signal n188 : std_logic_vector (7 downto 0);
  signal n189 : std_logic_vector (7 downto 0);
  signal n190 : std_logic_vector (7 downto 0);
  signal n191 : std_logic_vector (7 downto 0);
  signal n192 : std_logic_vector (7 downto 0);
  signal n193 : std_logic_vector (7 downto 0);
  signal n194 : std_logic_vector (7 downto 0);
  signal n195 : std_logic_vector (7 downto 0);
  signal n196 : std_logic_vector (7 downto 0);
  signal n197 : std_logic_vector (63 downto 0);
  signal n198 : std_logic_vector (7 downto 0);
  signal n199 : std_logic_vector (7 downto 0);
begin
  read_data1 <= n198;
  read_data2 <= n199;
  debug_r3 <= n161;
  -- src/register_file.vhd:33:10
  regs <= n162; -- (signal)
  -- src/register_file.vhd:46:14
  n143 <= std_logic_vector (unsigned'("111") - unsigned (write_addr));
  -- src/register_file.vhd:45:7
  n146 <= regs when we = '0' else n197;
  -- src/register_file.vhd:43:7
  n148 <= n146 when reset = '0' else "0000000000000000000000000000000000000000000000000000000000000000";
  -- src/register_file.vhd:54:22
  n153 <= std_logic_vector (unsigned'("111") - unsigned (read_addr1));
  -- src/register_file.vhd:56:22
  n158 <= std_logic_vector (unsigned'("111") - unsigned (read_addr2));
  -- src/register_file.vhd:58:19
  n161 <= regs (39 downto 32);
  -- src/register_file.vhd:41:5
  process (clk)
  begin
    if rising_edge (clk) then
      n162 <= n148;
    end if;
  end process;
  -- src/register_file.vhd:46:9
  n163 <= n143 (2);
  -- src/register_file.vhd:46:9
  n164 <= not n163;
  -- src/register_file.vhd:46:9
  n165 <= n143 (1);
  -- src/register_file.vhd:46:9
  n166 <= not n165;
  -- src/register_file.vhd:46:9
  n167 <= n164 and n166;
  -- src/register_file.vhd:46:9
  n168 <= n164 and n165;
  -- src/register_file.vhd:46:9
  n169 <= n163 and n166;
  -- src/register_file.vhd:46:9
  n170 <= n163 and n165;
  -- src/register_file.vhd:46:9
  n171 <= n143 (0);
  -- src/register_file.vhd:46:9
  n172 <= not n171;
  -- src/register_file.vhd:46:9
  n173 <= n167 and n172;
  -- src/register_file.vhd:46:9
  n174 <= n167 and n171;
  -- src/register_file.vhd:46:9
  n175 <= n168 and n172;
  -- src/register_file.vhd:46:9
  n176 <= n168 and n171;
  -- src/register_file.vhd:46:9
  n177 <= n169 and n172;
  -- src/register_file.vhd:46:9
  n178 <= n169 and n171;
  -- src/register_file.vhd:46:9
  n179 <= n170 and n172;
  -- src/register_file.vhd:46:9
  n180 <= n170 and n171;
  -- src/register_file.vhd:46:9
  n181 <= regs (7 downto 0);
  -- src/register_file.vhd:46:9
  n182 <= n181 when n173 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n183 <= regs (15 downto 8);
  -- src/register_file.vhd:46:9
  n184 <= n183 when n174 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n185 <= regs (23 downto 16);
  -- src/register_file.vhd:46:9
  n186 <= n185 when n175 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n187 <= regs (31 downto 24);
  -- src/register_file.vhd:46:9
  n188 <= n187 when n176 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n189 <= regs (39 downto 32);
  -- src/register_file.vhd:46:9
  n190 <= n189 when n177 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n191 <= regs (47 downto 40);
  -- src/register_file.vhd:46:9
  n192 <= n191 when n178 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n193 <= regs (55 downto 48);
  -- src/register_file.vhd:46:9
  n194 <= n193 when n179 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n195 <= regs (63 downto 56);
  -- src/register_file.vhd:46:9
  n196 <= n195 when n180 = '0' else write_data;
  -- src/register_file.vhd:46:9
  n197 <= n196 & n194 & n192 & n190 & n188 & n186 & n184 & n182;
  -- src/register_file.vhd:54:22
  n198 <= regs (to_integer (unsigned (n153)) * 8 + 7 downto to_integer (unsigned (n153)) * 8);
  -- src/register_file.vhd:56:22
  n199 <= regs (to_integer (unsigned (n158)) * 8 + 7 downto to_integer (unsigned (n158)) * 8);
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_decoder_Brtl is
  port (
    instruction : in std_logic_vector (15 downto 0);
    opcode : out std_logic_vector (2 downto 0);
    rd : out std_logic_vector (2 downto 0);
    rs1 : out std_logic_vector (2 downto 0);
    rs2 : out std_logic_vector (2 downto 0);
    immediate : out std_logic_vector (6 downto 0);
    alu_op : out std_logic_vector (2 downto 0);
    reg_write : out std_logic;
    load_imm : out std_logic;
    jump : out std_logic;
    halt : out std_logic);
end entity instruction_decoder_Brtl;

architecture rtl of instruction_decoder_Brtl is
  signal n80 : std_logic_vector (2 downto 0);
  signal n81 : std_logic_vector (2 downto 0);
  signal n82 : std_logic_vector (2 downto 0);
  signal n83 : std_logic_vector (2 downto 0);
  signal n84 : std_logic_vector (6 downto 0);
  signal n87 : std_logic_vector (2 downto 0);
  signal n89 : std_logic;
  signal n91 : std_logic;
  signal n93 : std_logic;
  signal n95 : std_logic;
  signal n97 : std_logic;
  signal n99 : std_logic;
  signal n101 : std_logic;
  signal n103 : std_logic;
  signal n104 : std_logic_vector (7 downto 0);
  signal n111 : std_logic_vector (2 downto 0);
  signal n120 : std_logic;
  signal n124 : std_logic;
  signal n128 : std_logic;
  signal n132 : std_logic;
begin
  opcode <= n80;
  rd <= n81;
  rs1 <= n82;
  rs2 <= n83;
  immediate <= n84;
  alu_op <= n111;
  reg_write <= n120;
  load_imm <= n124;
  jump <= n128;
  halt <= n132;
  -- src/instruction_decoder.vhd:30:24
  n80 <= instruction (15 downto 13);
  -- src/instruction_decoder.vhd:31:20
  n81 <= instruction (12 downto 10);
  -- src/instruction_decoder.vhd:32:21
  n82 <= instruction (9 downto 7);
  -- src/instruction_decoder.vhd:33:21
  n83 <= instruction (6 downto 4);
  -- src/instruction_decoder.vhd:34:27
  n84 <= instruction (6 downto 0);
  -- src/instruction_decoder.vhd:46:21
  n87 <= instruction (15 downto 13);
  -- src/instruction_decoder.vhd:48:7
  n89 <= '1' when n87 = "000" else '0';
  -- src/instruction_decoder.vhd:52:7
  n91 <= '1' when n87 = "001" else '0';
  -- src/instruction_decoder.vhd:56:7
  n93 <= '1' when n87 = "010" else '0';
  -- src/instruction_decoder.vhd:60:7
  n95 <= '1' when n87 = "011" else '0';
  -- src/instruction_decoder.vhd:64:7
  n97 <= '1' when n87 = "100" else '0';
  -- src/instruction_decoder.vhd:68:7
  n99 <= '1' when n87 = "101" else '0';
  -- src/instruction_decoder.vhd:72:7
  n101 <= '1' when n87 = "110" else '0';
  -- src/instruction_decoder.vhd:75:7
  n103 <= '1' when n87 = "111" else '0';
  -- src/instruction_decoder.vhd:46:5
  n104 <= n103 & n101 & n99 & n97 & n95 & n93 & n91 & n89;
  -- src/instruction_decoder.vhd:46:5
  with n104 select n111 <=
    "000" when "10000000",
    "000" when "01000000",
    "000" when "00100000",
    "100" when "00010000",
    "011" when "00001000",
    "010" when "00000100",
    "001" when "00000010",
    "000" when "00000001",
    "000" when others;
  -- src/instruction_decoder.vhd:46:5
  with n104 select n120 <=
    '0' when "10000000",
    '0' when "01000000",
    '1' when "00100000",
    '1' when "00010000",
    '1' when "00001000",
    '1' when "00000100",
    '1' when "00000010",
    '1' when "00000001",
    '0' when others;
  -- src/instruction_decoder.vhd:46:5
  with n104 select n124 <=
    '0' when "10000000",
    '0' when "01000000",
    '1' when "00100000",
    '0' when "00010000",
    '0' when "00001000",
    '0' when "00000100",
    '0' when "00000010",
    '0' when "00000001",
    '0' when others;
  -- src/instruction_decoder.vhd:46:5
  with n104 select n128 <=
    '0' when "10000000",
    '1' when "01000000",
    '0' when "00100000",
    '0' when "00010000",
    '0' when "00001000",
    '0' when "00000100",
    '0' when "00000010",
    '0' when "00000001",
    '0' when others;
  -- src/instruction_decoder.vhd:46:5
  with n104 select n132 <=
    '1' when "10000000",
    '0' when "01000000",
    '0' when "00100000",
    '0' when "00010000",
    '0' when "00001000",
    '0' when "00000100",
    '0' when "00000010",
    '0' when "00000001",
    '0' when others;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_register_Brtl is
  port (
    clk : in std_logic;
    reset : in std_logic;
    load_en : in std_logic;
    instruction_in : in std_logic_vector (15 downto 0);
    instruction_out : out std_logic_vector (15 downto 0));
end entity instruction_register_Brtl;

architecture rtl of instruction_register_Brtl is
  signal instruction : std_logic_vector (15 downto 0);
  signal n64 : std_logic_vector (15 downto 0);
  signal n66 : std_logic_vector (15 downto 0);
  signal n69 : std_logic_vector (15 downto 0) := "0000000000000000";
begin
  instruction_out <= instruction;
  -- src/instruction_register.vhd:20:10
  instruction <= n69; -- (isignal)
  -- src/instruction_register.vhd:31:7
  n64 <= instruction when load_en = '0' else instruction_in;
  -- src/instruction_register.vhd:28:7
  n66 <= n64 when reset = '0' else "0000000000000000";
  -- src/instruction_register.vhd:27:5
  process (clk)
  begin
    if rising_edge (clk) then
      n69 <= n66;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memory_Brom is
  port (
    address : in std_logic_vector (7 downto 0);
    instruction : out std_logic_vector (15 downto 0));
end entity instruction_memory_Brom;

architecture rtl of instruction_memory_Brom is
  signal n58 : std_logic_vector (15 downto 0);
begin
  instruction <= n58;
  -- src/instruction_memory.vhd:41:27
  process (address) is
    type n56_type is array (0 to 255)
      of std_logic_vector (15 downto 0);
    variable n56 : n56_type :=
      (255 => "1110000000000000",
       254 => "1110000000000000",
       253 => "1110000000000000",
       252 => "1110000000000000",
       251 => "1110000000000000",
       250 => "1110000000000000",
       249 => "1110000000000000",
       248 => "1110000000000000",
       247 => "1110000000000000",
       246 => "1110000000000000",
       245 => "1110000000000000",
       244 => "1110000000000000",
       243 => "1110000000000000",
       242 => "1110000000000000",
       241 => "1110000000000000",
       240 => "1110000000000000",
       239 => "1110000000000000",
       238 => "1110000000000000",
       237 => "1110000000000000",
       236 => "1110000000000000",
       235 => "1110000000000000",
       234 => "1110000000000000",
       233 => "1110000000000000",
       232 => "1110000000000000",
       231 => "1110000000000000",
       230 => "1110000000000000",
       229 => "1110000000000000",
       228 => "1110000000000000",
       227 => "1110000000000000",
       226 => "1110000000000000",
       225 => "1110000000000000",
       224 => "1110000000000000",
       223 => "1110000000000000",
       222 => "1110000000000000",
       221 => "1110000000000000",
       220 => "1110000000000000",
       219 => "1110000000000000",
       218 => "1110000000000000",
       217 => "1110000000000000",
       216 => "1110000000000000",
       215 => "1110000000000000",
       214 => "1110000000000000",
       213 => "1110000000000000",
       212 => "1110000000000000",
       211 => "1110000000000000",
       210 => "1110000000000000",
       209 => "1110000000000000",
       208 => "1110000000000000",
       207 => "1110000000000000",
       206 => "1110000000000000",
       205 => "1110000000000000",
       204 => "1110000000000000",
       203 => "1110000000000000",
       202 => "1110000000000000",
       201 => "1110000000000000",
       200 => "1110000000000000",
       199 => "1110000000000000",
       198 => "1110000000000000",
       197 => "1110000000000000",
       196 => "1110000000000000",
       195 => "1110000000000000",
       194 => "1110000000000000",
       193 => "1110000000000000",
       192 => "1110000000000000",
       191 => "1110000000000000",
       190 => "1110000000000000",
       189 => "1110000000000000",
       188 => "1110000000000000",
       187 => "1110000000000000",
       186 => "1110000000000000",
       185 => "1110000000000000",
       184 => "1110000000000000",
       183 => "1110000000000000",
       182 => "1110000000000000",
       181 => "1110000000000000",
       180 => "1110000000000000",
       179 => "1110000000000000",
       178 => "1110000000000000",
       177 => "1110000000000000",
       176 => "1110000000000000",
       175 => "1110000000000000",
       174 => "1110000000000000",
       173 => "1110000000000000",
       172 => "1110000000000000",
       171 => "1110000000000000",
       170 => "1110000000000000",
       169 => "1110000000000000",
       168 => "1110000000000000",
       167 => "1110000000000000",
       166 => "1110000000000000",
       165 => "1110000000000000",
       164 => "1110000000000000",
       163 => "1110000000000000",
       162 => "1110000000000000",
       161 => "1110000000000000",
       160 => "1110000000000000",
       159 => "1110000000000000",
       158 => "1110000000000000",
       157 => "1110000000000000",
       156 => "1110000000000000",
       155 => "1110000000000000",
       154 => "1110000000000000",
       153 => "1110000000000000",
       152 => "1110000000000000",
       151 => "1110000000000000",
       150 => "1110000000000000",
       149 => "1110000000000000",
       148 => "1110000000000000",
       147 => "1110000000000000",
       146 => "1110000000000000",
       145 => "1110000000000000",
       144 => "1110000000000000",
       143 => "1110000000000000",
       142 => "1110000000000000",
       141 => "1110000000000000",
       140 => "1110000000000000",
       139 => "1110000000000000",
       138 => "1110000000000000",
       137 => "1110000000000000",
       136 => "1110000000000000",
       135 => "1110000000000000",
       134 => "1110000000000000",
       133 => "1110000000000000",
       132 => "1110000000000000",
       131 => "1110000000000000",
       130 => "1110000000000000",
       129 => "1110000000000000",
       128 => "1110000000000000",
       127 => "1110000000000000",
       126 => "1110000000000000",
       125 => "1110000000000000",
       124 => "1110000000000000",
       123 => "1110000000000000",
       122 => "1110000000000000",
       121 => "1110000000000000",
       120 => "1110000000000000",
       119 => "1110000000000000",
       118 => "1110000000000000",
       117 => "1110000000000000",
       116 => "1110000000000000",
       115 => "1110000000000000",
       114 => "1110000000000000",
       113 => "1110000000000000",
       112 => "1110000000000000",
       111 => "1110000000000000",
       110 => "1110000000000000",
       109 => "1110000000000000",
       108 => "1110000000000000",
       107 => "1110000000000000",
       106 => "1110000000000000",
       105 => "1110000000000000",
       104 => "1110000000000000",
       103 => "1110000000000000",
       102 => "1110000000000000",
       101 => "1110000000000000",
       100 => "1110000000000000",
       99 => "1110000000000000",
       98 => "1110000000000000",
       97 => "1110000000000000",
       96 => "1110000000000000",
       95 => "1110000000000000",
       94 => "1110000000000000",
       93 => "1110000000000000",
       92 => "1110000000000000",
       91 => "1110000000000000",
       90 => "1110000000000000",
       89 => "1110000000000000",
       88 => "1110000000000000",
       87 => "1110000000000000",
       86 => "1110000000000000",
       85 => "1110000000000000",
       84 => "1110000000000000",
       83 => "1110000000000000",
       82 => "1110000000000000",
       81 => "1110000000000000",
       80 => "1110000000000000",
       79 => "1110000000000000",
       78 => "1110000000000000",
       77 => "1110000000000000",
       76 => "1110000000000000",
       75 => "1110000000000000",
       74 => "1110000000000000",
       73 => "1110000000000000",
       72 => "1110000000000000",
       71 => "1110000000000000",
       70 => "1110000000000000",
       69 => "1110000000000000",
       68 => "1110000000000000",
       67 => "1110000000000000",
       66 => "1110000000000000",
       65 => "1110000000000000",
       64 => "1110000000000000",
       63 => "1110000000000000",
       62 => "1110000000000000",
       61 => "1110000000000000",
       60 => "1110000000000000",
       59 => "1110000000000000",
       58 => "1110000000000000",
       57 => "1110000000000000",
       56 => "1110000000000000",
       55 => "1110000000000000",
       54 => "1110000000000000",
       53 => "1110000000000000",
       52 => "1110000000000000",
       51 => "1110000000000000",
       50 => "1110000000000000",
       49 => "1110000000000000",
       48 => "1110000000000000",
       47 => "1110000000000000",
       46 => "1110000000000000",
       45 => "1110000000000000",
       44 => "1110000000000000",
       43 => "1110000000000000",
       42 => "1110000000000000",
       41 => "1110000000000000",
       40 => "1110000000000000",
       39 => "1110000000000000",
       38 => "1110000000000000",
       37 => "1110000000000000",
       36 => "1110000000000000",
       35 => "1110000000000000",
       34 => "1110000000000000",
       33 => "1110000000000000",
       32 => "1110000000000000",
       31 => "1110000000000000",
       30 => "1110000000000000",
       29 => "1110000000000000",
       28 => "1110000000000000",
       27 => "1110000000000000",
       26 => "1110000000000000",
       25 => "1110000000000000",
       24 => "1110000000000000",
       23 => "1110000000000000",
       22 => "1110000000000000",
       21 => "1110000000000000",
       20 => "1110000000000000",
       19 => "1110000000000000",
       18 => "1110000000000000",
       17 => "1110000000000000",
       16 => "1110000000000000",
       15 => "1110000000000000",
       14 => "1110000000000000",
       13 => "1110000000000000",
       12 => "1110000000000000",
       11 => "1110000000000000",
       10 => "1110000000000000",
       9 => "1110000000000000",
       8 => "1110000000000000",
       7 => "1110000000000000",
       6 => "1110000000000000",
       5 => "1110000000000000",
       4 => "1110000000000000",
       3 => "1110000000000000",
       2 => "0000110010100000",
       1 => "1010100000010100",
       0 => "1010010000001010");
  begin
    n58 <= n56(to_integer (unsigned (address)));
  end process;
  -- src/instruction_memory.vhd:41:27
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter_Brtl is
  port (
    clk : in std_logic;
    reset : in std_logic;
    enable : in std_logic;
    pc_load : in std_logic;
    load_addr : in std_logic_vector (7 downto 0);
    pc_out : out std_logic_vector (7 downto 0));
end entity program_counter_Brtl;

architecture rtl of program_counter_Brtl is
  signal pc : std_logic_vector (7 downto 0);
  signal n41 : std_logic_vector (7 downto 0);
  signal n42 : std_logic_vector (7 downto 0);
  signal n43 : std_logic_vector (7 downto 0);
  signal n45 : std_logic_vector (7 downto 0);
  signal n48 : std_logic_vector (7 downto 0) := "00000000";
begin
  pc_out <= pc;
  -- src/program_counter.vhd:24:10
  pc <= n48; -- (isignal)
  -- src/program_counter.vhd:38:18
  n41 <= std_logic_vector (unsigned (pc) + unsigned'("00000001"));
  -- src/program_counter.vhd:37:7
  n42 <= pc when enable = '0' else n41;
  -- src/program_counter.vhd:35:7
  n43 <= n42 when pc_load = '0' else load_addr;
  -- src/program_counter.vhd:33:7
  n45 <= n43 when reset = '0' else "00000000";
  -- src/program_counter.vhd:31:5
  process (clk)
  begin
    if rising_edge (clk) then
      n48 <= n45;
    end if;
  end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of cpu is
  signal wrap_clk: std_logic;
  signal wrap_reset: std_logic;
  signal wrap_halted: std_logic;
  subtype typ_wrap_pc_debug is std_logic_vector (7 downto 0);
  signal wrap_pc_debug: typ_wrap_pc_debug;
  subtype typ_wrap_instruction_debug is std_logic_vector (15 downto 0);
  signal wrap_instruction_debug: typ_wrap_instruction_debug;
  subtype typ_wrap_r3_debug is std_logic_vector (7 downto 0);
  signal wrap_r3_debug: typ_wrap_r3_debug;
  signal pc_current : std_logic_vector (7 downto 0);
  signal rom_instruction : std_logic_vector (15 downto 0);
  signal ir_instruction : std_logic_vector (15 downto 0);
  signal opcode : std_logic_vector (2 downto 0);
  signal rd : std_logic_vector (2 downto 0);
  signal rs1 : std_logic_vector (2 downto 0);
  signal rs2 : std_logic_vector (2 downto 0);
  signal immediate : std_logic_vector (6 downto 0);
  signal alu_op : std_logic_vector (2 downto 0);
  signal decoder_write : std_logic;
  signal reg_data1 : std_logic_vector (7 downto 0);
  signal reg_data2 : std_logic_vector (7 downto 0);
  signal write_data : std_logic_vector (7 downto 0);
  signal reg3_debug : std_logic_vector (7 downto 0);
  signal alu_result : std_logic_vector (7 downto 0);
  signal ir_load : std_logic;
  signal pc_enable : std_logic;
  signal pc_load : std_logic;
  signal cu_write : std_logic;
  signal cu_load : std_logic;
  signal cu_halt : std_logic;
  signal actual_reg_write : std_logic;
  signal \pc.pc_out\ : std_logic_vector (7 downto 0);
  signal n5 : std_logic_vector (7 downto 0);
  signal \imem.instruction\ : std_logic_vector (15 downto 0);
  signal \ir.instruction_out\ : std_logic_vector (15 downto 0);
  signal \decoder.opcode\ : std_logic_vector (2 downto 0);
  signal \decoder.rd\ : std_logic_vector (2 downto 0);
  signal \decoder.rs1\ : std_logic_vector (2 downto 0);
  signal \decoder.rs2\ : std_logic_vector (2 downto 0);
  signal \decoder.immediate\ : std_logic_vector (6 downto 0);
  signal \decoder.alu_op\ : std_logic_vector (2 downto 0);
  signal \decoder.reg_write\ : std_logic;
  signal \decoder.load_imm\ : std_logic;
  signal \decoder.jump\ : std_logic;
  signal \decoder.halt\ : std_logic;
  signal \rf.read_data1\ : std_logic_vector (7 downto 0);
  signal \rf.read_data2\ : std_logic_vector (7 downto 0);
  signal \rf.debug_r3\ : std_logic_vector (7 downto 0);
  signal \alu_unit.result\ : std_logic_vector (7 downto 0);
  signal \alu_unit.zero\ : std_logic;
  signal \alu_unit.carry\ : std_logic;
  signal \cu.ir_load\ : std_logic;
  signal \cu.pc_enable\ : std_logic;
  signal \cu.pc_load\ : std_logic;
  signal \cu.reg_write\ : std_logic;
  signal \cu.load_imm\ : std_logic;
  signal \cu.halt\ : std_logic;
  signal n31 : std_logic;
  signal n33 : std_logic_vector (7 downto 0);
  signal n34 : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_reset <= reset;
  halted <= wrap_halted;
  pc_debug <= std_logic_vector(wrap_pc_debug);
  instruction_debug <= std_logic_vector(wrap_instruction_debug);
  r3_debug <= std_logic_vector(wrap_r3_debug);
  wrap_halted <= cu_halt;
  wrap_pc_debug <= pc_current;
  wrap_instruction_debug <= ir_instruction;
  wrap_r3_debug <= reg3_debug;
  -- src/cpu.vhd:22:10
  pc_current <= \pc.pc_out\; -- (signal)
  -- src/cpu.vhd:24:10
  rom_instruction <= \imem.instruction\; -- (signal)
  -- src/cpu.vhd:26:10
  ir_instruction <= \ir.instruction_out\; -- (signal)
  -- src/cpu.vhd:29:10
  opcode <= \decoder.opcode\; -- (signal)
  -- src/cpu.vhd:30:10
  rd <= \decoder.rd\; -- (signal)
  -- src/cpu.vhd:31:10
  rs1 <= \decoder.rs1\; -- (signal)
  -- src/cpu.vhd:32:10
  rs2 <= \decoder.rs2\; -- (signal)
  -- src/cpu.vhd:33:10
  immediate <= \decoder.immediate\; -- (signal)
  -- src/cpu.vhd:35:10
  alu_op <= \decoder.alu_op\; -- (signal)
  -- src/cpu.vhd:36:10
  decoder_write <= \decoder.reg_write\; -- (signal)
  -- src/cpu.vhd:42:10
  reg_data1 <= \rf.read_data1\; -- (signal)
  -- src/cpu.vhd:43:10
  reg_data2 <= \rf.read_data2\; -- (signal)
  -- src/cpu.vhd:44:10
  write_data <= n34; -- (signal)
  -- src/cpu.vhd:45:10
  reg3_debug <= \rf.debug_r3\; -- (signal)
  -- src/cpu.vhd:48:10
  alu_result <= \alu_unit.result\; -- (signal)
  -- src/cpu.vhd:53:10
  ir_load <= \cu.ir_load\; -- (signal)
  -- src/cpu.vhd:54:10
  pc_enable <= \cu.pc_enable\; -- (signal)
  -- src/cpu.vhd:55:10
  pc_load <= \cu.pc_load\; -- (signal)
  -- src/cpu.vhd:56:10
  cu_write <= \cu.reg_write\; -- (signal)
  -- src/cpu.vhd:57:10
  cu_load <= \cu.load_imm\; -- (signal)
  -- src/cpu.vhd:58:10
  cu_halt <= \cu.halt\; -- (signal)
  -- src/cpu.vhd:61:10
  actual_reg_write <= n31; -- (signal)
  -- src/cpu.vhd:69:3
  pc : entity work.program_counter_Brtl port map (
    clk => wrap_clk,
    reset => wrap_reset,
    enable => pc_enable,
    pc_load => pc_load,
    load_addr => n5,
    pc_out => \pc.pc_out\);
  -- src/cpu.vhd:76:22
  n5 <= '0' & immediate;
  -- src/cpu.vhd:84:5
  imem : entity work.instruction_memory_Brom port map (
    address => pc_current,
    instruction => \imem.instruction\);
  -- src/cpu.vhd:93:3
  ir : entity work.instruction_register_Brtl port map (
    clk => wrap_clk,
    reset => wrap_reset,
    load_en => ir_load,
    instruction_in => rom_instruction,
    instruction_out => \ir.instruction_out\);
  -- src/cpu.vhd:106:3
  decoder : entity work.instruction_decoder_Brtl port map (
    instruction => ir_instruction,
    opcode => \decoder.opcode\,
    rd => \decoder.rd\,
    rs1 => \decoder.rs1\,
    rs2 => \decoder.rs2\,
    immediate => \decoder.immediate\,
    alu_op => \decoder.alu_op\,
    reg_write => \decoder.reg_write\,
    load_imm => open,
    jump => open,
    halt => open);
  -- src/cpu.vhd:128:3
  rf : entity work.register_file_Brtl port map (
    clk => wrap_clk,
    reset => wrap_reset,
    we => actual_reg_write,
    read_addr1 => rs1,
    read_addr2 => rs2,
    write_addr => rd,
    write_data => write_data,
    read_data1 => \rf.read_data1\,
    read_data2 => \rf.read_data2\,
    debug_r3 => \rf.debug_r3\);
  -- src/cpu.vhd:149:3
  alu_unit : entity work.alu_Brtl port map (
    a => reg_data1,
    b => reg_data2,
    alu_op => alu_op,
    result => \alu_unit.result\,
    zero => open,
    carry => open);
  -- src/cpu.vhd:164:3
  cu : entity work.control_unit_Bfsm port map (
    clk => wrap_clk,
    reset => wrap_reset,
    opcode => opcode,
    ir_load => \cu.ir_load\,
    pc_enable => \cu.pc_enable\,
    pc_load => \cu.pc_load\,
    reg_write => \cu.reg_write\,
    load_imm => \cu.load_imm\,
    halt => \cu.halt\);
  -- src/cpu.vhd:184:32
  n31 <= cu_write and decoder_write;
  -- src/cpu.vhd:186:22
  n33 <= '0' & immediate;
  -- src/cpu.vhd:186:35
  n34 <= alu_result when cu_load = '0' else n33;
end rtl;
