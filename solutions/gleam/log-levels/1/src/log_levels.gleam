import gleam/string

pub fn message(log_line: String) -> String {
  let msg = case log_line {
    "[ERROR]: " <> msg -> msg
    "[INFO]: " <> msg -> msg
    "[WARNING]: " <> msg -> msg
    _ -> "UNKNOWN"
  }
  msg |> string.trim()
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> _ -> "error"
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    _ -> "UNKNOWN"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
