(* Printing a list of programs *)

let string_of_progs (programs: X86.prog list) : string =
  String.concat "\n" (List.map X86.string_of_prog programs)

  
let list = (Exp.all_exp)  (* Access all_exp from the Exp module *)

let () =
  print_endline (string_of_progs list)


(* Use for utop printing *)
(* let _ = Printf.printf "%s\n" (string_of_prog exp5);; *)
(* let _ = Printf.printf "%s\n" (string_of_progs all_exp);; *)
