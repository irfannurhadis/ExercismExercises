open Base

type nucleotide = A | C | G | T

let nucleotide_equal (x : nucleotide) (y : nucleotide) : bool =
  match x, y with
  | A, A | C, C | G, G | T, T -> true
  | _ -> false

let hamming_distance a b =
  let rec loop list_a list_b acc =
    match list_a, list_b with
    | [], [] -> Ok acc
    | x :: xs, y :: ys ->
      let increment = if nucleotide_equal x y then 0 else 1 in
      loop xs ys (acc + increment)
    | [], _ :: _ | _ :: _, [] -> Error "strands must be of equal length"
  in
  loop a b 0