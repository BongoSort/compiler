open X86

(* Expressions 1 to 5 below *)
let exp1 =
  let open Asm in  
    [ gtext "example" [
      (Pushq, [~% Rbp])         (* Stack alignment before call *)
    ; (Movq, [~$26; ~%Rsi])     (* Move 26 to rsi *)
    ; (Movq, [~$58; ~%Rdx])     (* Move 58 to rdx *)
    ; (Imulq, [~%Rsi; ~%Rdx])   (* Multiplying register rsi, rdx, save to rdx *)
    ; (Movq, [~$20; ~%Rdi])     (* Move 20 to rdi *)
    ; (Addq, [~%Rdx; ~%Rdi])    (* Add registers rdx and rdi, save to rdi *)
    ;  (Callq, [ ~$$ "print_int"])     (* Calling the C function to print *)
    ;  (Movq, [~$ 0; ~% Rax])          (* Return 0 to indicate normal exit *)
    ;  (Popq, [~% Rbp])                (* Stack re-alignment *)
    ;  (Retq, [])                       
    ]] 

let exp2 =
  let open Asm in  
    [ gtext "example" [
      (Pushq, [~% Rbp])        (* Stack alignment before call *)
    ; (Movq, [~$5; ~%Rsi])     (* Move 5 to rsi *)
    ; (Movq, [~$1; ~%Rax])     (* Move 1 to rax *)
    ; (Imulq, [~%Rsi; ~%Rax])  (* Multiplying register rsi, rax, save to rax *)
    ; (Cqto, [])               (* Extend word rax to octoword rdx:rax *)
    ; (Movq, [~$10; ~%Rdi])    (* Move 10 to rdi *)
    ; (Idivq, [~%Rdi])    (* Divide registers rdx and rdi, save qutient to rax, remainder to rdx *)
    ; (Movq, [~%Rax; ~%Rdi])    (* Calling convention, moving rax to rdi for returning *)
    ; (Callq, [ ~$$ "print_int"])     (* Calling the C function to print *)
    ;  (Movq, [~$ 0; ~% Rax])          (* Return 0 to indicate normal exit *)
    ;  (Popq, [~% Rbp])                (* Stack re-alignment *)
    ;  (Retq, [])                       
    ]]

let exp3 =
  let open Asm in  
    [ gtext "example" [
      (Pushq, [~% Rbp])        (* Stack alignment before call *)
    ; (Movq, [~$31; ~%Rdi])    
    ; (Movq, [~$870; ~%Rsi])  
    ; (Subq, [~%Rsi; ~%Rdi])  
    ; (Callq, [ ~$$ "print_int"])     (* Calling the C function to print *)
    ;  (Movq, [~$ 0; ~% Rax])          (* Return 0 to indicate normal exit *)
    ;  (Popq, [~% Rbp])                (* Stack re-alignment *)
    ;  (Retq, [])                       
    ]]

let exp4 =
  let open Asm in  
    [ gtext "example" [
      (Pushq, [~% Rbp])        (* Stack alignment before call *)
    ; (Movq, [~$10; ~%Rcx])    (* 10 in rcx *)
    ; (Movq, [~$49; ~%R09])  
    ; (Addq, [~%Rcx; ~%R09])    (* (10+49) in R09 *)
    ; (Movq, [~$6; ~%Rax])      (* 6 in Rax *)
    ; (Cqto, [])
    ; (Idivq, [~%R09])          (* 6/(10+49) in rax *)
    ; (Movq, [~%Rax; ~%Rbx])    (* 6/(10+49) in rbx *)
    ; (Addq, [~%Rcx; ~%Rbx])    (* 6/(10+49) + 10 in rbx*)
    ; (Movq, [~$70; ~%R08])    
    ; (Movq, [~$77; ~%R09])
    ; (Imulq, [~%R09; ~%R08])   (* 70*77 in R08 *)
    ; (Movq, [~$5; ~%R11])      (* 5 in R11*) 
    ; (Movq, [~$12; ~%Rax])     (* 12 in Rax *)
    ; (Cqto, [])
    ; (Movq, [~$9; ~%R10])      (* 9 in R10 *)
    ; (Idivq, [~%R10])          (* 12/9 in Rax *)
    ; (Addq, [~%R11; ~%R08])    (* 70*77+5 in R08*) 
    ; (Subq, [~%Rax; ~%R08])    (*  70*77+5-12/9 in R08 *)
    ; (Imulq, [~%Rbx; ~%R08])   (* (6/(10+49)+10)*(70*77-12/9+5) in  Rbx *)
    ; (Movq, [~%R08; ~%Rdi])    (* Rbx to Rdi*)
    ; (Callq, [ ~$$ "print_int"])     (* Calling the C function to print *)
    ;  (Movq, [~$ 0; ~% Rax])          (* Return 0 to indicate normal exit *)
    ;  (Popq, [~% Rbp])                (* Stack re-alignment *)
    ;  (Retq, [])                       
    ]]

let exp5 =
  let open Asm in  
    [ gtext "example" [
      (Pushq, [~% Rbp])       (* Stack alignment before call *)
    ; (Movq, [~$34; ~%Rax])   (* 34 in Rax *)
    ; (Cqto, [])
    ; (Movq, [~$72; ~%Rbx])   (* 72 in Rbx *)
    ; (Idivq, [~%Rbx])        (* 34/72 in Rax *)
    ; (Movq, [~%Rax; ~%Rcx])  (* 34/72 in Rcx *)
    ; (Movq, [~$17; ~%Rax])   (* 17 in Rax *)
    ; (Cqto, [])
    ; (Movq, [~$46; ~%Rbx])   (* 46 in Rbx *)
    ; (Idivq, [~%Rbx])        (* 17/46 in Rax *)
    ; (Subq, [~%Rax; ~%Rcx])  (* 34/72 - 17/46 in Rcx *)
    ; (Movq, [~%Rcx; ~%Rdi])  (* result to rdi*)
    ; (Callq, [ ~$$ "print_int"])     (* Calling the C function to print *)
    ;  (Movq, [~$ 0; ~% Rax])          (* Return 0 to indicate normal exit *)
    ;  (Popq, [~% Rbp])                (* Stack re-alignment *)
    ;  (Retq, [])                       
    ]]


let all_exp =  
  [exp1 ; exp2 ; exp3 ; exp4 ; exp5]
