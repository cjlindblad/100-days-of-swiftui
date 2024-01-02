// We can declare constants
let constant = "I will not change"

// And we can declare mutable variables
var mutable: String? = "I might change"
mutable = nil

// There's multi line strings
let multiLine = """
I 
have
many
lines
"""

// And string interpolation
print("Here comes many lines: \(multiLine)")

// Strings have methods/properties
print("multiLine length: \(multiLine.count)")
print("multiLine uppercased: \(multiLine.uppercased())")
print("Is tar file: \("someFile.tar".hasSuffix(".tar"))")

// Integer literals can use underscores for clarity
let oneBillion = 1_000_000_000
print(oneBillion)

// Integer division is truncated
print(5 / 2)

// Integers have methods and properties
print(12.isMultiple(of: 3))
print(1.bigEndian)

// Floating point numbers works as we're used to
print(0.1 + 0.2)

// We have to be explicit about type casting
let a = 1.0
let b = 2
let result = a + Double(b)