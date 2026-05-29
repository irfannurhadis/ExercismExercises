import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  case languages {
    [_car, ..rest] -> 1 + count_languages(rest)
    [] -> 0
  }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  case languages {
    [first, ..rest] -> list.append(reverse_list(rest), [first])
    [] -> []
  }
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam"] -> True
    [_, "Gleam", _] -> True

    _ -> False
  }
}
