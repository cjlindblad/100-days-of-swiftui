// Arrays look like the commonly do
let lyrics = ["Hey", "ho", "let's", "go"]

// Mixed types has to be explicitly typed as [Any]
let anything: [Any] = [1, "wat", 13.37, false]

// Arrays indices are zero-based (thank god)
print("\(lyrics[0]) \(lyrics[1]), \(lyrics[2]) \(lyrics[3])!")

// Arrays can be appended to (IF array is declared as var!)
var countIn = [1, 2, 3]
countIn.append(4)

// Empty array literals requires a type..
let emptyInts: [Int] = []
// ..or an Array constructor call..
let emptyStrings = Array<String>()
// ..or via this variant
let emptyBools = [Bool]()

// Arrays of course have some useful methods
print("lyrics.count: \(lyrics.count)")
print("lyrics.contains(\"Hey\"): \(lyrics.contains("Hey"))")
print("lyrics.sorted(): \(lyrics.sorted())")
print("lyrics.reversed(): \(lyrics.reversed())")
print("\"Blitzkrieg bop\".sorted(): \("Blitzkrieg bop".sorted())")


// Dictionaries looks similar to arrays
let dict = [
  "name": "John Appleseed",
  "id": "12345",
  "role": "Tester"
]
// Values read from a dictionary are Optionals
let name = dict["name"]

// We can provide a default value
let nameOrDefault = dict["name", default: "Unknown"]
print(nameOrDefault)

// There's a couple of ways to create empty dictionaries
let emptyDict1: [String : Int] = [:]
let emptyDict2 = [Int : Bool]()

// We can make sets!
let set = Set([1, 2, 3, 1, 2, 3])
print("set: \(set)")

// We can make empty sets!
let emptyIntSet: Set<Int> = Set([])
let emptyBoolSet = Set<Bool>()

// We have the usual set methods
print("set.contains(2): \(set.contains(2))")
print("set.instersection(emptyIntSet): \(set.intersection(emptyIntSet))")
print("set.union(emptyIntSet): \(set.union(emptyIntSet))")


// There are enums
enum Language {
  case Clojure, FSharp, Elixir, Haskell, OCaml
}

let language = Language.Haskell
print(language)