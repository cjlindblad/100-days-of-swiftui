protocol Building {
  var rooms: Int { get }
  var cost: Int { get }
  var agent: String { get }
}

extension Building {
   var summary: String {
     "\(rooms) rooms for $\(cost). Sold by \(agent)."
   }
}

struct House: Building {
  let rooms: Int
  let cost: Int
  let agent: String
}

struct Office: Building {
  let rooms: Int
  let cost: Int
  let agent: String
}

let house = House(rooms: 3, cost: 100_000, agent: "Cozy Houses")
let office = Office(rooms: 40, cost: 10_000_000, agent: "Real Estate")
print(house.summary)
print(office.summary)