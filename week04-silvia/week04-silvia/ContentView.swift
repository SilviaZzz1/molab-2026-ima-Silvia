import SwiftUI

struct ContentView: View {
    
    let currentTime = Date()
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 25) {
                
                Text(timeEmoji())
                    .font(.system(size: 80))
                
                Text(greeting())
                    .font(.title)
                
                Text(currentTime, style: .time)
                    .font(.title2)
                    .foregroundStyle(.gray)
                
                Text("Sound of the Day")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Text("How does today feel?")
                    .font(.title2)
                
                NavigationLink("🌧 Rainy") {
                    SoundView(
                        mood: "Rainy",
                        sound: "rain"
                    )
                }
                
                NavigationLink("☕ Cozy") {
                    SoundView(
                        mood: "Cozy",
                        sound: "cafe"
                    )
                }
                
                NavigationLink("🌙 Sleepy") {
                    SoundView(
                        mood: "Sleepy",
                        sound: "night"
                    )
                }
            }
            .padding()
        }
    }
    
    
    func greeting() -> String {
        
        let hour = Calendar.current.component(
            .hour,
            from: currentTime
        )
        
        if hour < 12 {
            return "Good morning"
        } else if hour < 18 {
            return "Good afternoon"
        } else {
            return "Good evening"
        }
    }
    
    
    func timeEmoji() -> String {
        
        let hour = Calendar.current.component(
            .hour,
            from: currentTime
        )
        
        if hour < 12 {
            return "☀️"
        } else if hour < 18 {
            return "☁️"
        } else {
            return "🌙"
        }
    }
}
