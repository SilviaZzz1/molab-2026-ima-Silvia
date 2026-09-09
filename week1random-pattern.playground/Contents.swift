import Foundation

// My collection of pattern symbols
let symbols = ["🩷", "💜", "💙", "🤍", "⭐️"]

// Print how many symbols we have
print("Number of symbols:", symbols.count)

// Create a Set to find how many unique symbols there are
let uniqueSymbols = Set(symbols)
print("Number of unique symbols:", uniqueSymbols.count)

print("")

// Pick one random symbol from the array
func randomSymbol() -> String {
    let randomNumber = Int.random(in: 0..<symbols.count)
    return symbols[randomNumber]
}

// Generate one line
func generateLine(_ width: Int) {
    var line = ""

    for _ in 0..<width {
        line += randomSymbol()
    }

    print(line)
}

// Generate a whole block
func generateBlock(_ width: Int, _ height: Int) {
    for _ in 0..<height {
        generateLine(width)
    }
}

print("My Random Pattern:")
print("")

generateBlock(8, 8)
