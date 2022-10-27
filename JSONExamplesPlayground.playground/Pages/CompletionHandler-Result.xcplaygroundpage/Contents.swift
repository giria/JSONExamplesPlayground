//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit






@available(iOS 15.0, *)
     public enum NetworkingError: Error {
        case unknown
        case unexpectedStatus(HTTPURLResponse)
    }


//func load(_ url: URL,
//     completionHandler: @escaping (Result<Data, Error>) -> Void)
//     -> URLSessionDataTask {
//         let task = URLSession.shared.dataTask(with: url) { data, response, error in
//         if let error = error {
//             completionHandler(.failure(error))
//         }
//
//         guard let httpResponse = response as? HTTPURLResponse,
//               let data = data else {
//             completionHandler(.failure(NetworkingError.unknown))
//             return
//         }
//
//         guard (200...299).contains(httpResponse.statusCode) else {
//             completionHandler(.failure(NetworkingError.unexpectedStatus(httpResponse)))
//             return
//         }
//
//         completionHandler(.success(data))
//             print(" Data: \(data)")
//             DispatchQueue.main.async() {
//                        let image = UIImage(data: data)
//                    }
//     }
//
//     task.resume()
//     return task
// }

func load(_ url: URL,
     completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
         let task = URLSession.shared.dataTask(with: url) { data, response, error in
         if let error = error {
             completionHandler(.failure(error))
         }
    
         guard let httpResponse = response as? HTTPURLResponse,
               let data = data else {
             completionHandler(.failure(NetworkingError.unknown))
             return
         }

         guard (200...299).contains(httpResponse.statusCode) else {
             completionHandler(.failure(NetworkingError.unexpectedStatus(httpResponse)))
             return
         }

         
             print(" Data: \(data)")
             DispatchQueue.main.async() {
                        let image = UIImage(data: data)
                 completionHandler(.success(image!))
                    }
             
     }

     task.resume()
 }




// using

let urlString = "https://dummyjson.com/image/i/products/1/1.jpg"
let url = URL(string: urlString)!
load(url) { result in
  switch result {
  case .success(let data): print(data)
  case .failure(let error): print(error)
  }
}




PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
