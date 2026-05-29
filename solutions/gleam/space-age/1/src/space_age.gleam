pub type Planet {
  Mercury
  Venus
  Earth
  Mars
  Jupiter
  Saturn
  Uranus
  Neptune
}

pub fn age(planet: Planet, seconds: Float) -> Float {
  let earth_year_in_s = 31_557_600.0

  let planet_factor = case planet {
     Mercury -> {0.2408467 *. earth_year_in_s}
     Venus -> 0.61519726 *. earth_year_in_s
     Earth -> 1.0 *.  earth_year_in_s
     Mars ->  1.8808158 *. earth_year_in_s
     Jupiter ->  11.862615 *. earth_year_in_s
     Saturn ->  29.447498 *. earth_year_in_s
     Uranus ->  84.016846 *. earth_year_in_s
     Neptune -> 164.79132 *. earth_year_in_s
  }
  seconds /. planet_factor
}
