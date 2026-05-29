pub fn is_leap_year(year: Int) -> Bool {
  case year {
    _ if year % 400 == 0 -> True
    _ if year % 100 == 0 -> False
    _ if year % 4 == 0   -> True
    _                    -> False
  }
}