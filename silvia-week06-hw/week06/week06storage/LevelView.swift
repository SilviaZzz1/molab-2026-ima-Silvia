import SwiftUI
import Combine

struct LevelView: View {
    
    @StateObject private var motion = MotionManager()
    
    @State private var time = 0.0
    @State private var spilled = false
    @State private var results: [TestResult] = []
    
    @AppStorage("bestTime") var bestTime = 0.0
    
    let timer = Timer.publish(
        every: 0.1,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            Text("DON'T SPILL IT!")
                .font(.largeTitle)
                .bold()
            
            Text("\(time, specifier: "%.1f") sec")
                .font(.title)
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 4)
                    .frame(width: 260, height: 260)
                
                Circle()
                    .fill(.brown)
                    .frame(width: 55, height: 55)
                    .offset(
                        x: motion.x * 200,
                        y: motion.y * 200
                    )
            }
            
            Spacer()
            
            if spilled {
                
                Text("💦")
                    .font(.system(size: 60))
                
                Text("YOU SPILLED IT!")
                    .font(.title)
                    .bold()
                
                Text("Best: \(bestTime, specifier: "%.1f") sec")
                NavigationLink {
                    HistoryView()
                } label: {
                    Text("VIEW HISTORY")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.brown)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 10)
                
            } else {
                
                if abs(motion.x) < 0.08 &&
                    abs(motion.y) < 0.08 {
                    
                    Text("PERFECT ☕")
                        .font(.title2)
                        .bold()
                    
                } else {
                    
                    Text("CAREFUL...")
                        .font(.title2)
                        .bold()
                }
            }
        }
        .padding()
        .onAppear {

            results = loadResults()

        }
        .onReceive(timer) { _ in
            
            if !spilled {
                time += 0.1
                
                if abs(motion.x) > 0.35 ||
                    abs(motion.y) > 0.35 {
                    
                    spilled = true
                    
                    if time > bestTime {
                        bestTime = time
                    }
                    
                    let newResult = TestResult(time: time)

                    results.append(newResult)

                    saveResults(results)
                }
            }
        }
    }
}
