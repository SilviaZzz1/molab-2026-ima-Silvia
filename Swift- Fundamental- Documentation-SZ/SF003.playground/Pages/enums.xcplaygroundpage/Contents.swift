import Foundation

//a set of named values we can create and use in our code.

var selected = "Monday"
selected = "Tuesday"

selected = "January"//entered month
selected = "Friday "//space at the end

// Enums are the same: we get to list up front the range of values it can have, and Swift will make sure you never make a mistake using them.
/*
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
*/
//OR


enum Weekday1 {
    case monday, tuesday, wednesday, thursday, friday
}


//With that change you can’t accidentally use “Friday ” with an extra space in there, or put a month name instead – you must always choose one of the possible days listed in the enum. You’ll even see Swift offer up all possible options when you’ve typed Weekday.
var day = Weekday1.monday
day = .tuesday
day = .friday
day = .wednesday

print(day)// will be the last one
