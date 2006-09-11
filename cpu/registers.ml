(* $Header: /home/cvs/Virtual3000/cpu/registers.ml,v 1.1.1.1 2005/08/21 13:45:05 gregb Exp $ *)

(* Page 21 of pa11_acd (section 2-1) *)

(* General registers *)

type 'a register_read_func = 'a array -> int -> (unit -> 'a)
type 'a register_write_func = 'a array -> int -> ('a -> unit)

(* Actually, I have no idea what a space_identifier will be. *)
type space_identifier = Int32.t;;

let normal_register_read register_array index =
  function () -> register_array.(index)
;;
let normal_register_write register_array index =
  function newvalue -> register_array.(index) <- newvalue
;;

let gr0_write register_array index = function newvalue -> ();;
let gr0_read register_array index =  function () -> Int32.zero ;;


let ( <<- ) (readfunc,writefunc) newvalue =  writefunc newvalue

(** General registers *)

let gr_data = Array.create 32 Int32.zero;;
let gr = Array.create 32 (normal_register_read gr_data 0,
			 normal_register_write gr_data 0);;
(* Except that gr.(0) always holds the value zero, regardless of what
   you set it to.  *)
gr.(0) <- (gr0_read gr_data 0,gr0_write gr_data 0);;
(* The other general registers are normal, you've just got to include the 
   indexes so that we know which one we're referring to. 
   gr.(1) is the target for ADDIL
   Also gr.(31)) does something to do with BRANCH AND LINK EXTERNAL 
   Haven't implemented either yet.
*)   
for i = 1 to 31 do
  gr.(i) <- (normal_register_read gr_data i,normal_register_write gr_data i)
done;;


(** Shadow registers *)

let shr_data = Array.create 32 Int32.zero
let shr = Array.create 7 (normal_register_read shr_data 0, normal_register_write shr_data 0);;
(* Presumably it is possible to write to shadow registers? *)
for i = 0 to 6 do
  shr.(i) <- (normal_register_read shr_data i,normal_register_write shr_data i)
done

let shadow () =
  shr_data.(0) <- gr_data.(1) ;
  shr_data.(1) <- gr_data.(8) ;
  shr_data.(2) <- gr_data.(9) ;
  shr_data.(3) <- gr_data.(16) ;
  shr_data.(4) <- gr_data.(17) ;
  shr_data.(5) <- gr_data.(24) ;
  shr_data.(6) <- gr_data.(25)
;;

(* Space registers *)

let sr_data = Array.create 8 (Int32.zero);;

(* Processor status word *)

let psw_data = ref Int32.zero;;

(* Instruction address queues *)

(*
let iasq = ref (space_identifier * space_identifier);;
*)
 (* I think that's current and following *)
(*
let iaoq = ref ((offset * pl) * (offset * pl));;
*)

(* Control registers *)

let cr = Array.create 32 (Int32.zero);;

(* Special Function Unit registers?? *)

(* Coprocessors registers *)

(* floating-point registers *)

let fpr = Array.create 32 0.0;;

