import Foundation

// Use "+" to create a str
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)


let luggageCode = "1" + "2" + "3" + "4" + "5"
print(luggageCode)

//back slash helps combine int to join str.
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)


let number = 11
//let missionMessage = "Apollo " + number + " landed on the moon."
// this will not works because int cannot add to str
// SO do this:
let missionMessage = "Apollo \(number) landed on the moon."
print(missionMessage)

// working with var
var city = "New York"
var message1 = "Welcome to \(city)!"
print(message1)


