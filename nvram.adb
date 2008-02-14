with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
package body Nvram is
   procedure Set_Primary (New_Path : in String) is
   begin
      Primary_Boot := New_Path;
   end;

end;
