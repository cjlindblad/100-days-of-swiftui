enum SquareRootError: Error {
  case outOfBounds, noRoot
}

func squareRoot(_ n: Int) throws -> Int {
  if n < 1 || n > 10000 {
    throw SquareRootError.outOfBounds
  }

  var x = 1 
  while x * x <= n {
    if x * x == n {
      return x
    }

    x += 1
  }

  throw SquareRootError.noRoot
}

do {
  let root = try squareRoot(1)
  print(root)
} catch SquareRootError.outOfBounds {
  print("Argument out of bounds")
} catch SquareRootError.noRoot {
  print("No square root found")
} catch {
  print("Unknown error")
}