//
//  CanvasAnimView.swift
//  Canvas-Explore
//

import SwiftUI

// Swift implementation inspired by 10Print
// Random windows with random thoughts

let animInterval = 0.10
let ncell = 10.0
let lineWidth = 3.0

let colorSpecs = [
    Color.yellow,
    Color.orange,
    Color.blue,
    Color.gray
]

let thoughts = [
    "can't sleep",
    "miss u",
    "hungry",
    "why?",
    "...",
    "deadline",
    "go home?",
    "tomorrow",
    "ERROR",
    "zzz"
]

var loc = CGPoint.zero
var nsize: CGSize = .zero


struct WindowData {
    var path: Path
    var color: Color
    var thought: String
    var showThought: Bool
}


var windows: [WindowData] = []


struct CanvasAnimView: View {
    
    var body: some View {
        
        TimelineView(.animation(minimumInterval: animInterval)) { timeline in
            
            Canvas { context, size in
                
                // Calculate size of each cell
                nsize = CGSize(
                    width: size.width / ncell,
                    height: size.width / ncell
                )
                
                
                // Create a random window
                let path = randomWindow(loc)
                
                // Pick random color from array
                let color = colorSpecs.randomElement()!
                
                // Pick random thought from array
                let thought = thoughts.randomElement()!
                
                // Randomly decide if this window has a thought
                let showThought = Int.random(in: 0..<8) == 0
                
                
                // Add window to windows array
                windows.append(
                    WindowData(
                        path: path,
                        color: color,
                        thought: thought,
                        showThought: showThought
                    )
                )
                
                
                // Draw all windows in windows array
                for window in windows {
                    
                    context.fill(
                        window.path,
                        with: .color(window.color)
                    )
                    
                    
                    // Only some windows show thoughts
                    if window.showThought {
                        
                        let box = window.path.boundingRect
                        
                        context.draw(
                            Text(window.thought)
                                .font(.system(size: 7))
                                .foregroundStyle(.black),
                            at: CGPoint(
                                x: box.midX,
                                y: box.midY
                            )
                        )
                    }
                }
                
                
                // Advance to next location
                loc.x += nsize.width
                
                if loc.x > size.width {
                    
                    loc.x = 0
                    loc.y += nsize.height
                    
                    if loc.y > size.height {
                        
                        loc.y = 0
                        windows = []
                    }
                }
                
                
                // must read to trigger update
                _ = timeline.date
            }
            .background(Color.black)
        }
    }
}


// Draw a window
func randomWindow(_ p: CGPoint) -> Path {
    
    var path = Path()
    
    let x = loc.x
    let y = loc.y
    
    let xlen = nsize.width
    let ylen = nsize.height
    
    
    let rect = CGRect(
        x: x + 4,
        y: y + 4,
        width: xlen - 8,
        height: ylen - 8
    )
    
    
    path.addRect(rect)
    
    return path
}


#Preview {
    CanvasAnimView()
}
