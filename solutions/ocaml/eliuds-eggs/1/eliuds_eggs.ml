open Base

let egg_count (n : int) : int =
  let rec go n acc =
    if n = 0 then acc
    else go (Int.(land) n (Int.pred n)) (acc + 1)
  in
  go n 0