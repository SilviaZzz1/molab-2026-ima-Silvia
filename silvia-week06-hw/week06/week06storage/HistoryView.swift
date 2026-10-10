import SwiftUI

struct HistoryView: View {
    
    @State private var results: [TestResult] = []
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("COFFEE TEST HISTORY")
                .font(.largeTitle)
                .bold()
            
            if results.isEmpty {
                
                Spacer()
                
                Text("☕")
                    .font(.system(size: 60))
                
                Text("No tests yet")
                    .font(.title2)
                
                Text("Try the Coffee Test first!")
                    .foregroundStyle(.secondary)
                
                Spacer()
                
            } else {
                
                List {
                    
                    ForEach(results.reversed()) { result in
                        
                        HStack {
                            
                            Text("☕")
                            
                            Text("Survived")
                            
                            Spacer()
                            
                            Text("\(result.time, specifier: "%.1f") sec")
                                .bold()
                        }
                    }
                }
            }
        }
        .padding()
        
        .onAppear {
            results = loadResults()
        }
    }
}
