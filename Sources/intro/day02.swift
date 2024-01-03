// Booleans work as you might expect
let positive = true
let negative = false

// They can be inferred from expressions
let inferredBoolean = 12.isMultiple(of: 3)

// We can flip the value the usual way
print("I'm not true: \(!positive)")
// We can also flip and mutate a bool with a method
var mutableBool = true
mutableBool.toggle()
print("I'm not true either: \(mutableBool)")


// Strings can be concatenated the usual way
print("Hello" + " " + "world" + "!" + "?")

// We can also interpolate strings
print("Hello\(" ")\("world")\("!")\("?")")