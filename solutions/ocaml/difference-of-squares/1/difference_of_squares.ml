open Base 

let fold_up f init n =
  Sequence.range 1 (n + 1)
  |> Sequence.fold ~init ~f:(fun acc k -> f k acc)

let sum_of_squares (n: int) : int = 
  fold_up (fun k acc -> acc + k * k) 0 n

let square_of_sum (n: int) : int =
  let sum = fold_up (fun k acc -> acc + k) 0 n in
  sum * sum

let difference_of_squares (n: int) : int = 
  square_of_sum n - sum_of_squares n