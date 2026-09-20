import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 30) {
                
                Text("MIDNIGHT")
                    .font(.largeTitle)
                    .bold()
                
                Text("Random thoughts from a sleepless city")
                    .foregroundStyle(.gray)
                
                NavigationLink("Enter") {
                    CanvasAnimView()
                }
                .padding()
                .background(Color.black)
                .foregroundStyle(.white)
                .cornerRadius(10)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
