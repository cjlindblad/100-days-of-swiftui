// We have structs
struct Album {
  let title: String
  let artist: String
  let year: Int

  func summary() -> String {
    "\(title) (\(year) by \(artist))"
  }
}

// We can instanciate structs
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)

// Which is syntactic sugar for this
let red2 = Album.init(title: "Red", artist: "King Crimson", year: 1980)

print(red.summary())
print(red2.summary())


// Properties can be observed
struct Game {
  var score = 0 {
    didSet {
      print("Score is now \(score)")
    }
  }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// We get access to newVale and oldValue respectively
struct App {
  var contacts = [String]() {
    willSet {
      print("Current value is: \(contacts)")
      print("New value will be: \(newValue)")
    }
    didSet {
      print("There are now \(contacts.count) contacts.")
      print("Old value was \(oldValue)")
    }
  }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// Structs can have custom initializers
struct Player {
  let name: String
  let number: Int

  init(name: String, number: Int) {
    self.name = name
    self.number = number
  }

  init(name: String) {
    self.name = name
    self.number = Int.random(in: 1...99)
  }
}

let player = Player(name: "Megan R", number: 15)
let player2 = Player(name: "CJ")
print(player)
print(player2)