package body Nvram is
   Primary : Path.Bounded_string := Path.To_Bounded_String("0.1.1.0");
   HA_Alternate : Path.Bounded_string := Path.To_Bounded_STring("0.1.2.0");
   Alternate : Path.Bounded_string := Path.To_Bounded_STring("0.2.0.0");
   Console : Path.Bounded_string := Path.To_Bounded_STring("120.1");
   Autoboot : Boolean := True;

   function Get_Primary_Boot return Path.Bounded_string is
   begin
           return Primary;
   end;

   function Get_HA_Alternate_Boot return Path.Bounded_string is
   begin
           return HA_Alternate;
   end;

   function Get_Alternate_Boot return Path.Bounded_string is
   begin
           return Alternate;
   end;

   function Get_Console_Path return Path.Bounded_string is
   begin
           return Console;
   end;

   function Get_Autoboot return Boolean is
   begin
          return Autoboot;
   end;

end;
