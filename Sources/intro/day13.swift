import Cocoa

// We have protocols, which can specify properties or methods
// Kinda C#-esque syntax for the properties.
protocol Vehicle {
  var name: String { get }
  var currentPassengers: Int { get set }
  func estimateTime(for distance: Int) -> Int
  func travel(distance: Int)
}

struct Car: Vehicle {
  let name = "Car"
  var currentPassengers = 1

  func estimateTime(for distance: Int) -> Int {
    distance / 50
  }

  func travel(distance: Int) {
    print("I'm driving \(distance)km.")
  }

  func openSunRoof() {
    print("It's a nice day!")
  }
}

func commute(distance: Int, using vehicle: Vehicle) {
  if vehicle.estimateTime(for: distance) > 100 {
    print("That's too slow! I'll try a different vehicle.")
  } else {
    vehicle.travel(distance: distance)
  }
}

let car = Car()
commute(distance: 100, using: car)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
  for vehicle in vehicles {
    let estimate = vehicle.estimateTime(for: distance)
    print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
  }
}

getTravelEstimates(using: [car], distance: 150)


// We have something called opaque return types. It lets the
// Swift compiler figure out the actual type for any given
// function call.
func getRandomNumber() -> any Equatable {
  Int.random(in: 1...6)
}

func getRandomBool() -> any Equatable {
  Bool.random()
}


// We have extensions!
extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

print("       lots of surrounding whitespace    \n     \t ".trimmed())


// Protocols can have extensions too!
let guests = ["Mario", "Luigi", "Peach"]

if !guests.isEmpty {
  print("Guest count: \(guests.count)")
}

extension Array {
  var isNotEmpty: Bool {
    !isEmpty
  }
}

if guests.isNotEmpty {
  print("Guest count: \(guests.count)")
}

extension Collection {
  var isNotEmpty: Bool {
    !isEmpty
  }
}

if ["one": 1].isNotEmpty {
  print("Dict is not empty!")
}