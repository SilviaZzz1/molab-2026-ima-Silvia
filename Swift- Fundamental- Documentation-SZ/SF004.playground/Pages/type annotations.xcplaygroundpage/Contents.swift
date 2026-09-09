import Foundation

/*
let surname = "Lasso"
var score = 0
*/

let surname: String = "Lasso"
var score: Int = 0


//String holds text:

let playerName: String = "Roy"
//Int holds whole numbers:

var luckyNumber: Int = 13
//Double holds decimal numbers:

let pi: Double = 3.141
//Bool holds either true or false:

var isAuthenticated: Bool = true
//Array holds lots of different values, all in the order you add them. This must be specialized, such as [String]:

var albums: [String] = ["Red", "Fearless"]
//Dictionary holds lots of different values, where you get to decide how data should be accessed. This must be specialized, such as [String: Int]:
var user: [String: String] = ["id": "@twostraws"]

//Set holds lots of different values, but stores them in an order that’s optimized for checking what it contains. This must be specialized, such as Set<String>:
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//Knowing all these types is important for times when you don’t want to provide initial values. For example, this creates an array of strings:

// This is my array
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

//New empty array of strings they all the same choose one.
// var teams: [String] = [String]()
// var cities: [String] = []
var clues = [String]()


enum UIStyle {
    case light, dark, system
}
var style: UIStyle = .dark


// Type annotations
let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)


