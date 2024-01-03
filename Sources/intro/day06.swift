// We can loop over stuff in collections with for loops
for letter in "Hi, mom!" {
  print(letter)
}

// Ranges with ... include their upper bound
for n in 1...3 {
  print(n)
}

// Ranges with ..< exclude their upper bound
for n in 1..<3 {
  print(n)
}

// Ranges can be used on arrays, and only supply the start index!
let numbers = [0, 1, 3, 3, 7]
print(numbers[1...])
