import Foundation

let score = 10
let reallyBig = 100_000_000
//Swift doesn’t actually care about the underscores, so if you wanted you could write this
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
//print(score)


var counter = 10
//counter = counter + 5
// is the same:
counter += 5
//it will use the results to continue doing math
//We call these compound assignment operators
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

//on an integer to find out whether it’s a multiple of another integer
let number = 120
print(number.isMultiple(of: 3))
// is the same：
// print(120.isMultiple(of: 3))



//Decimal Numbers
let number1 = 0.1 + 0.2
//print(number1)
//0.30000000000000004 not accurate

//let a = 1
//let b = 2.0
//let c = a + b
//Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
//therefore
let a = 1
let b = 2.0
let c = a + Int(b)
//OR
//let c = Double(a) + b
print(c)

// any number with a dot is a dobble(eg.7.0,7.1 etc)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3
// int cannot hold in str

var rating = 5.0
rating *= 2
print(rating)
