(* * @author Mike Jeuga (26.12.2023) *)

(** Sum a list 
    @param lst The list to be summed
    @return The sum of the list. *)

let square x = x * x
let inc x = x + 1

let rec sum = 
  function
  | [] -> 0
  | x::xs -> x + sum xs

let rec doubleLst = 
  function
  | [] -> []
  | x::xs -> [x*2] @ doubleLst xs

let rec print_list = 
  function
  | [] -> ()
  | x::xs -> print_int x; print_string " "; print_list xs


type day = Sunday 
| Monday 
| Tuesday 
| Wednesday 
| Thursday 
| Friday 
| Saturday


type person = {
  firstname: string;
  lastname: string;
  nickname: string
}

let mike = {
  firstname="Mike"; 
  lastname="Jeuga"; 
  nickname="KillerKam"
  }

let _ = "Hello, " ^ 
  (if 3 + 5 < 2 then "I am good" else "it sucks")
|> print_endline


let addx x = (fun y -> x + y)
let add5 = addx 5

let _ = add5 86
|> string_of_int
|> print_endline


let _ = ((let x = 42 in x))
|> inc
|> square
|> string_of_int
|> print_endline


 let _ = 17
|> inc
|> square
|> string_of_int
|> print_endline


let _ = "My name is " 
^ mike.firstname ^ " " 
^ mike.lastname
|> print_endline


let _ = [1; 2; 3; 4; 5] 
|> doubleLst 
|> print_list 
|> print_newline

let identity x = x;;
let follower = identity inc
let fois_x x = (fun y -> x * y)
let double = fois_x 2

let _ = double 15 |> print_int |> print_newline

let double_le_resultat_de (f: int -> int) = fun x -> double (f x)

let double_du_next = double_le_resultat_de inc

let _ = double_du_next 3
|> print_int
|> print_newline


let rec sigma formule n =
  match n with
  | 0 -> 0
  | _ -> formule(n) + sigma formule (n-1)


let _ = sigma double 10
|> print_int
|> print_newline

type longitude = float
type lattitude = float

type point = float * float
type coordinates = longitude * lattitude

let trois_entiers = 1 :: 2 :: 3 :: []

let empty = function
| [] -> true
| _ -> false

let point_a : 
  point = (1., 3.)
let point_b : 
  point = (4., 5.)

let get_abscisse = fun (x, _) -> x
let get_ordonnee = fun (_, y) -> y

let _ = get_abscisse point_a 
|> print_float 
|> print_newline

let cameroon_coordinate : 
  coordinates = (12.27, 14.56)

let _ = 
  get_ordonnee cameroon_coordinate
  |> print_float 
  |> print_newline

let head = 
  function
  | h::_t -> h
  | _ -> failwith "no head"

let _ = 
  head [4.8; 5.; 6.; 7.] 
  |> print_float
  |> print_newline

let rec produit =
  function
  | [] -> 1
  | x::xs -> x * produit xs


let rec insere ordre element = 
  function
  | [] -> [element]
  | x::xs as existing_list -> 
    if ordre element x then element::existing_list
      else x::(insere ordre element xs)


let rec insertion_sort ordre = 
  function
  | [] -> []
  | x::xs ->
  insere ordre x 
    (insertion_sort ordre xs)


let _ = 
insertion_sort
(function x -> function y -> x <= y) 
[4; 6; 7; 10; 1; 44; 15; 11; 5]
  |> print_list
  |> print_newline


let _ = 
  insertion_sort
  (function x -> function y -> x >= y) 
  [4; 6; 7; 10; 1; 44; 15; 11; 5] 
    |> print_list
    |> print_newline

let rec double_list double = 
  function
  | [] -> []
  | x::xs -> double x :: double_list double xs


let rec multiply_list multiplier = 
  function
  | [] -> []
  |x::xs -> multiplier x :: multiply_list multiplier xs


let rec reduction f accum = 
  function
  | [] -> accum
  | x::xs ->  reduction f (f x accum) xs 

let _ = 
  reduction 
  (function x -> function accum -> x + accum) 0 
  (doubleLst[4; 6; 7; 10; 1; 44; 15; 11; 5])
  |> print_int
  |> print_newline


  let rec fib n =
    match n with
    | n when n < 2 -> n
    | _ -> fib (n-2) + fib (n-1);;


  let _ =  fib 4 |> print_int |> print_newline;;

  
  let rec spell_backward mot i = 
    match i with
    | i when i < 0 -> ()
    | _ -> print_char mot.[i]; print_char ' ';
        spell_backward mot (i-1);;

        
  let _ = List.nth [4; 2; 9; 8; 6; 7] (List.length([4; 2; 9; 8; 6; 7])-2)
  |>  print_int 
  |> print_newline;;

  let rec implose xs = 
    match xs with
    | [] -> ""
    | x::xs -> x ^ implose xs;;


  let _ = implose ["Bonjour "; "tout "; "le " ; "monde"] 
  |> print_string 
  |> print_newline;;


  let my_tuple = (42, "Mike");;

  let p : point = (2., 3.);;

  let rec reverse = 
    function
    | [] -> []
    | x::xs -> (reverse xs) @ [x];;

  let rec fold_right f acc l= 
    match l with
    | [] -> acc
    | x::xs -> f x (fold_right f acc xs);;

  let _ = fold_right (+) 0 [4; 2; 9; 8; 6; 7]
  |> print_int 
  |> print_newline;;

  type longueur = float
  type largeur = float

  type shape = Circle of float 
               | Rectangle of largeur * longueur;;

        

  let a_small_circle = Circle 2.

  let rec pow x y = 
    match x, y with
    | _, y when y = 0 -> 1
    | x, y -> x * pow x (y -1);; 
  

  let _ = pow 6 3 
  |> print_int 
  |> print_newline;;


  let rec count n = 
    match n with
    | 0 -> 0
    | _ -> 1 + count (n-1);;

  let rec count_aux n acc = 
    match n with
    | 0 -> acc
    | _ -> count_aux (n-1) (acc + 1)

  let count_tr n = count_aux n 0

  let rec fact_aux n acc =
    match n with
    | 0 -> acc
    | _ -> fact_aux(n-1) (n * acc)

  let fact_tr n = fact_aux n 1;;

  let _ = fact_tr 50 
  |> print_int 
  |> print_newline;;

  let _ =  count_tr 1_000_000_000 
  |> print_int 
  |> print_newline;;

let rec insert sort element = 
  function
  | [] -> [element]
  | x::xs as l ->
    if sort element x then element::l
    else x::(insert sort element xs);;


let rec tri_insert sort l = 
  match l with
  | [] -> []
  | x::xs -> 
    insert sort x 
      (tri_insert sort xs);;