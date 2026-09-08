var beatles = ["John", "Paul", "George", "Ringo"]
// str
let numbers = [4, 8, 15, 16, 23, 42]
//int
var temperatures = [25.3, 28.2, 26.4]
//double


print(beatles[0])
print(numbers[1])
print(temperatures[2])
//This confuses beginners a bit, but Swift actually counts an item’s index from zero rather than one – beatles[0] is the first element, and beatles[1] is the second, for example.

beatles.append("Adrian")
// at to the end
// but .append() cannot be mixed str only add to str, int only to int.

//var scores = Array<Int>()
// Short way of:
var scores = [Int]()
// This MUST contain ONLY int
scores.append(110)
scores.append(20)
scores.append(35)
// add those numbers to
print(scores[0])
//the first number

print(scores.count)// 3numbers in this

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)// 4 names

characters.remove(at: 1)
print(characters.count)// remove the first name so 3 left

characters.removeAll()
print(characters.count)// remove all non left


//check whether an array contains a particular item by using contains()
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

//sort an array using sorted()
// for str is alphabetical
// for int will be 0123...
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())


//array by calling reversed() on it
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
//ReversedCollection<Array<String>>(_base: ["Bush", "Obama", "Trump", "Biden"])
//just remembers to itself that you want the items to be reversed

