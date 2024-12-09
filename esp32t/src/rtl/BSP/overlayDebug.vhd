library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;     

entity overlayDebug is 
   port 
   (
      screenX       : in  unsigned(1 downto 0);
      screenY       : in  unsigned(2 downto 0);
      number        : in  unsigned(3 downto 0);
      overlayActive : out std_logic
   );   
end entity;

architecture arch of overlayDebug is

   type tpixeldata is array (0 to 4) of std_logic_vector(0 to 2);
   type tpixelarray is array(0 to 15) of tpixeldata;
   constant pixelarray : tpixelarray := 
   (
      ( "111", -- 0
        "101",
        "101",
        "101",
        "111"),
      ( "010", -- 1
        "110",
        "010",
        "010",
        "010"),
      ( "111", -- 2
        "001",
        "111",
        "100",
        "111"),
      ( "111", -- 3
        "001",
        "111",
        "001",
        "111"),
      ( "101", -- 4
        "101",
        "111",
        "001",
        "001"),
      ( "111", -- 5
        "100",
        "111",
        "001",
        "111"),
      ( "111", -- 6
        "100",
        "111",
        "101",
        "111"),
      ( "111", -- 7
        "001",
        "001",
        "001",
        "001"),
      ( "111", -- 8
        "101",
        "111",
        "101",
        "111"),
      ( "111", -- 9
        "101",
        "111",
        "001",
        "111"),
      ( "111", -- A
        "101",
        "111",
        "101",
        "101"),
      ( "110", -- B
        "101",
        "111",
        "101",
        "110"),
      ( "111", -- C
        "100",
        "100",
        "100",
        "111"),
      ( "110", -- D
        "101",
        "101",
        "101",
        "110"),  
      ( "111", -- E
        "100",
        "111",
        "100",
        "111"), 
      ( "111", -- F
        "100",
        "111",
        "100",
        "100")
   );
   
begin

   process (all)
   begin
      
      overlayActive <= '0';
      
      if (screenX < 3 and screenY < 5) then
         if (pixelarray(to_integer(number))(to_integer(screenY))(to_integer(screenX)) = '1') then
            overlayActive <= '1';
         end if;
      end if;
  
   end process;

   
end architecture;

