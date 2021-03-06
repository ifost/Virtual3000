with Nvram;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded.Text_IO;
use Ada.Strings.Unbounded.Text_IO;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Strings.Maps;
use Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;
use Ada.Strings.Maps.Constants;
with Ada.Strings;
use Ada.Strings; -- to get Outside
with Ada.Characters.Handling;
use Ada.Characters.Handling;
with Cpu;
package body BCH is
   procedure Autoboot is
   begin
      null;
   end Autoboot;

   procedure Main_Menu is
    Command_choice  : Unbounded_String;
    From : Integer;
    To : Integer;
    First_word : Unbounded_string;
   begin
      New_Line;
      Put_Line("----------------------- Main Menu --------------------------");
      Put_Line("Command                       Description");
      Put_Line("BOot [PRI|ALT|<path>]         Boot from specified path");
      Put_Line("PAth [PRI|ALT] [<path>]       Display or modify a path");
      Put_Line("SEArch [DIsplay|IPL] [<path>] Search for boot devices");
      Put_Line("COnfiguration menu            Displays or sets boot values");
      Put_Line("INformation menu              Displays hardware information");
      Put_Line("SERvice menu                  Displays service commands");
      Put_Line("DIsplay                       Redisplay the current menu");
      Put_Line("HElp [<menu>|<command>]       Display help for menu or command");
      Put_Line("RESET                          Restart the system");
      Put_Line("---------");
      Put("Main Menu: Enter command or menu > ");
      Command_Choice := Ada.Strings.Unbounded.Text_IO.Get_line;
      Find_Token(Command_Choice, To_set(' '), Outside, From, To);
      if To > From then
          Put("You said ");
          First_word := To_Unbounded_string(To_Upper(To_String(Command_Choice)(From..To)));
           put(to_string(First_word));
      else
             Put("You didn't say much");
      end if;
     New_line;
   end  Main_Menu;


      procedure Pdc_Init is
      Interrupt_Char : Character;
      Typed_Something : Boolean;
          Speed : Integer;
      begin
               Put_Line("--------------------------------------------------------");
      Put_Line(" (c) Copyright 2008, Greg Baker");
      Put_Line("--------------------------------------------------------");
      New_Line;
      Put_Line("Processor  Speed        ");
      Put_Line("------------------------");

      Speed := Cpu.Speed;
      for I in 0.. Cpu.Count-1 loop
         Put(Integer'Image(I));
         Put("   ");
         Put(Integer'Image(Speed));
         PUt("  " & Cpu.Speed_Units & "  " & Cpu.Model);
      end loop;
      New_Line;
      New_Line;



     Put_Line("Virtual3000 Processor Dependent Code");
     New_Line;
     Put("Console path        = ");
     --Put("120.1");
     Put(Nvram.Path.To_String(Nvram.Get_Console_Path));
     New_Line;
     Put_Line("Primary boot path   = 0.1.1.0");
     Put_Line("HA Alternate path   = 0.1.2.0");
     Put_Line("Alternate boot path = 0.2.0.0");
     Put_Line("64 MB of memory configured and tested.");
     Put_Line("Autoboot from primary path enabled.");

     Put_Line("To override, press any key within 10 seconds");
     for Delay_Loop_Var in 1 .. 100 loop
        delay 0.1;
        Get_Immediate(Interrupt_Char,Typed_Something);
        if Typed_Something then
           exit;
        end if;
     end loop;
     if Typed_Something then
        Main_Menu;
     else
        Autoboot;
     end if;
   end Pdc_init;

end BCH;
