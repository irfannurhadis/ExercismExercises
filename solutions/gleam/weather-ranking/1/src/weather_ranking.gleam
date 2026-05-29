import gleam/list
import gleam/order.{type Order, Eq, Gt, Lt}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

fn compare_floats(l: Float, r: Float) -> Order {
  case l, r {
    l, r if l >. r -> order.Gt
    l, r if l <. r -> order.Lt
    _, _ -> order.Eq
  }
}

fn to_celcius(temp: Temperature) -> Float {
  case temp {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  [left, right]
  |> list.map(to_celcius)
  |> fn(values) {
    case values {
      [l, r] -> compare_floats(l, r)
      _ -> order.Eq
    }
  }
}

fn compare_cities(a: City, b: City) -> Order {
  compare_temperature(a.temperature, b.temperature)
}

fn insert_city(sorted: List(City), city: City) -> List(City) {
  case sorted {
    [] -> [city]
    [hd, ..tl] ->
      case compare_cities(city, hd) {
        Lt | Eq -> [city, ..sorted]
        Gt -> list.append([hd], insert_city(tl, city))
      }
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.fold(over: cities, from: [], with: insert_city)
}
