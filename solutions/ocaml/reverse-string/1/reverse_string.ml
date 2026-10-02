open Base

let reverse_string s =
    let b = Bytes.of_string s in
    let n = Bytes.length b in
    for i = 0 to (n / 2) - 1 do
      let j = n - 1 - i in
      let ci = Bytes.get b i in
      let cj = Bytes.get b j in
      Bytes.set b i cj;
      Bytes.set b j ci;
  done;
  Bytes.to_string b
