package body Cpu is
   function Count return Integer is
   begin
      return 1;
   end;

   function Speed return Integer is
   begin
      return 100;
   end;

   function Speed_Units return String is
   begin
      return "MhZ";
   end;

   function Model return String is
   begin
      return "PA7300";
   end;
end CPU;
