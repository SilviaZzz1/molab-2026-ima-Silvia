//: [Previous](@previous)

import Foundation

/*
 This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.
 */

let helloArray:[String] = ["a","k","m","a"]
print(helloArray.count)
print(Set(helloArray).count)
// Count how many items are in that Set. The number of unique items in the array.
