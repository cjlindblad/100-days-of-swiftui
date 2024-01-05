// Structs can have access modifiers
struct BankAccount {
  private var funds = 0

  mutating func deposit(amount: Int) {
    funds += amount
  }

  mutating func withdraw(amount: Int) -> Bool {
    if funds >= amount {
      funds -= amount
      return true
    } else {
      return false
    }
  }
}

var account = BankAccount()
account.deposit(amount: 100)
if account.withdraw(amount: 200) {
  print("Withdrew money successfully")
} else {
  print("Failed to get the money")
}
print(account)


// Structs can have static members
struct School {
  static var studentCount = 0

  static func add(student: String) {
    print("\(student) joined the school.")
    studentCount += 1
  }
}

School.add(student: "Bob Ross")
print(School.studentCount)

// Static methods can be used to provide example data
struct Employee {
  let username: String
  let password: String

  static let example = Employee(username: "Alice", password: "12345")
}
print(Employee.example)