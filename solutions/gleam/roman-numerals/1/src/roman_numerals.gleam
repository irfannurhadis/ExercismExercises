import gleam/list
import gleam/string
pub fn convert(number: Int) -> String {
  let rules = [
    #(1000, "M"), #(900, "CM"), #(500, "D"), #(400,"CD"),
    #(100, "C"), #(90, "XC"), #(50, "L"), #(40, "XL"),
    #(10, "X"), #(9, "IX"), #(5, "V"), #(4, "IV"), #(1, "I")
  ]
  let #(_, out) =
    list.fold(rules, #(number, ""), fn(acc, rule) {
      let #(remain, result) = acc
      let #(value, symbol) = rule
      let count = remain / value
      #(remain - count * value, result <> string.repeat(symbol, count))
    })

  out

}
