//: [Previous](@previous)



//: ## Uses dummyJson

//: [dummyJson](https://dummyjson.com/docs/http)

import Foundation
import PlaygroundSupport


let url =  URL(string: "https://dummyjson.com/products/1")!


   URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
         if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
         }
       }
       if let httpResponse = response as? HTTPURLResponse {
           print("statusCode: \(httpResponse.statusCode)")
       }
   }.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
