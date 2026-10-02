open Base

let empty = Map.empty (module Char)

let is_nucleotide = function
  | 'A' | 'C' | 'G' | 'T' -> true
  | _ -> false

let find_invalid s =
  String.find s ~f:(fun c -> not (is_nucleotide c))

let count_nucleotide s c =
  if not (is_nucleotide c) then Error c
  else match find_invalid s with
    | Some bad -> Error bad
    | None -> Ok (String.count s ~f:(Char.equal c))
    
let count_nucleotides s =
  match find_invalid s with
  | Some bad -> Error bad
  | None ->
    Ok (String.fold s ~init:(Map.empty (module Char))
          ~f:(fun m c ->
            Map.update m c ~f:(function
              | None -> 1
              | Some n -> n + 1)))