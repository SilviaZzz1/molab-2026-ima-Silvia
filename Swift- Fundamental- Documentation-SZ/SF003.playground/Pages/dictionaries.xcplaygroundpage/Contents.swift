import UIKit

var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
//if: employee.remove(at: 1)
// This will crash if I remove stuff
print("Job title: \(employee[1])")
print("Location: \(employee[2])")
// This will crash if I remove stuff

//So we can do
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
/*
print(employee2["name"])
print(employee2["job"])
print(employee2["location"])
So, Swift provides an alternative: when you access data inside a dictionary, it will tell us “you might get a value back, but you might get back nothing at all.” Swift calls these optionals because the existence of data is optional - it might be there or it might not.
*/

//simpler approach: when reading from a dictionary, you can provide a default value to use if the key doesn’t exist.
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

//Use track which students have graduated from school using strings for names and Booleans for their graduation status
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]
print(hasGraduated["Eric", default: true])
// I'm saying that eric is graduated but in record Eric is not so shows false

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])


//you want to store, then set keys one by one
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

//if you set a value for a key that already exists, Swift will overwrite whatever was the previous value.
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
//overwrite
archEnemies["Batman"] = "Penguin"
print(archEnemies)
//means remove all
archEnemies.removeAll()
print(archEnemies)
// count how many now in archEnemies should be 0
print(archEnemies.count)

