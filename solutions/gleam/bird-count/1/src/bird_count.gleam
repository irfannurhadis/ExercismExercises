pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [hd, ..] -> hd   // ".." means "the rest of the list", any length ≥1
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [hd, ..rest] -> [hd + 1, ..rest]   
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
   case days {
    [] -> 0
    [hd, ..rest] -> hd + total(rest)
   }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
     [] -> 0
     [hd, ..rest] -> case hd { 
        hd if hd > 4 -> 1
        _ -> 0} + busy_days(rest)
  }
}
