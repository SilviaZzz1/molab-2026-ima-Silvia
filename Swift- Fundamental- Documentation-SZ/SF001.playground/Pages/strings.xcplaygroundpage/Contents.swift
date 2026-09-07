 import Foundation

//strings start and end with double quotes
let actor = "Kitty"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

//use \" use other double quotes inside your string
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote)
//Then he tapped a sign saying "Believe" and walked away.

// multi-line using """
 let multiline = """
hahaha
yeah
okay
"""
//the triple quotes at the start and end are ON THEIR OWN LINE, with your string in between.

print(result.count)
//12 is 12characters including the space in this string
//OR

let nameLength = result.count
print(nameLength)

// UpperCased
print(result.uppercased())
//⭐️ YOU WIN! ⭐️
//.uppercased() bracket need include but won't work with .count so if need use count go organic...

//hasPrefix,hasSuffix
//hasPrefix is find something the first letter and needs stay the same with uper or lower case else it will run false.
print(multiline.hasPrefix("ha"))

//hasSuffix is find something the  a string ends with and needs stay the same with uper or lower case else it will run false.
print(filename.hasSuffix(".jpg"))
