import Foundation

func saveResults(_ results: [TestResult]) {
    
    let encoder = JSONEncoder()
    
    if let data = try? encoder.encode(results) {
        
        let url = getDocumentsDirectory()
            .appendingPathComponent("results.json")
        
        try? data.write(to: url)
    }
}

func loadResults() -> [TestResult] {
    
    let url = getDocumentsDirectory()
        .appendingPathComponent("results.json")
    
    if let data = try? Data(contentsOf: url) {
        
        let decoder = JSONDecoder()
        
        if let results = try? decoder.decode(
            [TestResult].self,
            from: data
        ) {
            return results
        }
    }
    
    return []
}

func getDocumentsDirectory() -> URL {
    
    FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    )[0]
}
