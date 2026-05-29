import gleam/list

pub fn wines_of_color(
  wines: List(Wine),
  color wanted_color: Color,
) -> List(Wine) {
  list.filter(wines, fn(wine) { wine.color == wanted_color })
}

pub fn wines_from_country(
  wines: List(Wine),
  country origin: String,
) -> List(Wine) {
  list.filter(wines, fn(wine) { wine.country == origin })
}

// Please define the required labelled arguments for this function
pub fn filter(
  wines: List(Wine),
  color wanted_color: Color,
  country origin: String,
) -> List(Wine) {
  wines |> wines_of_color(wanted_color) |> wines_from_country(origin)
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
