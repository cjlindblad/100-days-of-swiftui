enum Gear {
  case one, two, three, four, five, reverse, parking
}

struct Car {
  let model: String
  let seats: Int
  private(set) var gear: Gear = Gear.parking

  mutating func changeGear(_ gear: Gear) {
    self.gear = gear
  }
}

var car = Car(model: "Volvo", seats: 5)
print(car)
car.changeGear(Gear.five)
print(car)
