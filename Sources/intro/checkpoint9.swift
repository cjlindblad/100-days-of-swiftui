func random(in integers: [Int]?) -> Int {
  integers?.randomElement() ?? Int.random(in: 1...100)
}

print(random(in: nil))
print(random(in: Array(1...20)))