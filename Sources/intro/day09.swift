// We have closure expressions!
let printSomething = {
  print("I'm a closure expression!")
}

printSomething()

// They can take arguments
let add = { (a: Int, b: Int) -> Int in
  a + b
}

print(add(1, 2))

// There's trailing closure syntax (it's a lot like Kotlin)
print([1, 2, 3, 4, 5].sorted { a, b in
  b < a
})

// And even a shorthand syntax
print([1, 2, 3, 4, 5].sorted { $1 < $0 })
print((1...10).filter { $0.isMultiple(of: 2) })
print((1...10).map { $0 * 2 })