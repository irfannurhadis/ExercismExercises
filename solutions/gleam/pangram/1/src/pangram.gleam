import gleam/list
import gleam/set
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_utf_codepoints
  |> list.fold(set.new(), fn(seen, char) {
      let code = string.utf_codepoint_to_int(char)
      case code >= 97 && code <= 122 {
          True -> set.insert(seen, code)
          False -> seen
      }
  })
  |> set.size
  |> fn(size) { size == 26}
}
