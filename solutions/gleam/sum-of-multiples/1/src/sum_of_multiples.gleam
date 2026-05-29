import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  // If the limit is 1 or less, there are no natural numbers to evaluate.
  case limit <= 1 {
    True -> 0
    False -> {
      let valid_factors = list.filter(factors, fn(f) { f > 0 })

      list.range(1, limit - 1)
      |> list.filter(fn(number) {
        list.any(valid_factors, fn(factor) { number % factor == 0 })
      })
      |> int.sum
    }
  }
}