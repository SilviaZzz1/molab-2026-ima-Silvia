import SwiftUI

struct ContentView: View {
    
    @AppStorage("bestTime") var bestTime = 0.0
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 25) {
                
                Spacer()
                
                Text("☕")
                    .font(.system(size: 80))
                
                Text("DON'T SPILL IT!")
                    .font(.largeTitle)
                    .bold()
                
                Text("How steady are your hands?")
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                VStack(spacing: 5) {
                    
                    Text("BEST TIME")
                        .font(.caption)
                    
                    Text("\(bestTime, specifier: "%.1f") sec")
                        .font(.title)
                        .bold()
                }
                
                Spacer()
                
                NavigationLink {
                    HowToPlayView()
                } label: {
                    Text("START")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.brown)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                
            }
            .padding(30)
        }
    }
}
#Preview {
    ContentView()
}
