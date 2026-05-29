import gleam/string
import gleam/result
import gleam/list

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  let words = string.split(full_name, " ")
  case words {
    [first, last, ..] -> initial(first) <> " " <> initial(last)
    _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let heart_template =
    "\n     ******       ******\n"
    <> "   **      **   **      **\n"
    <> " **         ** **         **\n"
    <> "**            *            **\n"
    <> "**                         **\n"
    <> "**     X. X.  +  X. X.     **\n"
    <> " **                       **\n"
    <> "   **                   **\n"
    <> "     **               **\n"
    <> "       **           **\n"
    <> "         **       **\n"
    <> "           **   **\n"
    <> "             ***\n"
    <> "              *\n"

  let combined = initials(full_name1) <> "  +  " <> initials(full_name2)

  heart_template |> string.replace("X. X.  +  X. X.", combined)
}
