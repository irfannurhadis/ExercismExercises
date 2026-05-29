import gleam/string
import gleam/list
import gleam/int
import gleam/dict
import gleam/result
import gleam/order

pub fn tally(input: String) -> String {
  let header = "Team                           | MP |  W |  D |  L |  P"

  let lines =
    input
    |> string.split("\n")
    |> list.filter(fn(line) { string.trim(line) != "" })

  let stats =
    list.fold(lines, dict.new(), fn(acc, line) {
      case string.split(line, ";") {
        [team1, team2, result] -> update_stats(acc, team1, team2, result)
        _ -> acc
      }
    })

  let teams =
    stats
    |> dict.to_list()
    |> list.sort(fn(a, b) {
      let #(name1, s1) = a
      let #(name2, s2) = b
      case int.compare(s2.points, s1.points) {
        order.Eq -> string.compare(name1, name2)
        other    -> other
      }
    })

  let rows = list.map(teams, fn(team) { format_row(team) })

  [header, ..rows]
  |> string.join("\n")
}

type Stats {
  Stats(mp: Int, w: Int, d: Int, l: Int, points: Int)
}

fn empty_stats() -> Stats {
  Stats(0, 0, 0, 0, 0)
}

fn update_stats(
  stats: dict.Dict(String, Stats),
  team1: String,
  team2: String,
  result: String,
) -> dict.Dict(String, Stats) {
  let s1 = dict.get(stats, team1) |> result.unwrap(empty_stats())
  let s2 = dict.get(stats, team2) |> result.unwrap(empty_stats())

  let #(new1, new2) = case result {
    "win" -> #(
      Stats(s1.mp + 1, s1.w + 1, s1.d, s1.l, s1.points + 3),
      Stats(s2.mp + 1, s2.w, s2.d, s2.l + 1, s2.points),
    )
    "loss" -> #(
      Stats(s1.mp + 1, s1.w, s1.d, s1.l + 1, s1.points),
      Stats(s2.mp + 1, s2.w + 1, s2.d, s2.l, s2.points + 3),
    )
    "draw" -> #(
      Stats(s1.mp + 1, s1.w, s1.d + 1, s1.l, s1.points + 1),
      Stats(s2.mp + 1, s2.w, s2.d + 1, s2.l, s2.points + 1),
    )
    _ -> #(s1, s2)
  }

  stats
  |> dict.insert(team1, new1)
  |> dict.insert(team2, new2)
}

fn format_row(entry: #(String, Stats)) -> String {
  let #(name, stats) = entry
  let padded_name = string.pad_end(name, 30, " ")
  let mp = string.pad_start(int.to_string(stats.mp), 2, " ")
  let w  = string.pad_start(int.to_string(stats.w),  2, " ")
  let d  = string.pad_start(int.to_string(stats.d),  2, " ")
  let l  = string.pad_start(int.to_string(stats.l),  2, " ")
  let p  = string.pad_start(int.to_string(stats.points), 2, " ")
  padded_name <> " | " <> mp <> " | " <> w <> " | " <> d <> " | " <> l <> " | " <> p
}