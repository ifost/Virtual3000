(* $Header: /home/cvs/Virtual3000/cpu/instructions.ml,v 1.1.1.1 2005/08/21 13:45:05 gregb Exp $ *)

open Registers;;
(* Based on PA-RISC 1.1 Architecture and Instruction Set Reference Manual *)

(* load word *)
let ldw  d (s,b) t
  = gr.(t) <<- d;;
