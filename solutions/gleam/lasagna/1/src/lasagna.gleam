/// Total minutes a lasagna is expected to stay in the oven.
pub fn expected_minutes_in_oven() -> Int {
  40
}

/// Minutes remaining given how many have already passed.
pub fn remaining_minutes_in_oven(minutes_passed: Int) -> Int {
  expected_minutes_in_oven() - minutes_passed
}

/// Preparation time is 2 minutes per layer.
pub fn preparation_time_in_minutes(layers: Int) {
  layers * 2
}

/// Total time spent so far: prep time + minutes already in the oven.
pub fn total_time_in_minutes(layers, passed) {
  preparation_time_in_minutes(layers) + passed
}

/// Friendly alarm message when the lasagna is ready.
pub fn alarm() {
  "Ding!"
}
