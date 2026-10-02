open Base

let raindrop (n: int): string =
  match n mod 3 = 0, n mod 5 = 0, n mod 7 = 0 with
  | true, true, true -> "PlingPlangPlong"
  | true,  true,  false -> "PlingPlang"
  | true,  false, true  -> "PlingPlong"
  | true,  false, false -> "Pling"
  | false, true,  true  -> "PlangPlong"
  | false, true,  false -> "Plang"
  | false, false, true  -> "Plong"
  | false, false, false -> Int.to_string n
