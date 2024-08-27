open OUnit2
open Lec

let tests = "tests suite for the sum" >::: [
  "empty" >:: (fun _ -> assert_equal 0 (sum []));
  "one" >:: (fun _ -> assert_equal 1 (sum [1]));
  "onetwo" >:: (fun _ -> assert_equal 3 (sum [1; 2]));
]


let _ = run_test_tt_main tests