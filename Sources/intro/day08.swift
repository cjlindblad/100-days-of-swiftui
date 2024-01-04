// Function parameters can have default values
func printTimesTable(for number: Int, end: Int = 12) {
  for i in 1...end {
    print("\(i) x \(number) is \(i * number)")
  }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

// We can use enums to represent errors
enum PasswordError: Error {
  case short, obvious
}

func checkPassword(_ password: String) throws -> String {
  if password.count < 5 {
    throw PasswordError.short
  }

  if password == "12345" {
    throw PasswordError.obvious
  }

  if password.count < 8 {
    return "OK"
  } else if password.count < 10 {
    return "Good"
  } else {
    return "Excellent"
  }
}

do {
  let result = try checkPassword("12345")
  print(result)
} catch PasswordError.short {
  print("Password too short")
} catch PasswordError.obvious {
  print("Password too obvious")
} catch {
  print("ERROR")
}