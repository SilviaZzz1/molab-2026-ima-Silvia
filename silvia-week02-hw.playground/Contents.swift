import Foundation

let thoughts = [
    "can't sleep",
    "miss u",
    "hungry",
    "why?",
    "...",
    "deadline",
    "go home?",
    "thinking",
    "tomorrow",
    "ERROR",
    "zzz",
    "what if?"
]

func randomThought() -> String {
    let index = Int.random(in: 0..<thoughts.count)
    return thoughts[index]
}

func makeWindow() -> String {
    let randomNumber = Int.random(in: 0..<4)

    if randomNumber == 0 {
        return "##"
    } else {
        return "[]"
    }
}

func makeSky(_ width: Int, _ height: Int) {

    for _ in 0..<height {

        var line = ""

        for _ in 0..<width {

            let randomNumber = Int.random(in: 0..<30)

            if randomNumber == 0 {
                line += "*"
            } else if randomNumber == 1 {
                line += "."
            } else {
                line += " "
            }
        }

        print(line)
    }
}

func makeCell(_ window: String) -> String {

    let cellWidth = 14

    var text = ""

    if window == "##" {
        text = randomThought()
    }

    if text.count > cellWidth {
        text = String(text.prefix(cellWidth))
    }

    let spaces = cellWidth - text.count

    return text + String(repeating: " ", count: spaces)
}

func makeFloor() {

    let window1 = makeWindow()
    let window2 = makeWindow()
    let window3 = makeWindow()

    let thought1 = makeCell(window1)
    let thought2 = makeCell(window2)
    let thought3 = makeCell(window3)

    print("|--------------|--------------|--------------|")

    print("|      \(window1)      |      \(window2)      |      \(window3)      |")

    print("|\(thought1)|\(thought2)|\(thought3)|")

    print("|              |              |              |")
}

func makeCity() {

    print("")

    makeSky(47, 5)

    print("")

    if Bool.random() {
        print("                                      _..._")
        print("                                    .'     '.")
        print("                                   (   moon  )")
        print("                                    '.___.'")
    }

    print("")

    let floors = Int.random(in: 5...8)

    for _ in 0..<floors {
        makeFloor()
    }

    print("|--------------|--------------|--------------|")

    print("")
    print("               NEW YORK, 3AM")
    print("")
    print("          ## = someone is awake")
    print("          [] = lights are off")
    print("")
}

makeCity()
