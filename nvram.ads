with Ada.Strings.Bounded;
package Nvram is
   package Path is new Ada.Strings.Bounded.Generic_Bounded_Length(255);
   function Get_Console_Path return Path.Bounded_String;
   function Get_Primary_boot return Path.Bounded_String;
   function Get_HA_Alternate_Boot  return Path.Bounded_String;
   function Get_Alternate_boot return Path.Bounded_String;
   function Get_Autoboot return Boolean;
   --   procedure Put (item : in Path.Bounded_String);
   -- procedure Set_Primary (New_Path : in String);
end;
