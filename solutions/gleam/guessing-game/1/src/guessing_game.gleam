pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    _ if guess >= 41 && guess < 44 -> "So close"
    _ if guess <= 40 -> "Too low"
    _ -> "Too high"
  }
}
