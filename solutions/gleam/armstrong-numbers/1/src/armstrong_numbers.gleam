/// Validates whether a given integer is an Armstrong Number.
///
/// **Time Complexity:** $O(L \log L)$ where $L$ is the number of digits.
/// **Space Complexity:** $O(1)$ auxiliary space due to guaranteed Tail-Call Optimization.
pub fn is_armstrong_number(number: Int) -> Bool {
  // Armstrong numbers are mathematically undefined for negative integers.
  case number < 0 {
    True -> False
    False -> {
      let len = count_digits(number)
      sum_of_powers(number, len) == number
    }
  }
}

/// Counts the number of digits in an integer using an optimized tail-recursive loop.
/// This acts as our first pass over the number, running in $O(L)$ time.
fn count_digits(n: Int) -> Int {
  case n {
    0 -> 1
    _ -> count_digits_loop(n, 0)
  }
}

fn count_digits_loop(n: Int, acc: Int) -> Int {
  case n {
    0 -> acc
    _ -> count_digits_loop(n / 10, acc + 1)
  }
}

/// Computes the sum of each digit raised to the power of `len`.
/// This is our second pass over the number, extracting digits from least to 
/// most significant.
fn sum_of_powers(n: Int, len: Int) -> Int {
  sum_of_powers_loop(n, len, 0)
}

fn sum_of_powers_loop(n: Int, len: Int, acc: Int) -> Int {
  case n {
    0 -> acc
    _ -> {
      let digit = n % 10
      // We pass the accelerated binary exponentiation result to the accumulator
      sum_of_powers_loop(n / 10, len, acc + int_power(digit, len))
    }
  }
}

/// Pure integer exponentiation using the **Binary Exponentiation** algorithm
/// (Exponentiation by Squaring).
///
/// This replaces the linear $O(L)$ loop with an $O(\log L)$ halving process, 
/// making it highly compute-efficient.
fn int_power(base: Int, exponent: Int) -> Int {
  power_loop(base, exponent, 1)
}

fn power_loop(base: Int, exponent: Int, acc: Int) -> Int {
  case exponent {
    0 -> acc
    _ -> {
      // Check if the exponent is odd using a modulo check
      case exponent % 2 == 1 {
        True -> {
          // If odd, multiply the accumulator by the current base 
          // and decrement exponent by 1 (handled implicitly by integer division next)
          power_loop(base * base, exponent / 2, acc * base)
        }
        False -> {
          // If even, square the base and halve the exponent exponent
          power_loop(base * base, exponent / 2, acc)
        }
      }
    }
  }
}