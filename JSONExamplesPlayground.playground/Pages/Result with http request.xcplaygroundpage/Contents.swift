//: [Previous](@previous)

import Foundation
import PlaygroundSupport

@available(iOS 15.0, *)
struct Product: Codable {
    var id: Int
    var description: String
}

enum URLError: Error {
    case noData, decodingError
}
/// A type safe URL loader that either completes with success value or error with Error
   func jsonDecodableTask<T: Decodable>(with url: URLRequest, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
       URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
           DispatchQueue.main.async {
               guard error == nil else {
                   completion(.failure(error!))
                   return
               }
               guard let data = data, let _ = response else {
                   completion(.failure(URLError.noData))
                   return
               }
               do {
                   let decoded = try decoder.decode(T.self, from: data)
                   completion(.success(decoded))
               } catch  {
                   completion(.failure(error))
               }
           }
       }
   }



// Calling the method
let urlRequest = URL(string: "https://dummyjson.com/products/1")!
var request = URLRequest(url: urlRequest)
jsonDecodableTask(with: request){  (result: Result<Product, Error>) in
    switch result {
      case .success(let product):
        print("Product.id: \(product.id)")
        print("Description:   \(product.description)")
      case .failure(let error):
          print(error)
      }
  }.resume()



PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
