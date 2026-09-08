import Foundation

// the set just doesn’t care what order its items come in.
/*
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
 print answer can be variety
 */

//The second important difference when adding items to a set is visible when you add items individually.

//using insert() to ADD
var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")
//print(people)

 //NO storing duplicates
//Alongside contains(), you’ll also find count to read the number of items in a set, and sorted() to return a sorted array containing the the set’s items.

//Search for
//print(people.contains("Denzel Washington"))

//Make Order
//print(people.sorted())


//Set only stores unique values, the duplicate "Red" is removed.
//This is a set
var colors = Set(["Red", "Green", "Red"])


