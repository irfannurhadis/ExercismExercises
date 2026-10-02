open Base

type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let complement (n: dna) : rna =
  match n with
  | `A -> `U
  | `C -> `G
  | `G -> `C
  | `T -> `A

let to_rna xs =
  List.map xs ~f:complement
