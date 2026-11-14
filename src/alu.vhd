
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
  port(
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    alu_op : in std_logic_vector(2 downto 0);

    result : out std_logic_vector(7 downto 0);
    zero : out std_logic;
    carry : out std_logic
      );

end entity alu;

architecture RTL of alu is 

begin

  process(all)
    
    variable temp : unsigned(8 downto 0);
    variable res : unsigned(7 downto 0);

  begin

    temp := (others => '0');
    res := (others => '0');

    carry <= '0';

    case alu_op is 

      --ADD 
      when "000" =>
        temp := ('0' & unsigned(a)) + ('0' & unsigned(b));

        res := temp(7 downto 0);
        carry <= temp(8);

      --Sub
      when "001" =>
        temp := ('0' & unsigned(a)) - ('0' & unsigned(b));

        res := temp(7 downto 0);

        if unsigned(a) < unsigned(b) then
          carry <= '1';
        end if;

      --And
      when "010" =>
        res := unsigned(a and b);

      --OR
      when "011" =>
        res := unsigned(a or b);

      --XOR
      when "100" =>
        res := unsigned(a xor b);

      --NOT a 
      when "101" =>
        res := unsigned(not a);

      --Shift left
      when "110" =>
        res := shift_left(unsigned(a), 1);
        carry <= a(7);

      --shift right
      when "111" =>
        res := shift_right(unsigned(a), 1);
        carry <= a(0);

      when others =>
        res := (others => '0');
        carry <= '0';

    end case;

    result <= std_logic_vector(res);

    if res = 0 then 
      zero <= '1';
    else 
      zero <= '0';
    end if;

  end process;

end architecture RTL;
