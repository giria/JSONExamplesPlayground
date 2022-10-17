//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit




//func downloadImage(from url: URL) {
//    print("Download Started")
//    URLSession.shared.dataTask(with: url)  { data, response, error in
//
//        guard let data = data, error == nil else { return }
//        print(response?.suggestedFilename ?? url.lastPathComponent)
//        print("Download Finished")
//        // always update the UI from the main thread
//        DispatchQueue.main.async() {
//            let image = UIImage(data: data)
//        }
//    }.resume()
//}
//
//
//print("Begin of code")
//let url = URL(string: "https://dummyjson.com/image/i/products/1/1.jpg")!
//downloadImage(from: url)
//print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
//
//
//enum ImgError: Error {
//    case badURL
//}

// works

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
     completionHandler: @escaping (Result<UIImage, Error>) -> Void)
     -> URLSessionDataTask {
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
     return task
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


// Now with async await

func fetchImages() async throws -> [UIImage] {
    // .. perform data request
}


//using the async await
do {
    let images = try await fetchImages()
    print("Fetched \(images.count) images.")
} catch {
    print("Fetching images failed with error \(error)")
}

PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
