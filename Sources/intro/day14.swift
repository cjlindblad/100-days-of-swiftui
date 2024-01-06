// Swift has optionals
let opposites = [
  "Mario": "Wario",
  "Luigi": "Waluigi"
]

// They have to be unwrapped before use
["Mario", "Peach", "Luigi"].forEach {
  if let opposite = opposites[$0] {
    print("\($0)'s opposite is \(opposite)")
  }
}

// We can also use guard clauses
func printSquare(of number: Int?) {
  guard let number else {
    print("Missing input")
    return
  }

  print("\(number) x \(number) is \(number * number).")
}

printSquare(of: 3)
printSquare(of: nil)


// We have nil coalescing!
let captains = [
  "Enterprise": "Picard",
  "Voyager": "Janeway",
  "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let number = Int(input) ?? 0


// And we have optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// There's also an optional try (try?)
enum UserError: Error {
  case badID, networkFailed
}

func getUser(id: Int) throws -> String {
  throw UserError.networkFailed
}

if let user = try? getUser(id: 1337) {
  print("User: \(user)")
} else {
  print("Could not get user")
}