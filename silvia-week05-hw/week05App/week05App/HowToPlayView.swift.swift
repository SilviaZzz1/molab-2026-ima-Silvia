import SwiftUI

struct HowToPlayView: View {
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            Spacer()
            
            Text("HOW TO PLAY")
                .font(.largeTitle)
                .bold()
            
            Text("☕")
                .font(.system(size: 70))
            
            Text("Keep your phone balanced.")
                .font(.title2)
            
            Text("The longer you keep the coffee steady, the better.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            
            Text("Tilt too far and you spill it.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            NavigationLink {
                LevelView()
            } label: {
                
                Text("I'M READY")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.brown)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
            }
            
        }
        .padding(30)
        .navigationTitle("")
    }
}
