let dist_sq x y =
  x *. x +. y *. y
  
let classify d2 =
  if d2 <= 1. then 10
  else if d2 <= 25. then 5
  else if d2 <= 100. then 1
  else 0

let score (x: float) (y: float): int =
  classify (dist_sq x y)