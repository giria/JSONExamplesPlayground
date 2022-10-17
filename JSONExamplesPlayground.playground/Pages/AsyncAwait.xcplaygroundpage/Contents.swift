//: [Previous](@previous)
import Foundation
import PlaygroundSupport
import UIKit

@available(iOS 15.0, *)
     public enum NetworkingError: Error {
        case unknown
        case unexpectedStatus(HTTPURLResponse)
    }

func load(_ url: URL) async throws -> UIImage {
    return try await withCheckedThrowingContinuation { continuation in
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                continuation.resume(with: .failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  let data1 = data else {
                continuation.resume(with: .failure(NetworkingError.unknown))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                continuation.resume(with: .failure(NetworkingError.unexpectedStatus(httpResponse)))
                return
            }
            
            
            print(" Data: \(data1)")
            DispatchQueue.main.async() {
                let image = UIImage(data: data1)
                continuation.resume(with: .success(image!))
            }
            
        }
        
        task.resume()
    }
}

// using the function
Task.init {
    let urlString = "https://dummyjson.com/image/i/products/1/1.jpg"
    let url = URL(string: urlString)
    do {
        // 1. Call the method
        let image = try await load(url!)
        // 2. Fetch images method returns
        
        
        
        
        print("Fetched \(image.description) ")
    } catch {
        print("Fetching images failed with error \(error)")
    }
    // 5. The calling method exits
}
    
    PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
