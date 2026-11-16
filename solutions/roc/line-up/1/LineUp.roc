LineUp :: {}.{
	format : Str, U64 -> Str
	format = |name, rank| {
    last_two = rank % 100
    suffix = match last_two {
        11 | 12 | 13 => "th"
        _ => {
            last_digit = rank % 10
            match last_digit {
                1 => "st"
                2 => "nd"
                3 => "rd"
                _ => "th"
            }
        }
    }
    "${name}, you are the ${rank.to_str()}${suffix} customer we serve today. Thank you!"
  }
}
