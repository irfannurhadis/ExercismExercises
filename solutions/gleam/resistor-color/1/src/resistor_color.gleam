import gleam/list
import gleam/result

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

const color_table: List(#(Color, Int)) = [
  #(Black, 0),
  #(Brown, 1),
  #(Red, 2),
  #(Orange, 3),
  #(Yellow, 4),
  #(Green, 5),
  #(Blue, 6),
  #(Violet, 7),
  #(Grey, 8),
  #(White, 9),
]

pub fn code(color: Color) -> Int {
  list.find(color_table, fn(pair) { pair.0 == color })
  |> result.map(fn(pair) { pair.1 })
  |> result.unwrap(10)
}

pub fn colors() -> List(Color) {
  list.map(color_table, fn(pair) { pair.0 })
}
