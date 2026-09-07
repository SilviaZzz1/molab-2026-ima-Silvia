import UIKit

//In both places there’s always a simple true or false answer, which is where Booleans come in – they store just that, and nothing else.
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))


// ! means not equal to
var isAuthenticated = false
print(isAuthenticated)
isAuthenticated = !isAuthenticated
// if isAuthenticated is FALSE =! not equal to FALSE is TRUE
print(isAuthenticated)

// In particular, if you call toggle() on a Boolean it will flip a true value to false, and a false value to true.
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)
// only work with variables not constant

//Booleans only T OR F
