

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instruction_memory is 
  Port (
  
  address : in std_logic_vector(7 downto 0);
  instruction : out std_logic_vector(15 downto 0)
       );
end instruction_memory;

architecture ROM of instruction_memory is 

  type rom_type is array (0 to 255) of 
    std_logic_vector(15 downto 0);

  constant ROM_DATA : rom_type := (

    --load r1, 10
    0 => "1010010000001010",

    --load r2, 20
    1 => "1010100000010100",

    --add r3, r1, r2
    2 => "0000110010100000",

    --halt
    3 => "1110000000000000",

    --unused memory location contain halt
    others => "1110000000000000"
);

begin 

  --combinational read 
  instruction <= ROM_DATA(to_integer(unsigned(address)));

end ROM;
