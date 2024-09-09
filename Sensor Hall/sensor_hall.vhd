library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity sensor_hall is
  port (
    clk       :  in  std_logic;
    val_hall  :  in  std_logic;
    rpm       :  out std_logic_vector(7 downto 0)
  ) ;
end sensor_hall;

architecture rpm of sensor_hall is

    signal cont      :  std_logic_vector(7 downto 0) := "00000000";
    signal val_pos   :  std_logic_vector(7 downto 0);

begin

  process(clk)
  begin
    if (rising_edge(clk)) then
      
      if (val_hall = '0') then
          cont <= cont + "00000001";
      
      elsif (val_hall = '1') then 
          if (cont > "00000000") then
            val_pos <= cont;
          end if; 
          cont <= "00000000";
      end if;
        
    end if;
  end process;
rpm <= val_pos;
      
end rpm;
