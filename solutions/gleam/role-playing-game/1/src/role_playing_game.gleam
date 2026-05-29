import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    // High-level: level >= 10
    _ if player.health <= 0 && player.level >= 10 ->
      Some(Player(..player, health: 100, mana: Some(100)))
    // Lowe-level : health only
    _ if player.health <= 0 -> Some(Player(..player, health: 100))
    // Alive: can not revive
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    // Enough mana -> spend, deal 2*cost
    Some(m) if m >= cost -> #(Player(..player, mana: Some(m - cost)), 2 * cost)
    Some(_) -> #(player, 0)
    None -> {
      let new_health = int.max(0, player.health - cost)
      #(Player(..player, health: new_health), 0)
    }
  }
}
