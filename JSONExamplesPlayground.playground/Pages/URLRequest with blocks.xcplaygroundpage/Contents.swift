//: [Previous](@previous)

import Foundation
import PlaygroundSupport

let url = URL(string: "http://stackoverflow.com")!

URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
        print(error ?? "Unknown error")
        return
    }
    if let httpResponse = response as? HTTPURLResponse {
        print("statusCode: \(httpResponse.statusCode)")
    }
    let contents = String(data: data, encoding: .utf8)
    print(contents!)
}.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
