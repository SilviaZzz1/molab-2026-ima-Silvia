import UIKit

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

//&& has a counterpart that is two pipe symbols, ||, which means “or”. Whereas && will only make a condition be true if both subconditions are true, || will make a condition be true if either subcondition is true.

let degree = 20

if degree > 13 && degree < 30 {
    print("good day")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}
//The code using || to check whether transport is equal to .airplane or equal to .helicopter, and if either of them are true then the condition is true, and “Let’s fly!” is printed./
