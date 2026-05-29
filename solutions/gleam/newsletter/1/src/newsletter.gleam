import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
     Ok(content) -> {
        content
        |> string.split("\n")
        |> list.filter(fn(line) {line != ""})
        |> Ok
     }
      Error(_) -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.write(path, "") {
    Ok(Nil) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  case simplifile.append(path, email <> "\n") {
     Ok(Nil) -> Ok(Nil)
     Error(_) -> Error(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use emails <- result.try(read_emails(emails_path))
  use _ <- result.try(create_log_file(log_path))

  list.each(emails, fn(email) {
    case send_email(email) {
      Ok(_) -> { 
        let _ = log_sent_email(log_path, email)
        Nil }
      Error(_) -> Nil
    }
  })
  Ok(Nil)
}
