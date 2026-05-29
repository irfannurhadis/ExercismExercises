import gleam/int
import gleam/list
import gleam/string

pub fn convert(number: Int) -> String {
  let factors = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
  let matching_sounds = factors
    |> list.filter(fn(pair) { number % pair.0 == 0})
    |> list.map(fn(pair) { pair.1 })
  case matching_sounds {
    [] -> int.to_string(number)
    _ -> string.concat(matching_sounds)
  }
}