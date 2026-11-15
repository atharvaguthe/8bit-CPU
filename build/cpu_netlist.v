module control_unit_Bfsm
  (input  clk,
   input  reset,
   input  [2:0] opcode,
   output ir_load,
   output pc_enable,
   output pc_load,
   output reg_write,
   output load_imm,
   output halt);
  reg [2:0] current_state;
  reg [2:0] next_state;
  wire [2:0] n279;
  wire n285;
  wire n287;
  wire n289;
  wire n290;
  wire n292;
  wire n293;
  wire n295;
  wire n296;
  wire n298;
  wire n299;
  wire n301;
  wire n303;
  wire n305;
  wire [3:0] n306;
  reg [2:0] n312;
  wire n314;
  wire n316;
  wire n318;
  wire n320;
  wire n322;
  wire n324;
  wire [6:0] n325;
  reg [2:0] n333;
  wire n338;
  wire n340;
  wire n342;
  wire n344;
  wire n346;
  wire [4:0] n347;
  reg n350;
  reg n354;
  reg n358;
  reg n363;
  reg n367;
  reg n371;
  reg [2:0] n374;
  assign ir_load = n350; //(module output)
  assign pc_enable = n354; //(module output)
  assign pc_load = n358; //(module output)
  assign reg_write = n363; //(module output)
  assign load_imm = n367; //(module output)
  assign halt = n371; //(module output)
  /*# src/control_unit.vhd:37:12 */
  always @*
    current_state = n374; // (isignal)
  initial
    current_state = 3'b000;
  /*# src/control_unit.vhd:38:12 */
  always @*
    next_state = n333; // (isignal)
  initial
    next_state = 3'b000;
  /*# src/control_unit.vhd:46:7 */
  assign n279 = reset ? 3'b000 : next_state;
  /*# src/control_unit.vhd:64:7 */
  assign n285 = current_state == 3'b000;
  /*# src/control_unit.vhd:71:11 */
  assign n287 = opcode == 3'b000;
  /*# src/control_unit.vhd:71:22 */
  assign n289 = opcode == 3'b001;
  /*# src/control_unit.vhd:71:22 */
  assign n290 = n287 | n289;
  /*# src/control_unit.vhd:71:30 */
  assign n292 = opcode == 3'b010;
  /*# src/control_unit.vhd:71:30 */
  assign n293 = n290 | n292;
  /*# src/control_unit.vhd:72:22 */
  assign n295 = opcode == 3'b011;
  /*# src/control_unit.vhd:72:22 */
  assign n296 = n293 | n295;
  /*# src/control_unit.vhd:72:30 */
  assign n298 = opcode == 3'b100;
  /*# src/control_unit.vhd:72:30 */
  assign n299 = n296 | n298;
  /*# src/control_unit.vhd:76:11 */
  assign n301 = opcode == 3'b101;
  /*# src/control_unit.vhd:79:11 */
  assign n303 = opcode == 3'b110;
  /*# src/control_unit.vhd:82:11 */
  assign n305 = opcode == 3'b111;
  /*# src/control_unit.vhd:69:9 */
  assign n306 = {n305, n303, n301, n299};
  /*# src/control_unit.vhd:69:9 */
  always @*
    case (n306)
      4'b1000: n312 = 3'b110;
      4'b0100: n312 = 3'b101;
      4'b0010: n312 = 3'b100;
      4'b0001: n312 = 3'b010;
      default: n312 = 3'b110;
    endcase
  /*# src/control_unit.vhd:67:7 */
  assign n314 = current_state == 3'b001;
  /*# src/control_unit.vhd:90:7 */
  assign n316 = current_state == 3'b010;
  /*# src/control_unit.vhd:93:7 */
  assign n318 = current_state == 3'b011;
  /*# src/control_unit.vhd:96:7 */
  assign n320 = current_state == 3'b100;
  /*# src/control_unit.vhd:99:7 */
  assign n322 = current_state == 3'b101;
  /*# src/control_unit.vhd:102:7 */
  assign n324 = current_state == 3'b110;
  /*# src/control_unit.vhd:62:5 */
  assign n325 = {n324, n322, n320, n318, n316, n314, n285};
  /*# src/control_unit.vhd:62:5 */
  always @*
    case (n325)
      7'b1000000: n333 = 3'b110;
      7'b0100000: n333 = 3'b000;
      7'b0010000: n333 = 3'b000;
      7'b0001000: n333 = 3'b000;
      7'b0000100: n333 = 3'b011;
      7'b0000010: n333 = n312;
      7'b0000001: n333 = 3'b001;
      default: n333 = 3'bX;
    endcase
  /*# src/control_unit.vhd:124:7 */
  assign n338 = current_state == 3'b000;
  /*# src/control_unit.vhd:128:7 */
  assign n340 = current_state == 3'b011;
  /*# src/control_unit.vhd:131:7 */
  assign n342 = current_state == 3'b100;
  /*# src/control_unit.vhd:135:7 */
  assign n344 = current_state == 3'b101;
  /*# src/control_unit.vhd:138:7 */
  assign n346 = current_state == 3'b110;
  /*# src/control_unit.vhd:123:5 */
  assign n347 = {n346, n344, n342, n340, n338};
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n350 = 1'b0;
      5'b01000: n350 = 1'b0;
      5'b00100: n350 = 1'b0;
      5'b00010: n350 = 1'b0;
      5'b00001: n350 = 1'b1;
      default: n350 = 1'b0;
    endcase
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n354 = 1'b0;
      5'b01000: n354 = 1'b0;
      5'b00100: n354 = 1'b0;
      5'b00010: n354 = 1'b0;
      5'b00001: n354 = 1'b1;
      default: n354 = 1'b0;
    endcase
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n358 = 1'b0;
      5'b01000: n358 = 1'b1;
      5'b00100: n358 = 1'b0;
      5'b00010: n358 = 1'b0;
      5'b00001: n358 = 1'b0;
      default: n358 = 1'b0;
    endcase
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n363 = 1'b0;
      5'b01000: n363 = 1'b0;
      5'b00100: n363 = 1'b1;
      5'b00010: n363 = 1'b1;
      5'b00001: n363 = 1'b0;
      default: n363 = 1'b0;
    endcase
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n367 = 1'b0;
      5'b01000: n367 = 1'b0;
      5'b00100: n367 = 1'b1;
      5'b00010: n367 = 1'b0;
      5'b00001: n367 = 1'b0;
      default: n367 = 1'b0;
    endcase
  /*# src/control_unit.vhd:123:5 */
  always @*
    case (n347)
      5'b10000: n371 = 1'b1;
      5'b01000: n371 = 1'b0;
      5'b00100: n371 = 1'b0;
      5'b00010: n371 = 1'b0;
      5'b00001: n371 = 1'b0;
      default: n371 = 1'b0;
    endcase
  /*# src/control_unit.vhd:45:5 */
  always @(posedge clk)
    n374 <= n279;
  initial
    n374 = 3'b000;
endmodule

module alu_Brtl
  (input  [7:0] a,
   input  [7:0] b,
   input  [2:0] alu_op,
   output [7:0] result,
   output zero,
   output carry);
  wire [8:0] n208;
  wire [8:0] n210;
  wire [8:0] n211;
  wire [7:0] n212;
  wire n213;
  wire n215;
  wire [8:0] n217;
  wire [8:0] n219;
  wire [8:0] n220;
  wire [7:0] n221;
  wire n222;
  wire n225;
  wire n227;
  wire [7:0] n228;
  wire n230;
  wire [7:0] n231;
  wire n233;
  wire [7:0] n234;
  wire n236;
  wire [7:0] n237;
  wire n239;
  wire [7:0] n241;
  wire n242;
  wire n244;
  wire [7:0] n246;
  wire n247;
  wire n249;
  wire [7:0] n250;
  reg n253;
  reg [7:0] n259;
  wire n262;
  wire n265;
  assign result = n259; //(module output)
  assign zero = n265; //(module output)
  assign carry = n253; //(module output)
  /*# src/alu.vhd:39:22 */
  assign n208 = {1'b0, a};
  /*# src/alu.vhd:39:44 */
  assign n210 = {1'b0, b};
  /*# src/alu.vhd:39:37 */
  assign n211 = n208 + n210;
  /*# src/alu.vhd:41:20 */
  assign n212 = n211[7:0]; // extract
  /*# src/alu.vhd:42:22 */
  assign n213 = n211[8]; // extract
  /*# src/alu.vhd:38:7 */
  assign n215 = alu_op == 3'b000;
  /*# src/alu.vhd:46:22 */
  assign n217 = {1'b0, a};
  /*# src/alu.vhd:46:44 */
  assign n219 = {1'b0, b};
  /*# src/alu.vhd:46:37 */
  assign n220 = n217 - n219;
  /*# src/alu.vhd:48:20 */
  assign n221 = n220[7:0]; // extract
  /*# src/alu.vhd:50:24 */
  assign n222 = $unsigned(a) < $unsigned(b);
  /*# src/alu.vhd:50:9 */
  assign n225 = n222 ? 1'b1 : 1'b0;
  /*# src/alu.vhd:45:7 */
  assign n227 = alu_op == 3'b001;
  /*# src/alu.vhd:56:27 */
  assign n228 = a & b;
  /*# src/alu.vhd:55:7 */
  assign n230 = alu_op == 3'b010;
  /*# src/alu.vhd:60:27 */
  assign n231 = a | b;
  /*# src/alu.vhd:59:7 */
  assign n233 = alu_op == 3'b011;
  /*# src/alu.vhd:64:27 */
  assign n234 = a ^ b;
  /*# src/alu.vhd:63:7 */
  assign n236 = alu_op == 3'b100;
  /*# src/alu.vhd:68:25 */
  assign n237 = ~a;
  /*# src/alu.vhd:67:7 */
  assign n239 = alu_op == 3'b101;
  /*# src/alu.vhd:72:16 */
  assign n241 = a << 31'b0000000000000000000000000000001;
  /*# src/alu.vhd:73:19 */
  assign n242 = a[7]; // extract
  /*# src/alu.vhd:71:7 */
  assign n244 = alu_op == 3'b110;
  /*# src/alu.vhd:77:16 */
  assign n246 = a >> 31'b0000000000000000000000000000001;
  /*# src/alu.vhd:78:19 */
  assign n247 = a[0]; // extract
  /*# src/alu.vhd:76:7 */
  assign n249 = alu_op == 3'b111;
  /*# src/alu.vhd:35:5 */
  assign n250 = {n249, n244, n239, n236, n233, n230, n227, n215};
  /*# src/alu.vhd:35:5 */
  always @*
    case (n250)
      8'b10000000: n253 = n247;
      8'b01000000: n253 = n242;
      8'b00100000: n253 = 1'b0;
      8'b00010000: n253 = 1'b0;
      8'b00001000: n253 = 1'b0;
      8'b00000100: n253 = 1'b0;
      8'b00000010: n253 = n225;
      8'b00000001: n253 = n213;
      default: n253 = 1'b0;
    endcase
  /*# src/alu.vhd:35:5 */
  always @*
    case (n250)
      8'b10000000: n259 = n246;
      8'b01000000: n259 = n241;
      8'b00100000: n259 = n237;
      8'b00010000: n259 = n234;
      8'b00001000: n259 = n231;
      8'b00000100: n259 = n228;
      8'b00000010: n259 = n221;
      8'b00000001: n259 = n212;
      default: n259 = 8'b00000000;
    endcase
  /*# src/alu.vhd:88:12 */
  assign n262 = n259 == 8'b00000000;
  /*# src/alu.vhd:88:5 */
  assign n265 = n262 ? 1'b1 : 1'b0;
endmodule

module register_file_Brtl
  (input  clk,
   input  reset,
   input  we,
   input  [2:0] read_addr1,
   input  [2:0] read_addr2,
   input  [2:0] write_addr,
   input  [7:0] write_data,
   output [7:0] read_data1,
   output [7:0] read_data2,
   output [7:0] debug_r3);
  wire [63:0] regs;
  wire [2:0] n143;
  wire [63:0] n146;
  wire [63:0] n148;
  wire [2:0] n153;
  wire [2:0] n158;
  wire [7:0] n161;
  reg [63:0] n162;
  wire n163;
  wire n164;
  wire n165;
  wire n166;
  wire n167;
  wire n168;
  wire n169;
  wire n170;
  wire n171;
  wire n172;
  wire n173;
  wire n174;
  wire n175;
  wire n176;
  wire n177;
  wire n178;
  wire n179;
  wire n180;
  wire [7:0] n181;
  wire [7:0] n182;
  wire [7:0] n183;
  wire [7:0] n184;
  wire [7:0] n185;
  wire [7:0] n186;
  wire [7:0] n187;
  wire [7:0] n188;
  wire [7:0] n189;
  wire [7:0] n190;
  wire [7:0] n191;
  wire [7:0] n192;
  wire [7:0] n193;
  wire [7:0] n194;
  wire [7:0] n195;
  wire [7:0] n196;
  wire [63:0] n197;
  wire [7:0] n198;
  wire [7:0] n199;
  assign read_data1 = n198; //(module output)
  assign read_data2 = n199; //(module output)
  assign debug_r3 = n161; //(module output)
  /*# src/register_file.vhd:33:10 */
  assign regs = n162; // (signal)
  /*# src/register_file.vhd:46:14 */
  assign n143 = 3'b111 - write_addr;
  /*# src/register_file.vhd:45:7 */
  assign n146 = we ? n197 : regs;
  /*# src/register_file.vhd:43:7 */
  assign n148 = reset ? 64'b0000000000000000000000000000000000000000000000000000000000000000 : n146;
  /*# src/register_file.vhd:54:22 */
  assign n153 = 3'b111 - read_addr1;
  /*# src/register_file.vhd:56:22 */
  assign n158 = 3'b111 - read_addr2;
  /*# src/register_file.vhd:58:19 */
  assign n161 = regs[39:32]; // extract
  /*# src/register_file.vhd:41:5 */
  always @(posedge clk)
    n162 <= n148;
  /*# src/register_file.vhd:46:9 */
  assign n163 = n143[2]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n164 = ~n163;
  /*# src/register_file.vhd:46:9 */
  assign n165 = n143[1]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n166 = ~n165;
  /*# src/register_file.vhd:46:9 */
  assign n167 = n164 & n166;
  /*# src/register_file.vhd:46:9 */
  assign n168 = n164 & n165;
  /*# src/register_file.vhd:46:9 */
  assign n169 = n163 & n166;
  /*# src/register_file.vhd:46:9 */
  assign n170 = n163 & n165;
  /*# src/register_file.vhd:46:9 */
  assign n171 = n143[0]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n172 = ~n171;
  /*# src/register_file.vhd:46:9 */
  assign n173 = n167 & n172;
  /*# src/register_file.vhd:46:9 */
  assign n174 = n167 & n171;
  /*# src/register_file.vhd:46:9 */
  assign n175 = n168 & n172;
  /*# src/register_file.vhd:46:9 */
  assign n176 = n168 & n171;
  /*# src/register_file.vhd:46:9 */
  assign n177 = n169 & n172;
  /*# src/register_file.vhd:46:9 */
  assign n178 = n169 & n171;
  /*# src/register_file.vhd:46:9 */
  assign n179 = n170 & n172;
  /*# src/register_file.vhd:46:9 */
  assign n180 = n170 & n171;
  /*# src/register_file.vhd:46:9 */
  assign n181 = regs[7:0]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n182 = n173 ? write_data : n181;
  /*# src/register_file.vhd:46:9 */
  assign n183 = regs[15:8]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n184 = n174 ? write_data : n183;
  /*# src/register_file.vhd:46:9 */
  assign n185 = regs[23:16]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n186 = n175 ? write_data : n185;
  /*# src/register_file.vhd:46:9 */
  assign n187 = regs[31:24]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n188 = n176 ? write_data : n187;
  /*# src/register_file.vhd:46:9 */
  assign n189 = regs[39:32]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n190 = n177 ? write_data : n189;
  /*# src/register_file.vhd:46:9 */
  assign n191 = regs[47:40]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n192 = n178 ? write_data : n191;
  /*# src/register_file.vhd:46:9 */
  assign n193 = regs[55:48]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n194 = n179 ? write_data : n193;
  /*# src/register_file.vhd:46:9 */
  assign n195 = regs[63:56]; // extract
  /*# src/register_file.vhd:46:9 */
  assign n196 = n180 ? write_data : n195;
  /*# src/register_file.vhd:46:9 */
  assign n197 = {n196, n194, n192, n190, n188, n186, n184, n182};
  /*# src/register_file.vhd:54:22 */
  assign n198 = regs[n153 * 8 +: 8]; //(Bmux)
  /*# src/register_file.vhd:56:22 */
  assign n199 = regs[n158 * 8 +: 8]; //(Bmux)
endmodule

module instruction_decoder_Brtl
  (input  [15:0] instruction,
   output [2:0] opcode,
   output [2:0] rd,
   output [2:0] rs1,
   output [2:0] rs2,
   output [6:0] immediate,
   output [2:0] alu_op,
   output reg_write,
   output load_imm,
   output jump,
   output halt);
  wire [2:0] n80;
  wire [2:0] n81;
  wire [2:0] n82;
  wire [2:0] n83;
  wire [6:0] n84;
  wire [2:0] n87;
  wire n89;
  wire n91;
  wire n93;
  wire n95;
  wire n97;
  wire n99;
  wire n101;
  wire n103;
  wire [7:0] n104;
  reg [2:0] n111;
  reg n120;
  reg n124;
  reg n128;
  reg n132;
  assign opcode = n80; //(module output)
  assign rd = n81; //(module output)
  assign rs1 = n82; //(module output)
  assign rs2 = n83; //(module output)
  assign immediate = n84; //(module output)
  assign alu_op = n111; //(module output)
  assign reg_write = n120; //(module output)
  assign load_imm = n124; //(module output)
  assign jump = n128; //(module output)
  assign halt = n132; //(module output)
  /*# src/instruction_decoder.vhd:30:24 */
  assign n80 = instruction[15:13]; // extract
  /*# src/instruction_decoder.vhd:31:20 */
  assign n81 = instruction[12:10]; // extract
  /*# src/instruction_decoder.vhd:32:21 */
  assign n82 = instruction[9:7]; // extract
  /*# src/instruction_decoder.vhd:33:21 */
  assign n83 = instruction[6:4]; // extract
  /*# src/instruction_decoder.vhd:34:27 */
  assign n84 = instruction[6:0]; // extract
  /*# src/instruction_decoder.vhd:46:21 */
  assign n87 = instruction[15:13]; // extract
  /*# src/instruction_decoder.vhd:48:7 */
  assign n89 = n87 == 3'b000;
  /*# src/instruction_decoder.vhd:52:7 */
  assign n91 = n87 == 3'b001;
  /*# src/instruction_decoder.vhd:56:7 */
  assign n93 = n87 == 3'b010;
  /*# src/instruction_decoder.vhd:60:7 */
  assign n95 = n87 == 3'b011;
  /*# src/instruction_decoder.vhd:64:7 */
  assign n97 = n87 == 3'b100;
  /*# src/instruction_decoder.vhd:68:7 */
  assign n99 = n87 == 3'b101;
  /*# src/instruction_decoder.vhd:72:7 */
  assign n101 = n87 == 3'b110;
  /*# src/instruction_decoder.vhd:75:7 */
  assign n103 = n87 == 3'b111;
  /*# src/instruction_decoder.vhd:46:5 */
  assign n104 = {n103, n101, n99, n97, n95, n93, n91, n89};
  /*# src/instruction_decoder.vhd:46:5 */
  always @*
    case (n104)
      8'b10000000: n111 = 3'b000;
      8'b01000000: n111 = 3'b000;
      8'b00100000: n111 = 3'b000;
      8'b00010000: n111 = 3'b100;
      8'b00001000: n111 = 3'b011;
      8'b00000100: n111 = 3'b010;
      8'b00000010: n111 = 3'b001;
      8'b00000001: n111 = 3'b000;
      default: n111 = 3'b000;
    endcase
  /*# src/instruction_decoder.vhd:46:5 */
  always @*
    case (n104)
      8'b10000000: n120 = 1'b0;
      8'b01000000: n120 = 1'b0;
      8'b00100000: n120 = 1'b1;
      8'b00010000: n120 = 1'b1;
      8'b00001000: n120 = 1'b1;
      8'b00000100: n120 = 1'b1;
      8'b00000010: n120 = 1'b1;
      8'b00000001: n120 = 1'b1;
      default: n120 = 1'b0;
    endcase
  /*# src/instruction_decoder.vhd:46:5 */
  always @*
    case (n104)
      8'b10000000: n124 = 1'b0;
      8'b01000000: n124 = 1'b0;
      8'b00100000: n124 = 1'b1;
      8'b00010000: n124 = 1'b0;
      8'b00001000: n124 = 1'b0;
      8'b00000100: n124 = 1'b0;
      8'b00000010: n124 = 1'b0;
      8'b00000001: n124 = 1'b0;
      default: n124 = 1'b0;
    endcase
  /*# src/instruction_decoder.vhd:46:5 */
  always @*
    case (n104)
      8'b10000000: n128 = 1'b0;
      8'b01000000: n128 = 1'b1;
      8'b00100000: n128 = 1'b0;
      8'b00010000: n128 = 1'b0;
      8'b00001000: n128 = 1'b0;
      8'b00000100: n128 = 1'b0;
      8'b00000010: n128 = 1'b0;
      8'b00000001: n128 = 1'b0;
      default: n128 = 1'b0;
    endcase
  /*# src/instruction_decoder.vhd:46:5 */
  always @*
    case (n104)
      8'b10000000: n132 = 1'b1;
      8'b01000000: n132 = 1'b0;
      8'b00100000: n132 = 1'b0;
      8'b00010000: n132 = 1'b0;
      8'b00001000: n132 = 1'b0;
      8'b00000100: n132 = 1'b0;
      8'b00000010: n132 = 1'b0;
      8'b00000001: n132 = 1'b0;
      default: n132 = 1'b0;
    endcase
endmodule

module instruction_register_Brtl
  (input  clk,
   input  reset,
   input  load_en,
   input  [15:0] instruction_in,
   output [15:0] instruction_out);
  reg [15:0] instruction;
  wire [15:0] n64;
  wire [15:0] n66;
  reg [15:0] n69;
  assign instruction_out = instruction; //(module output)
  /*# src/instruction_register.vhd:20:10 */
  always @*
    instruction = n69; // (isignal)
  initial
    instruction = 16'b0000000000000000;
  /*# src/instruction_register.vhd:31:7 */
  assign n64 = load_en ? instruction_in : instruction;
  /*# src/instruction_register.vhd:28:7 */
  assign n66 = reset ? 16'b0000000000000000 : n64;
  /*# src/instruction_register.vhd:27:5 */
  always @(posedge clk)
    n69 <= n66;
  initial
    n69 = 16'b0000000000000000;
endmodule

module instruction_memory_Brom
  (input  [7:0] address,
   output [15:0] instruction);
  wire [15:0] n58; // mem_rd
  assign instruction = n58; //(module output)
  /*# src/instruction_memory.vhd:41:27 */
  reg [15:0] n56[255:0] ; // memory
  initial begin
    n56[255] = 16'b1110000000000000;
    n56[254] = 16'b1110000000000000;
    n56[253] = 16'b1110000000000000;
    n56[252] = 16'b1110000000000000;
    n56[251] = 16'b1110000000000000;
    n56[250] = 16'b1110000000000000;
    n56[249] = 16'b1110000000000000;
    n56[248] = 16'b1110000000000000;
    n56[247] = 16'b1110000000000000;
    n56[246] = 16'b1110000000000000;
    n56[245] = 16'b1110000000000000;
    n56[244] = 16'b1110000000000000;
    n56[243] = 16'b1110000000000000;
    n56[242] = 16'b1110000000000000;
    n56[241] = 16'b1110000000000000;
    n56[240] = 16'b1110000000000000;
    n56[239] = 16'b1110000000000000;
    n56[238] = 16'b1110000000000000;
    n56[237] = 16'b1110000000000000;
    n56[236] = 16'b1110000000000000;
    n56[235] = 16'b1110000000000000;
    n56[234] = 16'b1110000000000000;
    n56[233] = 16'b1110000000000000;
    n56[232] = 16'b1110000000000000;
    n56[231] = 16'b1110000000000000;
    n56[230] = 16'b1110000000000000;
    n56[229] = 16'b1110000000000000;
    n56[228] = 16'b1110000000000000;
    n56[227] = 16'b1110000000000000;
    n56[226] = 16'b1110000000000000;
    n56[225] = 16'b1110000000000000;
    n56[224] = 16'b1110000000000000;
    n56[223] = 16'b1110000000000000;
    n56[222] = 16'b1110000000000000;
    n56[221] = 16'b1110000000000000;
    n56[220] = 16'b1110000000000000;
    n56[219] = 16'b1110000000000000;
    n56[218] = 16'b1110000000000000;
    n56[217] = 16'b1110000000000000;
    n56[216] = 16'b1110000000000000;
    n56[215] = 16'b1110000000000000;
    n56[214] = 16'b1110000000000000;
    n56[213] = 16'b1110000000000000;
    n56[212] = 16'b1110000000000000;
    n56[211] = 16'b1110000000000000;
    n56[210] = 16'b1110000000000000;
    n56[209] = 16'b1110000000000000;
    n56[208] = 16'b1110000000000000;
    n56[207] = 16'b1110000000000000;
    n56[206] = 16'b1110000000000000;
    n56[205] = 16'b1110000000000000;
    n56[204] = 16'b1110000000000000;
    n56[203] = 16'b1110000000000000;
    n56[202] = 16'b1110000000000000;
    n56[201] = 16'b1110000000000000;
    n56[200] = 16'b1110000000000000;
    n56[199] = 16'b1110000000000000;
    n56[198] = 16'b1110000000000000;
    n56[197] = 16'b1110000000000000;
    n56[196] = 16'b1110000000000000;
    n56[195] = 16'b1110000000000000;
    n56[194] = 16'b1110000000000000;
    n56[193] = 16'b1110000000000000;
    n56[192] = 16'b1110000000000000;
    n56[191] = 16'b1110000000000000;
    n56[190] = 16'b1110000000000000;
    n56[189] = 16'b1110000000000000;
    n56[188] = 16'b1110000000000000;
    n56[187] = 16'b1110000000000000;
    n56[186] = 16'b1110000000000000;
    n56[185] = 16'b1110000000000000;
    n56[184] = 16'b1110000000000000;
    n56[183] = 16'b1110000000000000;
    n56[182] = 16'b1110000000000000;
    n56[181] = 16'b1110000000000000;
    n56[180] = 16'b1110000000000000;
    n56[179] = 16'b1110000000000000;
    n56[178] = 16'b1110000000000000;
    n56[177] = 16'b1110000000000000;
    n56[176] = 16'b1110000000000000;
    n56[175] = 16'b1110000000000000;
    n56[174] = 16'b1110000000000000;
    n56[173] = 16'b1110000000000000;
    n56[172] = 16'b1110000000000000;
    n56[171] = 16'b1110000000000000;
    n56[170] = 16'b1110000000000000;
    n56[169] = 16'b1110000000000000;
    n56[168] = 16'b1110000000000000;
    n56[167] = 16'b1110000000000000;
    n56[166] = 16'b1110000000000000;
    n56[165] = 16'b1110000000000000;
    n56[164] = 16'b1110000000000000;
    n56[163] = 16'b1110000000000000;
    n56[162] = 16'b1110000000000000;
    n56[161] = 16'b1110000000000000;
    n56[160] = 16'b1110000000000000;
    n56[159] = 16'b1110000000000000;
    n56[158] = 16'b1110000000000000;
    n56[157] = 16'b1110000000000000;
    n56[156] = 16'b1110000000000000;
    n56[155] = 16'b1110000000000000;
    n56[154] = 16'b1110000000000000;
    n56[153] = 16'b1110000000000000;
    n56[152] = 16'b1110000000000000;
    n56[151] = 16'b1110000000000000;
    n56[150] = 16'b1110000000000000;
    n56[149] = 16'b1110000000000000;
    n56[148] = 16'b1110000000000000;
    n56[147] = 16'b1110000000000000;
    n56[146] = 16'b1110000000000000;
    n56[145] = 16'b1110000000000000;
    n56[144] = 16'b1110000000000000;
    n56[143] = 16'b1110000000000000;
    n56[142] = 16'b1110000000000000;
    n56[141] = 16'b1110000000000000;
    n56[140] = 16'b1110000000000000;
    n56[139] = 16'b1110000000000000;
    n56[138] = 16'b1110000000000000;
    n56[137] = 16'b1110000000000000;
    n56[136] = 16'b1110000000000000;
    n56[135] = 16'b1110000000000000;
    n56[134] = 16'b1110000000000000;
    n56[133] = 16'b1110000000000000;
    n56[132] = 16'b1110000000000000;
    n56[131] = 16'b1110000000000000;
    n56[130] = 16'b1110000000000000;
    n56[129] = 16'b1110000000000000;
    n56[128] = 16'b1110000000000000;
    n56[127] = 16'b1110000000000000;
    n56[126] = 16'b1110000000000000;
    n56[125] = 16'b1110000000000000;
    n56[124] = 16'b1110000000000000;
    n56[123] = 16'b1110000000000000;
    n56[122] = 16'b1110000000000000;
    n56[121] = 16'b1110000000000000;
    n56[120] = 16'b1110000000000000;
    n56[119] = 16'b1110000000000000;
    n56[118] = 16'b1110000000000000;
    n56[117] = 16'b1110000000000000;
    n56[116] = 16'b1110000000000000;
    n56[115] = 16'b1110000000000000;
    n56[114] = 16'b1110000000000000;
    n56[113] = 16'b1110000000000000;
    n56[112] = 16'b1110000000000000;
    n56[111] = 16'b1110000000000000;
    n56[110] = 16'b1110000000000000;
    n56[109] = 16'b1110000000000000;
    n56[108] = 16'b1110000000000000;
    n56[107] = 16'b1110000000000000;
    n56[106] = 16'b1110000000000000;
    n56[105] = 16'b1110000000000000;
    n56[104] = 16'b1110000000000000;
    n56[103] = 16'b1110000000000000;
    n56[102] = 16'b1110000000000000;
    n56[101] = 16'b1110000000000000;
    n56[100] = 16'b1110000000000000;
    n56[99] = 16'b1110000000000000;
    n56[98] = 16'b1110000000000000;
    n56[97] = 16'b1110000000000000;
    n56[96] = 16'b1110000000000000;
    n56[95] = 16'b1110000000000000;
    n56[94] = 16'b1110000000000000;
    n56[93] = 16'b1110000000000000;
    n56[92] = 16'b1110000000000000;
    n56[91] = 16'b1110000000000000;
    n56[90] = 16'b1110000000000000;
    n56[89] = 16'b1110000000000000;
    n56[88] = 16'b1110000000000000;
    n56[87] = 16'b1110000000000000;
    n56[86] = 16'b1110000000000000;
    n56[85] = 16'b1110000000000000;
    n56[84] = 16'b1110000000000000;
    n56[83] = 16'b1110000000000000;
    n56[82] = 16'b1110000000000000;
    n56[81] = 16'b1110000000000000;
    n56[80] = 16'b1110000000000000;
    n56[79] = 16'b1110000000000000;
    n56[78] = 16'b1110000000000000;
    n56[77] = 16'b1110000000000000;
    n56[76] = 16'b1110000000000000;
    n56[75] = 16'b1110000000000000;
    n56[74] = 16'b1110000000000000;
    n56[73] = 16'b1110000000000000;
    n56[72] = 16'b1110000000000000;
    n56[71] = 16'b1110000000000000;
    n56[70] = 16'b1110000000000000;
    n56[69] = 16'b1110000000000000;
    n56[68] = 16'b1110000000000000;
    n56[67] = 16'b1110000000000000;
    n56[66] = 16'b1110000000000000;
    n56[65] = 16'b1110000000000000;
    n56[64] = 16'b1110000000000000;
    n56[63] = 16'b1110000000000000;
    n56[62] = 16'b1110000000000000;
    n56[61] = 16'b1110000000000000;
    n56[60] = 16'b1110000000000000;
    n56[59] = 16'b1110000000000000;
    n56[58] = 16'b1110000000000000;
    n56[57] = 16'b1110000000000000;
    n56[56] = 16'b1110000000000000;
    n56[55] = 16'b1110000000000000;
    n56[54] = 16'b1110000000000000;
    n56[53] = 16'b1110000000000000;
    n56[52] = 16'b1110000000000000;
    n56[51] = 16'b1110000000000000;
    n56[50] = 16'b1110000000000000;
    n56[49] = 16'b1110000000000000;
    n56[48] = 16'b1110000000000000;
    n56[47] = 16'b1110000000000000;
    n56[46] = 16'b1110000000000000;
    n56[45] = 16'b1110000000000000;
    n56[44] = 16'b1110000000000000;
    n56[43] = 16'b1110000000000000;
    n56[42] = 16'b1110000000000000;
    n56[41] = 16'b1110000000000000;
    n56[40] = 16'b1110000000000000;
    n56[39] = 16'b1110000000000000;
    n56[38] = 16'b1110000000000000;
    n56[37] = 16'b1110000000000000;
    n56[36] = 16'b1110000000000000;
    n56[35] = 16'b1110000000000000;
    n56[34] = 16'b1110000000000000;
    n56[33] = 16'b1110000000000000;
    n56[32] = 16'b1110000000000000;
    n56[31] = 16'b1110000000000000;
    n56[30] = 16'b1110000000000000;
    n56[29] = 16'b1110000000000000;
    n56[28] = 16'b1110000000000000;
    n56[27] = 16'b1110000000000000;
    n56[26] = 16'b1110000000000000;
    n56[25] = 16'b1110000000000000;
    n56[24] = 16'b1110000000000000;
    n56[23] = 16'b1110000000000000;
    n56[22] = 16'b1110000000000000;
    n56[21] = 16'b1110000000000000;
    n56[20] = 16'b1110000000000000;
    n56[19] = 16'b1110000000000000;
    n56[18] = 16'b1110000000000000;
    n56[17] = 16'b1110000000000000;
    n56[16] = 16'b1110000000000000;
    n56[15] = 16'b1110000000000000;
    n56[14] = 16'b1110000000000000;
    n56[13] = 16'b1110000000000000;
    n56[12] = 16'b1110000000000000;
    n56[11] = 16'b1110000000000000;
    n56[10] = 16'b1110000000000000;
    n56[9] = 16'b1110000000000000;
    n56[8] = 16'b1110000000000000;
    n56[7] = 16'b1110000000000000;
    n56[6] = 16'b1110000000000000;
    n56[5] = 16'b1110000000000000;
    n56[4] = 16'b1110000000000000;
    n56[3] = 16'b1110000000000000;
    n56[2] = 16'b0000110010100000;
    n56[1] = 16'b1010100000010100;
    n56[0] = 16'b1010010000001010;
    end
  assign n58 = n56[address];
  /*# src/instruction_memory.vhd:41:27 */
endmodule

module program_counter_Brtl
  (input  clk,
   input  reset,
   input  enable,
   input  pc_load,
   input  [7:0] load_addr,
   output [7:0] pc_out);
  reg [7:0] pc;
  wire [7:0] n41;
  wire [7:0] n42;
  wire [7:0] n43;
  wire [7:0] n45;
  reg [7:0] n48;
  assign pc_out = pc; //(module output)
  /*# src/program_counter.vhd:24:10 */
  always @*
    pc = n48; // (isignal)
  initial
    pc = 8'b00000000;
  /*# src/program_counter.vhd:38:18 */
  assign n41 = pc + 8'b00000001;
  /*# src/program_counter.vhd:37:7 */
  assign n42 = enable ? n41 : pc;
  /*# src/program_counter.vhd:35:7 */
  assign n43 = pc_load ? load_addr : n42;
  /*# src/program_counter.vhd:33:7 */
  assign n45 = reset ? 8'b00000000 : n43;
  /*# src/program_counter.vhd:31:5 */
  always @(posedge clk)
    n48 <= n45;
  initial
    n48 = 8'b00000000;
endmodule

module cpu
  (input  clk,
   input  reset,
   output halted,
   output [7:0] pc_debug,
   output [15:0] instruction_debug,
   output [7:0] r3_debug);
  wire [7:0] pc_current;
  wire [15:0] rom_instruction;
  wire [15:0] ir_instruction;
  wire [2:0] opcode;
  wire [2:0] rd;
  wire [2:0] rs1;
  wire [2:0] rs2;
  wire [6:0] immediate;
  wire [2:0] alu_op;
  wire decoder_write;
  wire [7:0] reg_data1;
  wire [7:0] reg_data2;
  wire [7:0] write_data;
  wire [7:0] reg3_debug;
  wire [7:0] alu_result;
  wire ir_load;
  wire pc_enable;
  wire pc_load;
  wire cu_write;
  wire cu_load;
  wire cu_halt;
  wire actual_reg_write;
  wire [7:0] n5;
  wire \decoder.load_imm ;
  wire \decoder.jump ;
  wire \decoder.halt ;
  wire \alu_unit.zero ;
  wire \alu_unit.carry ;
  wire n31;
  wire [7:0] n33;
  wire [7:0] n34;
  assign halted = cu_halt; //(module output)
  assign pc_debug = pc_current; //(module output)
  assign instruction_debug = ir_instruction; //(module output)
  assign r3_debug = reg3_debug; //(module output)
  /*# src/cpu.vhd:44:10 */
  assign write_data = n34; // (signal)
  /*# src/cpu.vhd:61:10 */
  assign actual_reg_write = n31; // (signal)
  /*# src/cpu.vhd:69:3 */
  program_counter_Brtl pc (
    .clk(clk),
    .reset(reset),
    .enable(pc_enable),
    .pc_load(pc_load),
    .load_addr(n5),
    .pc_out(pc_current));
  /*# src/cpu.vhd:76:22 */
  assign n5 = {1'b0, immediate};
  /*# src/cpu.vhd:84:5 */
  instruction_memory_Brom imem (
    .address(pc_current),
    .instruction(rom_instruction));
  /*# src/cpu.vhd:93:3 */
  instruction_register_Brtl ir (
    .clk(clk),
    .reset(reset),
    .load_en(ir_load),
    .instruction_in(rom_instruction),
    .instruction_out(ir_instruction));
  /*# src/cpu.vhd:106:3 */
  instruction_decoder_Brtl decoder (
    .instruction(ir_instruction),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .immediate(immediate),
    .alu_op(alu_op),
    .reg_write(decoder_write),
    .load_imm(),
    .jump(),
    .halt());
  /*# src/cpu.vhd:128:3 */
  register_file_Brtl rf (
    .clk(clk),
    .reset(reset),
    .we(actual_reg_write),
    .read_addr1(rs1),
    .read_addr2(rs2),
    .write_addr(rd),
    .write_data(write_data),
    .read_data1(reg_data1),
    .read_data2(reg_data2),
    .debug_r3(reg3_debug));
  /*# src/cpu.vhd:149:3 */
  alu_Brtl alu_unit (
    .a(reg_data1),
    .b(reg_data2),
    .alu_op(alu_op),
    .result(alu_result),
    .zero(),
    .carry());
  /*# src/cpu.vhd:164:3 */
  control_unit_Bfsm cu (
    .clk(clk),
    .reset(reset),
    .opcode(opcode),
    .ir_load(ir_load),
    .pc_enable(pc_enable),
    .pc_load(pc_load),
    .reg_write(cu_write),
    .load_imm(cu_load),
    .halt(cu_halt));
  /*# src/cpu.vhd:184:32 */
  assign n31 = cu_write & decoder_write;
  /*# src/cpu.vhd:186:22 */
  assign n33 = {1'b0, immediate};
  /*# src/cpu.vhd:186:35 */
  assign n34 = cu_load ? n33 : alu_result;
endmodule

