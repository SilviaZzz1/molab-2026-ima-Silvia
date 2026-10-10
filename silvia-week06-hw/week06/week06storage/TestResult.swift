import Foundation

struct TestResult: Codable, Identifiable {
    var id: UUID
    var time: Double
    
    init(time: Double) {
        self.id = UUID()
        self.time = time
    }
}

