// A basic class looks kinda like a struct
class Game {
  var score = 0 {
    didSet {
      print("Score is now \(score)")
    }
  }
}

var game = Game()
game.score += 20


// ..and - we have inheritance. Use with care.
class Employee {
  let hours: Int

  init(hours: Int) {
    self.hours = hours
  }

  func printSummary() {
    print("I work \(hours) hours a day.")
  }
}

class Developer: Employee {
  func work() {
    print("I'm writing code for \(hours) hours")
  }
}

class Manager: Employee {
  func work() {
    print("I'm going to meetings for \(hours) hours")
  }
}

let dev = Developer(hours: 8)
let suit = Manager(hours: 10)
dev.work()
dev.printSummary()
suit.work()
suit.printSummary()


// Inheritance init calls look like this (why is it always Vehicle)
class Vehicle {
  let isElectric: Bool

  init(isElectric: Bool) {
    self.isElectric = isElectric
  }
}

class Car: Vehicle {
  let isConvertible: Bool

  init(isElectric: Bool, isConvertible: Bool) {
    self.isConvertible = isConvertible
    super.init(isElectric: isElectric)
  }
}

let car = Car(isElectric: true, isConvertible: true)
print(car)


// Classes can have deinitializers
class User {
  let id: Int

  init(id: Int) {
    self.id = id
    print("User \(id): I'm alive!")
  }

  deinit {
    print("User \(id): I'm dead!")
  }
}

if true {
  let user = User(id: 1337)
  print(user)
}
print("user is out of scope")