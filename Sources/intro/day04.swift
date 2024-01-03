// Types can be inferred
let value = "wat"

// Or explicitly annotated
let number: Double = 0
print(number)

// Enum example
enum UIStyle {
  case light, dark, system
}

var uiStyle: UIStyle
uiStyle = .dark
print(uiStyle)