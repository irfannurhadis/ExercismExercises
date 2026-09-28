let rec pow_acc base exp acc =
  if exp = 0 
  then acc
  else pow_acc base (exp - 1) (acc * base)
let int_pow b e = pow_acc b e 1

let rec explode n acc =
  if n < 10 then n :: acc
  else explode (n / 10) ((n mod 10) :: acc)

let sum_powers ds  p =
  List.fold_left (fun acc d -> acc + int_pow d p) 0 ds

let validate n = 
  let ds = explode n [] in
  sum_powers ds (List.length ds) = n