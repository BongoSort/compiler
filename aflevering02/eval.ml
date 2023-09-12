(* -- Use this in your solution without modifications -- *)
(* Defining the type for binary operations *)
type binop = Add | Sub | Mul | Div

(* Defining the type for arithmetic expressions *)
type expr 
  = Int of int                       (* Integer constant *)
  | BinOp of binop * expr * expr     (* Binary operation *)

let expression_01 = Int 5                                         (* 5       *)

let expression_02 = BinOp (Add, Int 1, expression_01)             (* 1+5     *)

let expression_03 = BinOp (Mul, BinOp (Add, Int 2, Int 2), Int 2) (* (2+2)*2 *)

let expression_04 = BinOp (Add, Int 2, BinOp (Mul, Int 2, Int 2)) (* 2+2*2   *)

let expression_05 = BinOp (Mul, Int 2, BinOp (Sub, Int 4, Int 3)) (* 2*(4-3) *)

let expression_06 = BinOp (Mul, Int 2, BinOp (Div, BinOp(Add, Int 1, Int 2), Int 3)) (* 2*(1+2)/3 *)

let expression_zero = BinOp (Div, Int 42, Int 0)

let task3_exp1 = BinOp (Add, Int 20, BinOp (Mul, Int 26, Int 58))
let task3_exp2 = BinOp (Mul, Int 5, BinOp (Div, Int 1, Int 10))
let task3_exp3 = BinOp (Sub, Int 31, Int 870)
let task3_exp4 = BinOp (Mul, BinOp (Add, BinOp (Div, Int 6, BinOp (Add, Int 10, Int 49)), Int 10), 
          BinOp (Add, BinOp (Sub, BinOp (Mul, Int 70, Int 77), BinOp (Div, Int 12, Int 9)), Int 5))
let task3_exp5 = BinOp (Sub, BinOp (Div, Int 34, Int 72), BinOp (Div, Int 17, Int 46))

exception Division_by_zero

let rec eval (exp:expr) : int = 
  match exp with
  | Int n -> n
  | BinOp (op, left_exp, right_exp) ->
    let left_val = eval left_exp in
    let right_val = eval right_exp in
    match op with  
    | Add -> left_val + right_val
    | Sub -> left_val - right_val
    | Mul -> left_val * right_val
    | Div -> 
      if right_val == 0 then
        raise Division_by_zero
      else  
        left_val / right_val

let rec string_of_expr (exp:expr) : string =
  match exp with
  | Int n -> string_of_int n
  | BinOp (op, left_exp, right_exp) ->
    let left_str = string_of_expr left_exp in
    let right_str = string_of_expr right_exp in
    
    let left_need_parantheses () =
      match (op, left_exp, right_exp) with
      | (Mul, BinOp (Add, _, _), _)
      | (Mul, BinOp (Sub, _, _), _)
      | (Div, BinOp (Add, _, _), _)
      | (Div, BinOp (Sub, _, _), _) -> true
      | _ -> false
    in
    let right_need_parentheses () =
      match (op, left_exp, right_exp) with
      | (Mul, _, BinOp (Add, _, _))
      | (Mul, _, BinOp (Sub, _, _))
      | (Div, _, BinOp (Add, _, _))
      | (Div, _, BinOp (Sub, _, _)) -> true
      | _ -> false
    in
    let op_str = 
      match op with  
      | Add -> "+"
      | Sub -> "-"
      | Mul -> "*"
      | Div -> "/"
    in
    let left_str = 
      if left_need_parantheses () then
        "(" ^ left_str ^ ")"
      else
        left_str  
    in
    let right_str = 
      if right_need_parentheses () then
        "(" ^ right_str ^ ")"
      else
        right_str  
    in   
    left_str ^ op_str ^ right_str
    

let print_exp () =
  let expressions = [expression_01; expression_02; expression_03; expression_04; expression_05; expression_06] in
  let print_expr e = Printf.printf "%s = %d\n" (string_of_expr e) (eval e) in
  List.iter print_expr expressions


let print_task3 () =
  let tasks = [task3_exp1; task3_exp2; task3_exp3; task3_exp4; task3_exp5] in
  let print_tasks t = Printf.printf "%s = %d\n" (string_of_expr t) (eval t) in
  List.iter print_tasks tasks


