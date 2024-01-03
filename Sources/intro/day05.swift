// We have the usual if statements (with optional parentheses)
if 0.isZero {
  print("Math checks out")
}

// Strings can be compared
if "a" < "z" {
  print("Alphabet checks out")
}

// isEmpty is a fast way to check for empty collections and strings
if "".isEmpty && [].isEmpty && [:].isEmpty {
  print("Empty stuff is empty")
}

// if can also be an expression
let result = if 1.isZero { "Math doesn't check out" } else { "Math checks out" }
print(result)

enum Screen {
  case home, search, settings
}

let currentScreen = Screen.home

let title = switch currentScreen {
  case .home: "Home screen"
  case .search: "Search screen"
  case .settings: "Settings screen"
}

print("\(currentScreen): \(title)")

// We have ranges
let statusCode = 401
let response = switch statusCode {
  case 200...299: "Everything went fine"
  case 300...399: "You should be somewhere else"
  case 400...499: "You did something wrong"
  case 500...599: "We did something wrong"
  default: "Unknown status"
}
print("\(statusCode): \(response)")

// And - we have ternaries (looking at you, Kotlin)
print(2.isZero ? "2 is zero?!" : "2 is not zero")