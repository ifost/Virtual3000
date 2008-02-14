package Nvram is
   Console_Path : String := "120.1";
   Primary_boot : String(1..100) ; --  := "120.1";
   HA_Alt_Boot  : String(1..100) ; -- := "120.1";
   Alternate_boot : String(1..100) ; --  := "120.1";
   Autoboot : Boolean;
   --   procedure Put (item : in Path);
   procedure Set_Primary (New_Path : in String);
end;
