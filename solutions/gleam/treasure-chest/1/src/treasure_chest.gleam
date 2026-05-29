pub type TreasureChest(item) {
  TreasureChest(String, item)
}

pub type UnlockResult(treasure) {
  Unlocked(treasure)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(pass, item) if pass == password -> Unlocked(item)
    TreasureChest(_, _) -> WrongPassword
  }
}
