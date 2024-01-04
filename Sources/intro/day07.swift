import Cocoa

// We can write functions
func printSomething() {
  print("something")
}

printSomething()

// Functions can have arguments
func printTimesTable(number: Int) {
  for i in 1...12 {
    print("\(i) x \(number) is \(i * number)")
  }
}

// The call site has to use the argument label
printTimesTable(number: 3)

// Functions can return stuff!!
let root = sqrt(169)
print(root)

func rollDice() -> Int {
  Int.random(in: 1...20)
}

print("Player rolled \(rollDice())")

func areLettersIdentical(a: String, b: String) -> Bool {
  a.sorted() == b.sorted()
}

print(areLettersIdentical(a: "abc", b: "cba"))

func pythagoras(a: Double, b: Double) -> Double {
  sqrt(a * a + b * b)
}

print(pythagoras(a: 3, b: 4))


// We have tuples!
func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
let (firstName, _) = getUser()
print("Name: \(firstName)")

// We can opt out of having to write argument labels at call site
func isUppercase(_ string: String) -> Bool {
  string == string.uppercased()
}

print(isUppercase("ABC"))