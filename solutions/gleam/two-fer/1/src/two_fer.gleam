import gleam/option.{type Option}

pub fn two_fer(name: Option(String)) -> String {
  let nomine = option.unwrap(name, "you")
  "One for " <> nomine <> ", one for me."
}
