open Base

let primes (n : int) : int list =
  let rec go = function
    | [] -> []
    | p :: rest ->
      p :: go (List.filter rest ~f:(fun x -> x mod p <> 0))
  in
  if n < 2 then [] else go (List.range 2 (n + 1))