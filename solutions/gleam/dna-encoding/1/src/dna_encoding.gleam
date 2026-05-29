import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
     Adenine -> 0b00
     Cytosine -> 0b01
     Guanine -> 0b10
     Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.fold(dna, <<>>, fn(acc, nuc) {
    let code = encode_nucleotide(nuc)
    <<acc:bits, code:2>>
  })
}

fn decode_loop(bits: BitArray, acc: List(Nucleotide)) -> Result(List(Nucleotide), Nil) {
    case bits {
      <<>> -> Ok(list.reverse(acc))
      <<code:2, rest:bits>> -> {
        case decode_nucleotide(code) {
          Ok(nuc) -> decode_loop(rest, [nuc, ..acc])
          Error(_) -> Error(Nil)
        }
      }
      _ -> Error(Nil) // Bits not a multiple of 2
    }
  }
pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {

  decode_loop(dna, [])

}
